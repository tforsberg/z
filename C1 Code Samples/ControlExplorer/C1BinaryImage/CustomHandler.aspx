<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Wijmo.Master" CodeBehind="CustomHandler.aspx.cs" Inherits="ControlExplorer.C1BinaryImage.CustomHandler" %>

<%@ Register Assembly="C1.Web.Wijmo.Controls.3" Namespace="C1.Web.Wijmo.Controls.C1BinaryImage"
    TagPrefix="wijmo" %>
<asp:Content ContentPlaceHolderID="Head" ID="Content1" runat="server">
    <style type="text/css">
        .dataList
        {
            margin: 5px;
            padding: 5px;
            border: 1px solid #CCCCCC;
            width: 168px;
            height: 180px;
        }
        
        .lable
        {
            float: left;
            width: 62px;
        }
    </style>
</asp:Content>
<asp:Content ContentPlaceHolderID="MainContent" ID="Content2" runat="server">
	<asp:DataList ID="DataList1" runat="server" DataKeyField="PhotoID" 
		DataSourceID="AccessDataSource1" RepeatDirection="Horizontal" RepeatColumns="4" Width="100%">
			<ItemTemplate>
				<div class="dataList">
					<wijmo:C1BinaryImage ID="BinaryImage1" runat="server" AlternateText='<%# Eval("Place") %>'
						ImageData='<%# Eval("Photo") %>' SavedImageName='<%# Eval("Place") %>'
						ToolTip='<%# Eval("Place") %>' HttpHandlerUrl="CustomBinaryImageHandler.ashx" />
					<br />
					<br />
                    <asp:Label ID="Label1" Text="ID: "  runat="server" />
					<asp:Label ID="Id"  runat="server" Text='<%# Eval("PhotoID") %>' />
                    <br />
                     <asp:Label ID="Label2" Text="Place: "  runat="server" />
                    <asp:Label ID="Place" runat="server" Text='<%# Eval("Place") %>' />
                    <br />
                     <asp:Label ID="Label3" Text="Country: " runat="server" />
                    <asp:Label ID="Country" runat="server" Text='<%# Eval("Country") %>' />
                    <br />
				</div>
			</ItemTemplate>
	</asp:DataList>
	<asp:AccessDataSource ID="AccessDataSource1" runat="server" 
		DataFile="~/App_Data/C1NWind.mdb" 
		SelectCommand="SELECT top 8 [PhotoID], [Place], [Country], [Photo] FROM [Photos]">
	</asp:AccessDataSource>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="Description" Runat="Server">
    <p>
        This demo uses <b>HttpHandlerUrl</b> property to specify a http handler to process the image.
    </p>
    <p>
        Sample:
    </p>
    <ul>
        <li>
            Set <b>HttpHandlerUrl</b> property to "CustomBinaryImageHandler.ashx". 
        </li>
        <li>
            The class CustomBinaryImageHandler inherits from C1BinaryImageHandler(class: C1.Web.Wijmo.Controls.C1BinaryImage.C1BinaryImageHandler)<br />
            and overrides ProcessImageData method to customize the image:<br /><br />
            <pre>
public class CustomBinaryImageHandler : C1BinaryImageHandler
{
    public override C1BinaryImageData ProcessImageData(C1BinaryImageData imageData)
    {
        using (var outStream = new System.IO.MemoryStream())
        using (var inStream = new System.IO.MemoryStream(imageData.Data))
        using (var image = Bitmap.FromStream(inStream))
        {
            var newImage = AddWatermark(image);
            newImage.Save(outStream, ImageFormat.Png);
            imageData.Data = outStream.ToArray();
            imageData.MimeType = "image/png";
            imageData.ImageFileName += "_Watermark";
        }

        return base.ProcessImageData(imageData);
    }

    private Image AddWatermark(Image image)
    {
        var watermarkString = "ComponentOne";
        var font = new Font("Arial", 8F, FontStyle.Regular);
        var newImage = new Bitmap(image.Width, image.Height);

        using (var g = Graphics.FromImage(newImage))
        {
            g.DrawImage(image, new Point(0, 0));
            g.DrawString(watermarkString, font, new SolidBrush(Color.White), new PointF(2, newImage.Height - font.Height - 2));
        }

        return newImage;
    }
}
            </pre>
        </li>
    </ul>
    <p>
    </p>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="ControlOptions" Runat="Server">
</asp:Content>
