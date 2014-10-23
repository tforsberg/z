<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Wijmo.Master" CodeBehind="CodeType.aspx.cs" Inherits="ControlExplorer.C1BarCode.CodeType" %>

<%@ Register Assembly="C1.Web.Wijmo.Controls.3" Namespace="C1.Web.Wijmo.Controls.C1BarCode"
    TagPrefix="wijmo" %>
<asp:Content ContentPlaceHolderID="Head" ID="Content1" runat="server">
    <style type="text/css">
        .codeContainer
        {
            display: inline-block;
            padding: 20px;
        }
    </style>
</asp:Content>
<asp:Content ContentPlaceHolderID="MainContent" ID="Content2" runat="server">

    <div>
        <div>
            <h2>CodeType</h2>
            <div>
                <div class="codeContainer">
                    <h4>Code39 :</h4>
                    <p>Value: C1BarCode%Code39</p>
                    <br />
                    <div>
                        <wijmo:C1BarCode ID="C1BarCode4" runat="server" Text="C1BarCode%Code39" ShowText="true" />
                    </div>
                    <br />
                </div>
                <div class="codeContainer">
                    <h4>Code93 :</h4>
                    <p>Value: Code93</p>
                    <br />
                    <div>
                        <wijmo:C1BarCode ID="C1BarCode1" runat="server" Text="Code93" ShowText="true" CodeType="Code93" />
                    </div>
                    <br />
                </div>
                <div class="codeContainer">
                    <h4>Code128 :</h4>
                    <p>Value: Code128</p>
                    <br />
                    <div>
                        <wijmo:C1BarCode ID="C1BarCode2" runat="server" Text="Code128" ShowText="true" CodeType="Code128" />
                    </div>
                    <br />
                </div>
            </div>
            <div>
                <div class="codeContainer">
                    <h4>CodeI2of5 :</h4>
                    <p>Value: 123456789</p>
                    <br />
                    <div>
                        <wijmo:C1BarCode ID="C1BarCode3" runat="server" Text="123456789" ShowText="true" CodeType="CodeI2of5" />
                    </div>
                    <br />
                </div>
                <div class="codeContainer">
                    <h4>Codabar :</h4>
                    <p>Value: 12345678901234567890</p>
                    <br />
                    <div>
                        <wijmo:C1BarCode ID="C1BarCode5" runat="server" Text="12345678901234567890" ShowText="true" CodeType="Codabar" />
                    </div>
                    <br />
                </div>
                <div class="codeContainer">
                    <h4>PostNet :</h4>
                    <p>Value: 80122</p>
                    <br />
                    <div>
                        <wijmo:C1BarCode ID="C1BarCode8" runat="server" Text="80122" ShowText="true" CodeType="PostNet" />
                    </div>
                    <br />
                </div>
                
            </div>
            <div>
                <div class="codeContainer">
                    <h4>Ean13 :</h4>
                    <p>Value: 690123456789</p>
                    <br />
                    <div>
                        <wijmo:C1BarCode ID="C1BarCode6" runat="server" Text="690123456789" ShowText="true" CodeType="Ean13" />
                    </div>
                    <br />
                </div>
                <div class="codeContainer">
                    <h4>Ean8 :</h4>
                    <p>Value: 4711234</p>
                    <br />
                    <div>
                        <wijmo:C1BarCode ID="C1BarCode7" runat="server" Text="4711234" ShowText="true" CodeType="Ean8" />
                    </div>
                    <br />
                </div>
                
                <div class="codeContainer">
                    <h4>UpcA :</h4>
                    <p>Value: 300746606017</p>
                    <br />
                    <div>
                        <wijmo:C1BarCode ID="C1BarCode9" runat="server" Text="300746606017" ShowText="true" CodeType="UpcA" />
                    </div>
                    <br />
                </div>
                <div class="codeContainer">
                    <h4>UpcE :</h4>
                    <p>Value: 01240000001</p>
                    <br />
                    <div>
                        <wijmo:C1BarCode ID="C1BarCode10" runat="server" Text="01240000001" ShowText="true" CodeType="UpcE" />
                    </div>
                    <br />
                </div>
            </div>

            <br />
            <br />
        </div>
    </div>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="Description" runat="Server">
	    <h2>Description for each types of BarCode:</h2>
    <br />
    <h4>Code39 :</h4>
    <p>Code 39 is an alpha-numeric encoding also known as 3 of 9 and LOGMARS.</p>
	<p>This was the first alphanumeric symbology developed, and is one of the</p>
	<p>most widely used encodings.</p>
    <br />
    <h4>Code93 :</h4>
    <p>Code 93 is an alpha-numeric encoding that is slightly denser than code 39.</p>
    <br />
    <h4>Code128 :</h4>
    <p>Code 128 is a very high density alpha-numeric bar code. It will use the </p>
    <p>least amount of space of any current 1-D symbology for symbols with 6 </p>
    <p>characters or more. </p>
    <br />
    <h4>CodeI2of5 :</h4>
    <p>Code I2of5 is a numeric encoding. The symbol can be as long as necessary </p>
	<p>to store the encoded data.</p>
    <br />
    <h4>Codabar :</h4>
    <p>Codabar may encode 16 different characters (0 through 9 plus -$:/.+), </p>
    <p>plus an additional 4 start/stop characters (A through D). Codabar</p>
    <p>is used by some US blood banks, photo labs, and on FedEx air bills. </p>
    <br />
    <h4>PostNet :</h4>
    <p>PostNet is a numeric encoding used by the US postal service. It differs </p>
    <p>from most others in that it is based on the height of the bars rather than</p>
    <p>on their width.</p>
    <br />
    <h4>Ean13 :</h4>
    <p>EAN-13 was implemented by the International Article Numbering Association (EAN)</p>
	<p>in Europe. EAN-13 encodes a 12-digit code that consists of a 2 digit system code</p>
	<p>followed by a 5 digit manufacturer code and a 5-digit product code. The 12-digit </p>
	<p>code is followed by a checksum digit (automatically added by the control).</p>
    <br />
    <h4>Ean8 :</h4>
    <p>EAN-8 provides a short barcode for small packages. It encodes a 7-digit</p>
	<p>code that consists of a 2 or 3 digit system code followed by a 4 or 5</p>
	<p>digit product code. The 7-digit code is followed by a checksum digit</p>
	<p>(automatically added by the control).</p>
    <br />
    <h4>UPCA</h4>
    <p>UPC-A is the common encoding you will find on virtually every consumer good on </p>
    <p>the shelves of your local supermarket, as well as books, magazines, and newspapers.</p>
    <p>It is similar to EAN-13, and encodes 11 digits of numeric data along with a trailing </p>
    <p>check digit. The first digit determines the number system, followed by a 5-digit</p>
    <p>manufacturer code, a 5-digit product code, and the check digit.</p>
    <br />
    <h4>UpcE</h4>
    <p>UPC-E is a variation of UPC-A which allows for a more compact barcode by eliminating </p>
    <p>"extra" zeros. Since the resulting UPC-E barcode is about half the size as an UPC-A </p>
    <p>barcode, it is generally used on products with very small packaging.</p>
    <p>When using the UpcE encoding, set the Text property to an 11-digit string as</p>
    <p>if you were using the UpcA encoding.</p>
    <p>Note that not all UpcA codes can be encoded in UpcE. </p>
    <p>If the manufacturer code ends with "000", "100", or "200", the product number must be &lt;= 900.</p>
    <p>If the manufacturer code ends with "00" but not with "100", "200", or "300", then the product number must be &lt;= 90.</p>
    <p>If the manufacturer code ends with "0" but not with "00", then the product number must be &lt;= 9.</p>
    <p>If the manufacturer code does not end with "0", then the product number must be between 5 and 9.</p>

</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="ControlOptions" runat="Server">
</asp:Content>
