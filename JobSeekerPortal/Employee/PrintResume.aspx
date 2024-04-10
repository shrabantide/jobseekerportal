<%@ Page Title="" Language="C#" MasterPageFile="~/EmployeeMaster.Master" AutoEventWireup="true" CodeBehind="PrintResume.aspx.cs" Inherits="JobSeekerPortal.Employee.PrintResume" %>
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
  width: 58%;
  border-radius: 5px;

}

.button2 {
  background-color: white; 
  color: black; 
  border: 2px solid salmon;
}

.button2:hover {
  background-color: papayawhip;
  color: black;
}
    </style>
     <form id="form1" runat="server">
    <asp:Panel ID="pnprint" runat="server" style="margin-left:400px">
           <div style="background-color: darksalmon; width: 85%;  height: 100px; text-align: center; padding-top:17px;">
               <asp:Label ID="lblname" runat="server" ForeColor="Black" Font-Size="XX-Large"></asp:Label>
               <br />
               <asp:Label ID="lblprofession" runat="server" ForeColor="Black" Font-Size="Small" style="padding-right: 145px"></asp:Label>
           </div>
            <table style="width:85%">
                <tr>
                    <td style="background-color: lightcyan; width: 35%;  height: 500px; text-align: left; padding:10px 10px 20px 20px; ">
                         <asp:Label ID="bio" runat="server" Font-Bold="true" Font-Size="Medium">PROFILE</asp:Label><br /><br />
                    <asp:Label ID="lblbio" runat="server"></asp:Label>
                    <br />
                    <br />
                    <br />
                    <br />
                    <asp:Label ID="Label1" runat="server" Font-Bold="true" Font-Size="Medium">CONTACT ME </asp:Label><br /><br />
                    <asp:Label ID="phn1" runat="server" Font-Bold="true">Phone : </asp:Label><asp:Label ID="phn2" runat="server"></asp:Label> <br /> <br />
                    <asp:Label ID="emailid1" runat="server" Font-Bold="true">Email : </asp:Label><asp:Label ID="emailid2" runat="server"></asp:Label> <br /> <br />
                    <asp:Label ID="address1" runat="server" Font-Bold="true">Address : </asp:Label><asp:Label ID="address2" runat="server"></asp:Label> 
                    </td>
                <td style="background-color: papayawhip; width: 85%;  height: 500px; text-align: left; padding:30px 10px 20px 20px;">
                
                    <asp:Label ID="lblEducation" runat="server" Font-Bold="true" Font-Size="Medium">EDUCATION </asp:Label><br /><br />
                    <asp:Label ID="edu" runat="server"></asp:Label><br /><br /><br />

                    <asp:Label ID="lblskills" runat="server" Font-Bold="true" Font-Size="Medium">SKILLS </asp:Label><br /><br />
                    <asp:Label ID="skills" runat="server" ></asp:Label><br /><br /><br />

                    <asp:Label ID="lblpar" runat="server" Font-Bold="true" Font-Size="Medium">PROJECT AND RESEARCH </asp:Label><br /><br />
                    <asp:Label ID="par" runat="server" ></asp:Label><br /><br /><br />

                    <asp:Label ID="lblod" runat="server" Font-Bold="true" Font-Size="Medium">Other Details</asp:Label><br /><br />
                    <asp:Label ID="od" runat="server" ></asp:Label><br /><br /><br />
              
            </td>
                    </tr>
            </table>
    </asp:Panel>
         <asp:Button ID="btnprint" runat="server" CssClass="button button2" Font-Bold="true" Font-Size="Large" Text="Print Your Resume" style="margin-top:50px; margin-left:400px" OnClick="btnprint_onclick" />
          
         </form>
</asp:Content>
