<%@ Page Title="" Language="C#" MasterPageFile="~/VisitorMaster.Master" AutoEventWireup="true" CodeBehind="UserRegistration.aspx.cs" Inherits="JobSeekerPortal.Visitor.UserRegistration" %>
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
        <div style="background-color:whitesmoke; height:650px; width:500px; font-family:'Times New Roman' ">
            <br /><br />
            <asp:Label ID="label1" runat="server" Text="SIGN UP" BorderColor="WhiteSmoke" Font-Size="40px" Font-Bold="true"></asp:Label><br />
            <a href="UserLogin.aspx" style="text-decoration: none; color: darkblue; margin-top:-70px">Already Have an Account? Sign In </a><br />
            <br />

            <div style="margin-left:-273px; font-family: Courier New, Courier, monospace;">
                <asp:Label ID="lblemailid" runat="server" Text="Enter Email" Font-Bold="true"></asp:Label>
                &nbsp; &nbsp;
                <asp:RequiredFieldValidator ID="rfv1" runat="server" ControlToValidate="txtemailid" ForeColor="Red" ErrorMessage="*" style="margin-left : -30px"></asp:RequiredFieldValidator>
                <br />
                <asp:RegularExpressionValidator  ID="rev1" runat="server" ControlToValidate="txtemailid" ValidationExpression="[a-zA-Z._0-9]{4,30}[@][a-zA-Z]{2,30}[.]{0,1}[a-z]{2,9}[.]{0,1}[a-z]{0,5}" ForeColor="Red" ErrorMessage="Email ID is invalid" style="float:right; margin-right:45px" Display="Dynamic" SetFocusOnError="True"></asp:RegularExpressionValidator>
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
                 <asp:RegularExpressionValidator ID="rev2" runat="server" ControlToValidate="txtpassword" ValidationExpression="[A-Za-z0-9_!@#$%^&*()]{8,16}" ForeColor="Red" ErrorMessage="Password must be of 8-16 characters" style="float:right; margin-right: 45px" Display="Dynamic" SetFocusOnError="true" ></asp:RegularExpressionValidator>
            </div>
            <div style="margin-left:0px; margin-top:10px; font-family: Courier New, Courier, monospace;">
                <asp:TextBox ID="txtpassword" TextMode="Password" runat="server" style=" width: 400px; height: 40px;  border-radius: 5px; padding-left: 8px;"></asp:TextBox>
            </div>
            
            <br /><br />

            <div style="margin-left:-170px; font-family: Courier New, Courier, monospace;">
                <asp:Label ID="Label3" runat="server" Text="Enter Confirm Password" Font-Bold="true"></asp:Label>
                 &nbsp; &nbsp;
                 <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtcpassword" ForeColor="Red" ErrorMessage="*" style="margin-left : -30px"></asp:RequiredFieldValidator>
                 <br />
                 <asp:CompareValidator ID="cv" runat="server" ControlToValidate="txtcpassword" ControlToCompare="txtpassword" ForeColor="Red" ErrorMessage="Password and Confirm Password didn't match" style="float:right; margin-right: 45px" Display="Dynamic" SetFocusOnError="true" ></asp:CompareValidator>
            </div>
            <div style="margin-left:0px; margin-top:10px; font-family: Courier New, Courier, monospace;">
                <asp:TextBox ID="txtcpassword" TextMode="Password" runat="server" style=" width: 400px; height: 40px;  border-radius: 5px; padding-left: 8px;"></asp:TextBox>
            </div>

            <br /><br />

            <div style="margin-left:-265px; font-family: Courier New, Courier, monospace;">
                <asp:Label ID="Label4" runat="server" Text="Choose Role" Font-Bold="true"></asp:Label>
                 &nbsp; &nbsp;
              
            </div>
            <div style="margin-left:0px; margin-top:10px; font-family: Courier New, Courier, monospace;">
                <asp:DropDownList ID="ddlrole" runat="server"  style=" width: 415px; height: 45px; border:2px solid black; border-radius: 5px; padding-left: 8px;">
                    <asp:ListItem Value="1" Selected="True">Hiring Employees</asp:ListItem>
                    <asp:ListItem Value="0">Seeking Job</asp:ListItem>
                </asp:DropDownList>
            </div>

            <br /><br />

             <asp:Button ID="btnhr" runat="server" CssClass="button button2" Font-Bold="true" Font-Size="Large" Text="Sign Up"  style="margin-top:10px " OnClick="btnhr_Click" />
            <br />
            
        </div>
    </center>
    <br />
</asp:Content>
