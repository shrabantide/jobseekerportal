<%@ Page Title="" Language="C#" MasterPageFile="~/VisitorMaster.Master" AutoEventWireup="true" CodeBehind="UserLogin.aspx.cs" Inherits="JobSeekerPortal.Visitor.UserLogin" %>
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
  width: 83%;
  border-radius: 5px;

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
    <center>
        <div style="background-color:whitesmoke; height:500px; width:500px; font-family:'Times New Roman' ">
            <asp:Label ID="label1" runat="server" Text="SIGN IN" BorderWidth="40px" BorderColor="WhiteSmoke" Font-Size="40px" Font-Bold="true"></asp:Label>

            <br />

            <div style="margin-left:-273px; font-family: Courier New, Courier, monospace;">
                <asp:Label ID="lblemailid" runat="server" Text="Enter Email" Font-Bold="true"></asp:Label>
                &nbsp; &nbsp;
                <asp:RequiredFieldValidator ID="rfv1" runat="server" ControlToValidate="txtemailid" ForeColor="Red" ErrorMessage="*" style="margin-left : -30px"></asp:RequiredFieldValidator>
                <br />
            </div>
            <div style="margin-left:0px; margin-top:10px; font-family: Courier New, Courier, monospace;">
                <asp:TextBox ID="txtemailid" TextMode="Email" runat="server"   style=" width: 400px; height: 40px;  border-radius: 5px; padding-left: 8px;"></asp:TextBox>
            </div>

            <br /><br />

             <div style="margin-left:-250px; font-family: Courier New, Courier, monospace;">
                <asp:Label ID="Label2" runat="server" Text="Enter Password" Font-Bold="true"></asp:Label>
                 &nbsp; &nbsp;
                 <asp:RequiredFieldValidator ID="rfv2" runat="server" ControlToValidate="txtpassword" ForeColor="Red" ErrorMessage="*" style="margin-left : -30px"></asp:RequiredFieldValidator>
                 <br />
                 </div>
            <div style="margin-left:0px; margin-top:10px; font-family: Courier New, Courier, monospace;">
                <asp:TextBox ID="txtpassword" TextMode="Password" runat="server" style=" width: 400px; height: 40px;  border-radius: 5px; padding-left: 8px;"></asp:TextBox>
            </div>
            
            <br /><br />

             <asp:Button ID="btnlogin" runat="server" CssClass="button button2" Font-Bold="true" Font-Size="Large" Text="Sign In" OnClick="btnlogin_Click" style="margin-top:10px" />
            <br />
            <asp:Label ID="lblstatus" runat="server" ForeColor="Red"></asp:Label>
            <br /><br />
            <a href="forgetpassword.aspx" style="text-decoration: none; color: darkblue">Forget Password ? </a>
        </div>
    </center>
    <br />
</asp:Content>
