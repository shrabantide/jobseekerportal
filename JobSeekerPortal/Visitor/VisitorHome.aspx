<%@ Page Title="" Language="C#" MasterPageFile="~/VisitorMaster.Master" AutoEventWireup="true" CodeBehind="VisitorHome.aspx.cs" Inherits="JobSeekerPortal.Visitor.VisitorHome" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
        <style>
.button {
  background-color: #4CAF50; 
  border: none;
  color: white;
  padding: 16px 32px;
  text-align: center;
  text-decoration: none;
  display: inline-block;
  font-size: 16px;
  margin: 4px 2px;
  transition-duration: 0.4s;
  cursor: pointer;
  position:absolute;
  top:83%;
  left:600px;
}

.button2 {
  background-color: white; 
  color: black; 
  border: 2px solid blue;
}

.button2:hover {
  background-color: cornflowerblue;
  color: white;
}
    </style>
    <div style="margin-left:230px; margin-top: 80px">
        <asp:Label ID="lblsearchicon" runat="server" style="position:absolute; top:197px; left:490px">🔍</asp:Label>
        <asp:DropDownList ID="ddljob" runat="server" Width="215px" style=" width: 300px; height: 40px;  border-radius: 5px; padding-left: 8px;">

        </asp:DropDownList>
        &nbsp; &nbsp; &nbsp;
        <asp:Label ID="lblsearchicon2" runat="server" style="position:absolute; top:197px; left:818px">🔍</asp:Label>
        <asp:DropDownList ID="ddlsearchcompany" runat="server" Width="215px" style=" width: 300px; height: 40px;  border-radius: 5px; padding-left: 8px;">
          
        </asp:DropDownList>
       &nbsp; &nbsp; &nbsp;
        <asp:LinkButton ID="btnSearch" runat="server" style="background: blue; color: white; padding: 10px; font-size: 14px; border-radius: 4px; position:absolute; top:187px; left:890px" Height="18px" Width="100px" Font-Underline="false" OnClick="btnhr_Click">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Search</asp:LinkButton>
  </div>
    <br /><br />
    <div style="font-size:x-large">
    <center>
        <a href="UserLogin.aspx" style="text-decoration:none; color:blue">Create a resume</a> - It only takes few seconds
    </center>

    </div>
    <br /><br />
    <div style="color: blue">
        <asp:Image runat="server" Height="300px" Width="100%" ImageUrl="~/Images/hrimage.png" style=" "/>
        <p runat="server" style="position:absolute; left:600px; top:60%; font-size: 30px; background-color:skyblue">KEEP SEEKERS FOR EMPLOYERS</p>
        
        <p runat="server" style="position:absolute; left:600px; top:70%; font-size: 30px; ">Want to hire?</p>

        <asp:Button ID="btnhr"  runat="server" CssClass="button button2" Font-Bold="true" Font-Size="Large" Text="Post Job    >" />



    </div>
    
    
</asp:Content>
