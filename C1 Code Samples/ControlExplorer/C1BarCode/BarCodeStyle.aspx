<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Wijmo.Master" CodeBehind="BarCodeStyle.aspx.cs" Inherits="ControlExplorer.C1BarCode.BarCodeStyle" %>

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
    
    <div >
        <h2>BarCodeStyle</h2> 
        <br />
        <div>Value in these BarCodes is "1234567890"</div>
        <br />
        <h4>Show actual value : </h4>
        <wijmo:C1BarCode ID="C1BarCode1" runat="server" Text="1234567890" ShowText="true" />
        <br />
        <div>
            <h4>Set the direction :</h4>
            <div>
                Normal
            <wijmo:C1BarCode ID="C1BarCode4" runat="server" Text="1234567890" ShowText="true" />
            </div>
            <div class="codeContainer">
                Up
            <wijmo:C1BarCode ID="C1BarCode2" runat="server" Text="1234567890" ShowText="true" BarDirection="Up" />
            </div>
            <div class="codeContainer">
                Down
            <wijmo:C1BarCode ID="C1BarCode3" runat="server" Text="1234567890" ShowText="true" BarDirection="Down" />
            </div>
        </div>
        <br />
        <div>
            <h4>Set BackColor and ForeColor</h4>
            <p>BackColor: Yellow</p>
            <p>ForColor: Blue</p>
            <wijmo:C1BarCode ID="C1BarCode5" runat="server" Text="1234567890" ShowText="true" BackColor="Yellow" ForeColor="Blue" />
        </div>
        <br />
        <div>
            <h4>Set Font for Text</h4>
            <p>TextFont: "Consolas, 8.25pt, style=Italic"</p>
            <wijmo:C1BarCode ID="C1BarCode6" runat="server" Text="1234567890" ShowText="true" TextFont="Consolas, 8.25pt, style=Italic"/>
        </div>
    </div>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="Description" Runat="Server">
    <p>
        <strong>C1BarCode </strong>provides a BarCode image which is encoded according to a special string value.
    </p>
    <p>
        Users can set the value and showing style of the BarCode .
    </p>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="ControlOptions" Runat="Server">

</asp:Content>
