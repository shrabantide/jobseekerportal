<%@ Page Title="" Language="C#" MasterPageFile="~/Adminmaster.Master" AutoEventWireup="true" CodeBehind="ChangePassword.aspx.cs" Inherits="JobSeekerPortal.Admin.ChangePassword" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
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
  width: 79%;
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
    <form runat="server">
     <div style="background-color:whitesmoke; height:650px; width:500px; font-family:'Times New Roman'; margin-left:550px ">
            <br /><br />
            <asp:Label ID="label1" runat="server" Text="CHANGE PASSWORD" BorderColor="WhiteSmoke" Font-Size="40px" Font-Bold="true" style="margin-left:-7px"></asp:Label><br />
           <br />

            <div style="font-family: Courier New, Courier, monospace;">
                <asp:Label ID="lblemailid" runat="server" Text="Your Email" Font-Bold="true"></asp:Label>
                </div>
            <div style="margin-left:0px; margin-top:10px; font-family: Courier New, Courier, monospace;">
                <asp:TextBox ID="txtemailid" TextMode="Email" runat="server" Enabled="false"  style=" width: 400px; height: 40px;  border-radius: 5px; padding-left: 8px;"></asp:TextBox>
            </div>

            <br /><br />

             <div style="font-family: Courier New, Courier, monospace;">
                <asp:Label ID="lblpw" runat="server" Text="Enter New Password" Font-Bold="true"></asp:Label>
                 &nbsp; &nbsp;
                 <asp:RequiredFieldValidator ID="rfv2" runat="server" ControlToValidate="txtpassword" ForeColor="Red" ErrorMessage="*" style="margin-left : -30px"></asp:RequiredFieldValidator>
                 <br />
                 <asp:RegularExpressionValidator ID="rev2" runat="server" ControlToValidate="txtpassword" ValidationExpression="[A-Za-z0-9_!@#$%^&*()]{8,16}" ForeColor="Red" ErrorMessage="Password must be of 8-16 characters" style="float:right; margin-right: 45px" Display="Dynamic" SetFocusOnError="true" ></asp:RegularExpressionValidator>
            </div>
            <div style="margin-left:0px; margin-top:10px; font-family: Courier New, Courier, monospace;">
                <asp:TextBox ID="txtpassword" TextMode="Password" runat="server" style=" width: 400px; height: 40px;  border-radius: 5px; padding-left: 8px;"></asp:TextBox>
            </div>
            
            <br /><br />

            <div style=" font-family: Courier New, Courier, monospace;">
                <asp:Label ID="Label3" runat="server" Text="Confirm New Password" Font-Bold="true"></asp:Label>
                 &nbsp; &nbsp;
                 <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtcpassword" ForeColor="Red" ErrorMessage="*" style="margin-left : -30px"></asp:RequiredFieldValidator>
                 <br />
                 <asp:CompareValidator ID="cv" runat="server" ControlToValidate="txtcpassword" ControlToCompare="txtpassword" ForeColor="Red" ErrorMessage="Password and Confirm Password didn't match" style="float:right; margin-right: 45px" Display="Dynamic" SetFocusOnError="true" ></asp:CompareValidator>
            </div>
            <div style="margin-left:0px; margin-top:10px; font-family: Courier New, Courier, monospace;">
                <asp:TextBox ID="txtcpassword" TextMode="Password" runat="server" style=" width: 400px; height: 40px;  border-radius: 5px; padding-left: 8px;"></asp:TextBox>
            </div>

            <br /><br />

             <asp:Button ID="btnadmn" runat="server" CssClass="button button2" Font-Bold="true" Font-Size="Large" Text="Change Password"  style="margin-top:10px " OnClick="btnadmn_Click" />
         <br />

         <div style="margin-left:90px">
             <asp:Label ID="lblStatus" runat="server" ForeColor="Green"></asp:Label>
         </div>
              
   
            <br />
            
        </div>
        </form>
</asp:Content>
