<%@ Page Title="" Language="C#" MasterPageFile="~/EmployeeMaster.Master" AutoEventWireup="true" CodeBehind="ApplyFeedback.aspx.cs" Inherits="JobSeekerPortal.Employee.ApplyFeedback" %>
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
  width: 82%;
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
            <asp:Label ID="label1" runat="server" Text="FEEDBACK" BorderColor="WhiteSmoke" Font-Size="40px" Font-Bold="true" style="margin-left:100px"></asp:Label><br />
           <br /> <br />

            <div style="font-family: Courier New, Courier, monospace;">
                <asp:Label ID="lblfeedback" runat="server" Text="" Font-Bold="true"></asp:Label>
                </div>
            <div style="margin-left:0px; margin-top:10px; font-family: Courier New, Courier, monospace;">
                <asp:DropDownList ID="ddlcompany" runat="server" style=" width: 415px; height: 45px; border:2px solid black; border-radius: 5px; padding-left: 8px;"></asp:DropDownList>   
                
            </div>

            <br /><br />

             <div style="font-family: Courier New, Courier, monospace;">
                    <asp:TextBox ID="txtfeedback" TextMode="MultiLine" runat="server" BorderWidth="2" BorderColor="Black" style=" width: 414px; height: 150px;  border-radius: 5px; padding: 10px"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="rfv" runat="server" ControlToValidate="txtfeedback" ErrorMessage="*" ForeColor="Red" ></asp:RequiredFieldValidator>
                      &nbsp;
                <asp:RegularExpressionValidator ID="rge1" runat="server" ControlToValidate="txtfeedback" ForeColor="Red" ErrorMessage="Invalid format" ValidationExpression=".{3,250}"></asp:RegularExpressionValidator>
             </div>

            <br /><br />

             <asp:Button ID="btnfeedback" runat="server" CssClass="button button2" Font-Bold="true" Font-Size="Large" Text="Submit Feedback"  style="margin-top:10px " OnClick="btnfeedbac_Click" />
         <br />
         <br />
         <center>
             <div style="margin-left: -90px">
             <asp:Label ID="lblStatus" runat="server" ForeColor="Green"></asp:Label>
             </div>
         </center>
         
              
   
            <br />
            
        </div>
        </form>
</asp:Content>
