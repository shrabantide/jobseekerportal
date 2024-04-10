<%@ Page Title="" Language="C#" MasterPageFile="~/VisitorMaster.Master" AutoEventWireup="true" CodeBehind="otpverify.aspx.cs" Inherits="JobSeekerPortal.Visitor.otpverify" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
     <style>
.button {
  background-color: #4CAF50; 
  border: none;
  color: white;
  padding: 16px 28px;
  text-align: center;
  text-decoration: none;
  display: inline-block;
  font-size: 16px;
  margin: 4px 2px;
  transition-duration: 0.4s;
  cursor: pointer;
  width: 80%;
  border-radius: 5px;
  height : 20%;
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
        <div style="background-color:whitesmoke; height:400px; width:500px; font-family:'Times New Roman' ">
            <asp:Label ID="label1" runat="server" Text="OTP VERIFICATION" BorderWidth="40px" BorderColor="WhiteSmoke" Font-Size="40px" Font-Bold="true"></asp:Label>

            <br />

            <div style="margin-left:-273px; font-family: Courier New, Courier, monospace;">
                <asp:Label ID="lblotp" runat="server" Text="Enter OTP" Font-Bold="true"></asp:Label>
                &nbsp; &nbsp;
                <asp:RequiredFieldValidator ID="rfv1" runat="server" ControlToValidate="txtotp" ForeColor="Red" ErrorMessage="*" style="margin-left : -30px"></asp:RequiredFieldValidator>
                <br />
            </div>
            <div style="margin-left:0px; margin-top:10px; font-family: Courier New, Courier, monospace;">
                <asp:TextBox ID="txtotp" TextMode="Number" runat="server" style=" width: 400px; height: 40px;  border-radius: 5px; padding-left: 8px;"></asp:TextBox>
            </div>

            <br /><br />

             <asp:Button ID="btnotpverify" runat="server" CssClass="button button2" Font-Bold="true" Font-Size="Large" Text="Verify OTP"  style="margin-top:10px" OnClick="btnhr_Click"/><br />
             <asp:Label ID="lblStatus" runat="server" ForeColor="Green"></asp:Label><br /><br />
             <asp:LinkButton ID="lbtnlink" runat="server" ForeColor="Blue" text="Sign up again" Font-Underline="false" Visible="false" OnClick="lbtnlink_Click" > </asp:LinkButton>
            <br /><br />
        
        </div>
    </center>
    <br />
</asp:Content>

