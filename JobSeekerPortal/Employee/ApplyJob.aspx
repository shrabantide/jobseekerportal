<%@ Page Title="" Language="C#" MasterPageFile="~/EmployeeMaster.Master" AutoEventWireup="true" CodeBehind="ApplyJob.aspx.cs" Inherits="JobSeekerPortal.Employee.ApplyJob" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
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
  width: 20%;
  border-radius: 5px;
  height : 20%;
}

.button2 {
  background-color: white; 
  color: black; 
  border: 2px solid #04AA6D;
}

.button2:hover {
  background-color: lightgreen;
  color: black;
}
    </style>
    <form runat="server" id="form1" method="post" enctype="multipart/form-data">
               <div style="margin-left: 300px; margin-right: 50px">
           <asp:FileUpload ID="fup" runat="server" placeholder="Upload Resume" style=" width: 730px; height: 50px;  border-radius: 5px; padding-left: 8px;" /> &nbsp; &nbsp;
                 <br />
            <asp:Button ID="btnupload" runat="server" Text="File Upload" CssClass="button button2" OnClick="btnupload_Click"/><br />
                   <asp:Label ID="lblstatus" runat="server"></asp:Label>
                   <br />
           </div>
    </form>

</asp:Content>
