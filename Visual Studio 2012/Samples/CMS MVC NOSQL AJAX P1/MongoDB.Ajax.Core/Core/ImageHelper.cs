using System;
using System.Drawing;
using System.Drawing.Drawing2D;
using System.Drawing.Imaging;
using System.Drawing.Text;
using System.IO;
using System.Text.RegularExpressions;

namespace MongoDB.Ajax.Core
{
    public enum WatermarkPosition
    {

        TopLeft = 1,
        TopRight = 2,
        TopCenter = 3,
        BottomLeft = 4,
        BottomRight = 5,
        BottomCenter = 6,
        Center = 0

    }


    public class ImageHelper
    {
        public static bool IsGraphic(string FileName)
        {
            var _regex = new Regex(@"^.+\.(jpg|jpeg|png|bmp)$", RegexOptions.IgnoreCase);
            return _regex.IsMatch(FileName);
        }

        public static void ResizeImage(string source, string outputPath, Size _size)
        {
            ResizeImage(source, outputPath, _size.Width, _size.Height, null, 0, 0);

        }

        public static void ResizeImage(string source, string outputPath, int width, int height, string watermark, int watermarkPosition, double opacity)
        {


            try
            {
                using (Stream _fileStream = new FileStream(source, FileMode.Open))
                {
                    ResizeStream(_fileStream, outputPath, width, height, watermark, (WatermarkPosition)watermarkPosition, opacity);
                }
            }
            catch (Exception ex)
            {

                /*   Logging.Log(source);
                   Logging.Log(outputPath);

                   Logging.Log("ResizeImage: "+ex);*/

                throw new InvalidOperationException(outputPath + " - " + ex.ToString());
            }





            /*

            var _image = Image.FromFile(source);

            
            // Widht and height defined
            int _newWidth = width, _newHeight = height;


            // Only width defined
            if (width > 0 && height < 1)
            {
                if (_image.Width <= width)
                {
                    _newWidth = _image.Width;
                    _newHeight = _image.Height;
                    //return new Size(image.Width, image.Height);
                }
                else
                {
                    float _dim = _image.Height / (float)_image.Width;
                    _newHeight = (int)(_dim * width);
                    //return new Size(width, (int)(dim * width));
                }

            }

            // Only height defined
            if (width < 1 && height > 0)
            {
                if (_image.Height <= height)
                {
                    _newWidth = _image.Width;
                    _newHeight = _image.Height;

                }
                else
                {
                    float _dim = _image.Width / (float)_image.Height;

                    _newWidth = (int)(_dim * height);


                }
            }

            var _bitmap = new Bitmap(_newWidth, _newHeight);
            var _graphic = Graphics.FromImage(_bitmap);
            _graphic.InterpolationMode = InterpolationMode.HighQualityBicubic;
            _graphic.SmoothingMode = SmoothingMode.HighQuality;
            _graphic.PixelOffsetMode = PixelOffsetMode.HighQuality;
            _graphic.CompositingQuality = CompositingQuality.HighQuality;
            var _imageRectangle = new Rectangle(0, 0, _newWidth, _newHeight);
            _graphic.DrawImage(_image, _imageRectangle);
            _bitmap.Save(outputPath, _image.RawFormat);
            _graphic.Dispose();
            _bitmap.Dispose();
            _image.Dispose();
             * */
        }



        public static void ResizeStream(Stream source, string outputPath, int width, int height, string watermarkLogo, WatermarkPosition position, double opacity)
        {
            var _image = Image.FromStream(source);

            int _newWidth = width, _newHeight = height;

            // Only width defined
            if (width > 0 && height < 1)
            {
                if (_image.Width <= width)
                {
                    _newWidth = _image.Width;
                    _newHeight = _image.Height;
                }
                else
                {
                    float _dim = _image.Height / (float)_image.Width;
                    _newHeight = (int)(_dim * width);

                }

            }

            // Only height defined
            if (width < 1 && height > 0)
            {
                if (_image.Height <= height)
                {
                    _newWidth = _image.Width;
                    _newHeight = _image.Height;

                }
                else
                {
                    float dim = _image.Width / (float)_image.Height;
                    _newWidth = (int)(dim * height);

                }
            }

            var _bitmap = new Bitmap(_newWidth, _newHeight);

            var _graphic = Graphics.FromImage(_bitmap);
            _graphic.InterpolationMode = InterpolationMode.HighQualityBicubic;
            _graphic.SmoothingMode = SmoothingMode.HighQuality;
            _graphic.PixelOffsetMode = PixelOffsetMode.HighQuality;
            _graphic.CompositingQuality = CompositingQuality.HighQuality;
            _graphic.SmoothingMode = SmoothingMode.AntiAlias;
            _graphic.TextRenderingHint = TextRenderingHint.AntiAlias;
            var _imageRectangle = new Rectangle(0, 0, _newWidth, _newHeight);
            _graphic.DrawImage(_image, _imageRectangle);

            if (!String.IsNullOrEmpty(watermarkLogo))
            {
                Image _water = Image.FromFile(watermarkLogo);

                if (_water.Height < _newHeight && _water.Width < _newWidth)
                {
                    DrawImage(ref _bitmap, _water, position, opacity);
                }
                _water.Dispose();
            }

            string _path = outputPath.Substring(0, outputPath.LastIndexOf("\\"));

            if (!Directory.Exists(_path))
            {
                Directory.CreateDirectory(_path);
            }


            _bitmap.Save(outputPath, _image.RawFormat);
            _graphic.Dispose();
            _bitmap.Dispose();
            _image.Dispose();
        }

        public static void DrawImage(ref Bitmap _source, Image _waterMark, WatermarkPosition _position, double _transparent)
        {
            var _waterLogo = new Bitmap(_waterMark, _waterMark.Width, _waterMark.Height);


            Rectangle _rect;

            switch (_position)
            {
                //case WatermarkPosition.TopRight:
                case WatermarkPosition.TopRight:
                    _rect = new Rectangle(_source.Width - _waterLogo.Width, 0, _waterLogo.Width, _waterLogo.Height);
                    break;

                case WatermarkPosition.TopCenter:
                    _rect = new Rectangle((_source.Width - _waterLogo.Width) / 2, 0, _waterLogo.Width, _waterLogo.Height);
                    break;

                case WatermarkPosition.BottomLeft:
                    _rect = new Rectangle(0, _source.Height - _waterLogo.Height, _waterLogo.Width, _waterLogo.Height);
                    break;

                case WatermarkPosition.BottomRight:
                    _rect = new Rectangle(_source.Width - _waterLogo.Width, _source.Height - _waterLogo.Height, _waterLogo.Width, _waterLogo.Height);
                    break;

                case WatermarkPosition.BottomCenter:

                    _rect = new Rectangle((_source.Width - _waterLogo.Width) / 2, (_source.Height - _waterLogo.Height), _waterLogo.Width, _waterLogo.Height);
                    break;

                case WatermarkPosition.Center:
                    _rect = new Rectangle((_source.Width - _waterLogo.Width) / 2, (_source.Height - _waterLogo.Height) / 2, _waterLogo.Width, _waterLogo.Height);
                    break;

                default://TopLeft
                    _rect = new Rectangle(0, 0, _waterLogo.Width, _waterLogo.Height);
                    break;


            }


            Graphics _graphic = Graphics.FromImage(_source);

            //var ColorMatrix = new ColorMatrix();
            //ColorMatrix.Matrix33 = Convert.ToSingle(_transparent);
            //var _attributes = new ImageAttributes();
            //_attributes.SetColorMatrix(ColorMatrix, ColorMatrixFlag.Default, ColorAdjustType.Bitmap);

            _graphic.SmoothingMode = SmoothingMode.AntiAlias;

            _graphic.InterpolationMode = InterpolationMode.HighQualityBicubic;
            _graphic.SmoothingMode = SmoothingMode.HighQuality;
            _graphic.PixelOffsetMode = PixelOffsetMode.HighQuality;
            _graphic.CompositingQuality = CompositingQuality.HighQuality;
            _graphic.TextRenderingHint = TextRenderingHint.AntiAlias;

            //_graphic.DrawImage(_waterLogo, _rect, 0, 0, _waterLogo.Width, _waterLogo.Height, GraphicsUnit.Pixel, _attributes);
            _graphic.DrawImage(_waterLogo, _rect, 0, 0, _waterLogo.Width, _waterLogo.Height, GraphicsUnit.Pixel);

            _graphic.Dispose();



        }


        public static void AddWatermarkImage(Stream _fileSource, string _waterLogoFile, string _saveTo, WatermarkPosition _position, double _alpha)
        {

            Image _ImageSourceTemp = Image.FromStream(_fileSource);

            var _ImageSource = new Bitmap(_ImageSourceTemp, _ImageSourceTemp.Width, _ImageSourceTemp.Height);


            Graphics g = Graphics.FromImage(_ImageSource);

            var ColorMatrix = new ColorMatrix { Matrix33 = Convert.ToSingle(_alpha) };
            var ImgAttributes = new ImageAttributes();
            ImgAttributes.SetColorMatrix(ColorMatrix, ColorMatrixFlag.Default, ColorAdjustType.Bitmap);


            Image _waterLogoTemp = Image.FromFile(_waterLogoFile);

            var _waterLogo = new Bitmap(_waterLogoTemp, _waterLogoTemp.Width, _waterLogoTemp.Height);




            Rectangle _rect;

            switch (_position)
            {
                //case WatermarkPosition.TopRight:
                case WatermarkPosition.TopRight:
                    _rect = new Rectangle(_ImageSource.Width - _waterLogo.Width, 0, _waterLogo.Width, _waterLogo.Height);
                    break;

                case WatermarkPosition.TopCenter:
                    _rect = new Rectangle((_ImageSource.Width - _waterLogo.Width) / 2, 0, _waterLogo.Width, _waterLogo.Height);
                    break;

                case WatermarkPosition.BottomLeft:
                    _rect = new Rectangle(0, _ImageSource.Height - _waterLogo.Height, _waterLogo.Width, _waterLogo.Height);
                    break;

                case WatermarkPosition.BottomRight:
                    _rect = new Rectangle(_ImageSource.Width - _waterLogo.Width, _ImageSource.Height - _waterLogo.Height, _waterLogo.Width, _waterLogo.Height);
                    break;

                case WatermarkPosition.BottomCenter:

                    _rect = new Rectangle((_ImageSource.Width - _waterLogo.Width) / 2, (_ImageSource.Height - _waterLogo.Height), _waterLogo.Width, _waterLogo.Height);
                    break;

                case WatermarkPosition.Center:
                    _rect = new Rectangle((_ImageSource.Width - _waterLogo.Width) / 2, (_ImageSource.Height - _waterLogo.Height) / 2, _waterLogo.Width, _waterLogo.Height);
                    break;

                default://TopLeft
                    _rect = new Rectangle(0, 0, _waterLogo.Width, _waterLogo.Height);
                    break;


            }

            g.DrawImage(_waterLogo, _rect, 0, 0, _waterLogo.Width, _waterLogo.Height, GraphicsUnit.Pixel, ImgAttributes);

            g.SmoothingMode = SmoothingMode.HighQuality;
            g.InterpolationMode = InterpolationMode.HighQualityBicubic;

            g.Dispose();


            _ImageSource.Save(_saveTo, _ImageSource.RawFormat);

            _ImageSourceTemp.Dispose();
            _waterLogoTemp.Dispose();

            _waterLogo.Dispose();
            _ImageSource.Dispose();


        }



        public static void Draw(ref Bitmap _source, Image _waterLogo, WatermarkPosition _position, double _transparent)
        {

            Rectangle _rect;

            switch (_position)
            {
                //case WatermarkPosition.TopRight:
                case WatermarkPosition.TopRight:
                    _rect = new Rectangle(_source.Width - _waterLogo.Width, 0, _waterLogo.Width, _waterLogo.Height);
                    break;

                case WatermarkPosition.TopCenter:
                    _rect = new Rectangle((_source.Width - _waterLogo.Width) / 2, 0, _waterLogo.Width, _waterLogo.Height);
                    break;

                case WatermarkPosition.BottomLeft:
                    _rect = new Rectangle(0, _source.Height - _waterLogo.Height, _waterLogo.Width, _waterLogo.Height);
                    break;

                case WatermarkPosition.BottomRight:
                    _rect = new Rectangle(_source.Width - _waterLogo.Width, _source.Height - _waterLogo.Height, _waterLogo.Width, _waterLogo.Height);
                    break;

                case WatermarkPosition.BottomCenter:

                    _rect = new Rectangle((_source.Width - _waterLogo.Width) / 2, (_source.Height - _waterLogo.Height), _waterLogo.Width, _waterLogo.Height);
                    break;

                case WatermarkPosition.Center:
                    _rect = new Rectangle((_source.Width - _waterLogo.Width) / 2, (_source.Height - _waterLogo.Height) / 2, _waterLogo.Width, _waterLogo.Height);
                    break;

                default://TopLeft
                    _rect = new Rectangle(0, 0, _waterLogo.Width, _waterLogo.Height);
                    break;


            }

            Draw(ref _source, _waterLogo, _rect, _transparent);

        }

        public static void Draw(ref Bitmap _source, Image _waterMark, Rectangle _rect, double _transparent)
        {

            var _waterLogo = new Bitmap(_waterMark, _waterMark.Width, _waterMark.Height);

            using (Graphics _graphic = Graphics.FromImage(_source))
            {

                _graphic.SmoothingMode = SmoothingMode.AntiAlias;
                _graphic.InterpolationMode = InterpolationMode.HighQualityBicubic;
                _graphic.SmoothingMode = SmoothingMode.HighQuality;
                _graphic.PixelOffsetMode = PixelOffsetMode.HighQuality;
                _graphic.CompositingQuality = CompositingQuality.HighQuality;
                _graphic.TextRenderingHint = TextRenderingHint.AntiAlias;

                if (_transparent > 0)
                {
                    var _colorMatrix = new ColorMatrix { Matrix33 = Convert.ToSingle(_transparent) };
                    var _imgAttributes = new ImageAttributes();
                    _imgAttributes.SetColorMatrix(_colorMatrix, ColorMatrixFlag.Default, ColorAdjustType.Bitmap);
                    _graphic.DrawImage(_waterLogo, _rect, 0, 0, _waterLogo.Width, _waterLogo.Height, GraphicsUnit.Pixel, _imgAttributes);
                }
                else
                {
                    _graphic.DrawImage(_waterLogo, _rect, 0, 0, _waterLogo.Width, _waterLogo.Height, GraphicsUnit.Pixel);
                }


                _graphic.Dispose();
            }


        }


        public static void Draw(ref Bitmap _source, Image _waterMark, int _srcX, int _srcY)
        {

            // var _waterLogo = new Bitmap(_waterMark, _waterMark.Width, _waterMark.Height);

            using (Graphics _graphic = Graphics.FromImage(_source))
            {

                _graphic.SmoothingMode = SmoothingMode.AntiAlias;
                _graphic.InterpolationMode = InterpolationMode.HighQualityBicubic;
                _graphic.SmoothingMode = SmoothingMode.HighQuality;
                _graphic.PixelOffsetMode = PixelOffsetMode.HighQuality;
                _graphic.CompositingQuality = CompositingQuality.HighQuality;
                _graphic.TextRenderingHint = TextRenderingHint.AntiAlias;
                _graphic.DrawImage(_waterMark, _srcX, _srcY);

                _graphic.Dispose();
            }
        }


        public static void Draw(ref Bitmap _source, string _waterMark, Font _font, Brush _brush, PointF _point, StringFormat _stringFormat)
        {

            using (Graphics _graphic = Graphics.FromImage(_source))
            {
                _graphic.SmoothingMode = SmoothingMode.AntiAlias;
                _graphic.InterpolationMode = InterpolationMode.HighQualityBicubic;
                _graphic.SmoothingMode = SmoothingMode.HighQuality;
                _graphic.PixelOffsetMode = PixelOffsetMode.HighQuality;
                _graphic.CompositingQuality = CompositingQuality.HighQuality;
                _graphic.TextRenderingHint = TextRenderingHint.AntiAlias;
                _graphic.DrawString(_waterMark, _font, _brush, _point, _stringFormat);
                _graphic.Dispose();
            }
        }

        public static Image Crop(Bitmap _souce, Rectangle _rectangle)
        {
            return _souce.Clone(_rectangle, _souce.PixelFormat);
            //return bmpCrop;
        }

        public static void Crop(ref Bitmap _souce, Rectangle _rectangle)
        {
            _souce = _souce.Clone(_rectangle, _souce.PixelFormat);

        }

        public static void Crop(ref Bitmap _souce, int _width, int _height)
        {
            Crop(ref _souce, new Rectangle(0, 0, _width, _height));
        }



        //public static void resizePicture(System.IO.Stream stream, int ResizeToWidth, int ResizeToHeight)
        //{

        //    // First, make sure it's a valid GIF. 
        //    GifDecoder gif = new GifDecoder();
        //    int count = gif.GetFrameCount(stream);

        //    // Get the animation size. 
        //    int width = 0;
        //    int height = 0;
        //    foreach (GifFrame f in gif.Frames)
        //    {
        //        if (f.Image.Width + f.Location.X > width)
        //            width = f.Image.Width + f.Location.X;
        //        if (f.Image.Height + f.Location.Y > height)
        //            height = f.Image.Height + f.Location.Y;
        //    }

        //    int newWidth = ResizeToWidth;
        //    int newHeight = ResizeToHeight;

        //    float ratio = 0;
        //    if (width > height)
        //        ratio = (float)newWidth / (float)width;
        //    else
        //        ratio = (float)newHeight / (float)height;



        //    // Perpare the GifFrameCollection. 
        //    GifFrameCollection gifCol = new GifFrameCollection();
        //    gifCol.Height = (int)(height * ratio);
        //    gifCol.Width = (int)(width * ratio);

        //    // Loop through each frame and resize the image. 
        //    for (int i = 0; i < count; i++)
        //    {
        //        // You don't need to seek to the beginning because 
        //        // the frames have already been read by calling 
        //        // GetFrameCount. Just be sure to send the same stream. 
        //        GifFrame frame = gif.Frames[i];

        //        // the resulting image
        //        AtalaImage img;
        //        // the new offset for this frame
        //        Point loc = new Point((int)(frame.Location.X * ratio), (int)(frame.Location.Y * ratio));

        //        if (frame.TransparentIndex > 255 || frame.TransparentIndex < 0)
        //        { // resample without mask
        //            if (((int)(frame.Location.X * ratio) == (float)(frame.Location.X * ratio)) &&
        //                ((int)(frame.Location.Y * ratio) == (float)(frame.Location.Y * ratio)))
        //            {  // simply calculate new offset
        //                ResampleCommand noMaskResample = new ResampleCommand(new Rectangle(Point.Empty, frame.Image.Size),
        //                    new Size((int)(frame.Image.Width * ratio), (int)(frame.Image.Height * ratio)), ResampleMethod.NearestNeighbor);
        //                img = noMaskResample.ApplyToImage(frame.Image);
        //            }
        //            else // offset does not line up on whole pixel, resize hard way.
        //            {
        //                ImageInfo info = RegisteredDecoders.GetImageInfo(stream);
        //                // place this frame onto blank cavas
        //                AtalaImage background = GetPreviousFrame(gif.Frames, i, info.Size);
        //                ImageCommand overlay = new OverlayCommand(frame.Image, frame.Location);
        //                overlay.ApplyToImage(background);
        //                //background.Save("afteroverlay.gif", ImageType.Gif, null);
        //                // resize this canvas, then crop to an even pixel.
        //                // this should give the effect of locating this frame 'in-between' pixels.
        //                ResampleCommand noMaskResample = new ResampleCommand(new Rectangle(Point.Empty, background.Size),
        //                    new Size((int)(background.Width * ratio), (int)(background.Height * ratio)), ResampleMethod.NearestNeighbor);
        //                img = noMaskResample.ApplyToImage(background);
        //                //img.Save("Afternomaskresample.gif", ImageType.Gif, null);
        //                CropCommand crop = new CropCommand(new Rectangle(loc, new Size((int)(frame.Image.Width * ratio), (int)(frame.Image.Height * ratio))));
        //                img = crop.ApplyToImage(img);
        //                //img.Save("aftercrop.gif", ImageType.Gif, null);

        //            }

        //        }
        //        else // resample with mask
        //        {
        //            if ((loc.X == (float)(frame.Location.X * ratio)) &&
        //                (loc.Y == (float)(frame.Location.Y * ratio)))
        //            {
        //                ResampleMaskedCommand resample = new ResampleMaskedCommand(new Rectangle(Point.Empty, frame.Image.Size),
        //                    new Size((int)(frame.Image.Width * ratio), (int)(frame.Image.Height * ratio)), frame.TransparentIndex);
        //                img = resample.ApplyToImage(frame.Image);
        //            }
        //            else // offset does not line up on whole pixel, resize hard way.
        //            {
        //                ImageInfo info = RegisteredDecoders.GetImageInfo(stream);
        //                // place this frame onto blank cavas
        //                AtalaImage background = GetPreviousFrame(gif.Frames, i, info.Size);
        //                ImageCommand overlay = new OverlayCommand(frame.Image, frame.Location);
        //                overlay.ApplyToImage(background);
        //                //background.Save("afteroverlay.gif", ImageType.Gif, null);
        //                // resize this canvas, then crop to an even pixel.
        //                // this should give the effect of locating this frame 'in-between' pixels.
        //                ResampleMaskedCommand maskResample = new ResampleMaskedCommand(new Rectangle(Point.Empty, background.Size),
        //                    new Size((int)(background.Width * ratio), (int)(background.Height * ratio)), frame.TransparentIndex);
        //                img = maskResample.ApplyToImage(background);
        //                //img.Save("Afternomaskresample.gif", ImageType.Gif, null);
        //                CropCommand crop = new CropCommand(new Rectangle(loc, new Size((int)(frame.Image.Width * ratio), (int)(frame.Image.Height * ratio))));
        //                img = crop.ApplyToImage(img);
        //                //img.Save("aftercrop.gif", ImageType.Gif, null);
        //            }
        //        }

        //        // Add the new image back to the collection. 
        //        gifCol.Add(new GifFrame(img, loc, frame.DelayTime, frame.Interlaced, frame.FrameDisposal, frame.TransparentIndex, true));//frame.UseLocalPalette)); 

        //    }

        //    FileStream saveStream = new FileStream("resized.gif", FileMode.Create, FileAccess.Write, FileShare.Write);
        //    GifEncoder gifSave = new GifEncoder();
        //    gifSave.Save(saveStream, gifCol, null);
        //    saveStream.Close();

        //}

        //public static AtalaImage GetPreviousFrame(GifFrameCollection frames, int currentIndex, Size imageSize)
        //{  // find the frame that comes *before* the current one, which extends beyond the current frame in x and y directions
        //    int w = frames[currentIndex].Image.Width;
        //    int h = frames[currentIndex].Image.Height;
        //    Point curloc = frames[currentIndex].Location;
        //    for (int i = currentIndex - 1; i >= 0; i--)
        //    {
        //        AtalaImage img = frames[i].Image;
        //        if ((frames[i].Location.X < curloc.X) && (frames[i].Location.Y < curloc.Y) && (img.Width > w) && (img.Height > h))
        //        {
        //            if (frames[i].Location == Point.Empty) // no offset
        //                return img;
        //            else
        //            {  // overlay this frame at the right offset
        //                AtalaImage newimg = new AtalaImage(imageSize.Width, imageSize.Height, img.PixelFormat, Color.Transparent);
        //                OverlayCommand cmd = new OverlayCommand(img, frames[i].Location);
        //                cmd.ApplyToImage(newimg);
        //                return newimg;
        //            }
        //        }
        //    }
        //    // if no frame exists, or all frames are the same size, lets assume the first image will suffice.
        //    return frames[0].Image;
        //}
    }
}
