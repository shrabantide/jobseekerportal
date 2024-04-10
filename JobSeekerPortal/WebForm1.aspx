<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="WebForm1.aspx.cs" Inherits="JobSeekerPortal.WebForm1" EnableEventValidation="false" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <asp:Panel ID="pn" runat="server">
            <h1>
                Hello
            </h1>
            <h1>
                <asp:Label ID="lbl" runat="server"></asp:Label>
                <asp:Image runat="server" Height="300px" Width="100%" ImageUrl="~/Images/hrimage.png" style=" "/>
            </h1>
            
        </asp:Panel>
        <asp:Button OnClick="Unnamed_Click" ID="btn" runat="server" Text="print" />
        <asp:Panel ID="pn1" runat="server">
             <h2>ASP.NET</h2>
        </asp:Panel>
    </form>
</body>
</html>
