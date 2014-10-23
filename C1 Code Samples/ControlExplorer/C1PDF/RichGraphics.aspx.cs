using System;
using System.Collections;
using System.Collections.Generic;
using System.Drawing;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ControlExplorer.C1PDF
{
    public partial class RichGraphics : System.Web.UI.Page
    {
        C1.C1Pdf.C1PdfDocument _c1pdf;
        private Hashtable tempFiles = null;
        protected static string TEMP_DIR;
        protected void Page_Load(object sender, EventArgs e)
        {
           
        }

        private void CreatePDF()
        {
            _c1pdf = new C1.C1Pdf.C1PdfDocument();
            //start document
            _c1pdf.Clear();
            TEMP_DIR = Server.MapPath("../Temp");
            if (Directory.Exists(TEMP_DIR))
            {

            }
            else
            {
                Directory.CreateDirectory(TEMP_DIR);

            }
            //prepare to draw with Gdi-like commands
            int penWidth = 0;
            int penRGB = 0;
            Rectangle rc = new Rectangle(50, 50, 300, 200);
            string text = "Hello world of .NET Graphics and PDF.\r\nNice to meet you.";
            Font font = new Font("Times New Roman", 16, FontStyle.Italic | FontStyle.Underline);

            //start, c1, c2, end1, c3, c4, end
            PointF[] bezierPoints = new PointF[]
			{
				new PointF(110f, 200f), new PointF(120f, 110f), new PointF(135f, 150f),
				new PointF(150f, 200f), new PointF(160f, 250f), new PointF(165f, 200f),
				new PointF(150f, 100f)
			};

            //draw to pdf document
            C1.C1Pdf.C1PdfDocument g = _c1pdf;
            g.FillPie(Brushes.Red, rc, 0, 20f);
            g.FillPie(Brushes.Green, rc, 20f, 30f);
            g.FillPie(Brushes.Blue, rc, 60f, 12f);
            g.FillPie(Brushes.Gold, rc, -80f, -20f);
            for (float sa = 0; sa < 360; sa += 40)
            {
                Color penColor = Color.FromArgb(penRGB, penRGB, penRGB);
                Pen pen = new Pen(penColor, penWidth++);
                penRGB = penRGB + 20;
                g.DrawArc(pen, rc, sa, 40f);
            }
            g.DrawRectangle(Pens.Red, rc);
            g.DrawBeziers(Pens.Blue, bezierPoints);
            g.DrawString(text, font, Brushes.Black, rc);
        }

        protected void btnexport_Click(object sender, EventArgs e)
        {
            try
            {
                CreatePDF();
                string uid = System.Guid.NewGuid().ToString();
                string filename = Server.MapPath("~") + "\\Temp\\testpdf" + uid + ".pdf";
                _c1pdf.Save(filename);

                Response.Clear();
                Response.ContentType = "application/pdf";

                Response.TransmitFile(filename);
                Response.Flush();
                File.Delete(filename);
                Response.End();
            }
            catch (Exception ex)
            {
                
                Response.Write(ex.Message);
            }
           
        }
    }
}