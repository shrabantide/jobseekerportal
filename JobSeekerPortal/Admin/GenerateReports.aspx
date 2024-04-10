<%@ Page Title="" Language="C#" MasterPageFile="~/Adminmaster.Master" AutoEventWireup="true" CodeBehind="GenerateReports.aspx.cs" Inherits="JobSeekerPortal.Admin.GenerateReports" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
     <style>

             
.button {
  background-color: #4CAF50; 
  border: none;
  color: white;
  padding: 10px 28px;
  text-align: center;
  text-decoration: none;
  display: inline-block;
  font-size: 16px;
  margin: 4px 2px;
  transition-duration: 0.4s;
  cursor: pointer;
  width: 65%;
  border-radius: 5px;
  height : 10%;
}

.button2 {
  background-color: white; 
  color: black; 
  border: 2px solid black;
}

.button2:hover {
  background-color: black;
  color: dodgerblue;
}

        table {
            border-collapse: collapse;
        }

        th, td {
            text-align: center;
            padding: 8px;
        }

        tr:nth-child(even){background-color: #f2f2f2}
    
        th {
            border-collapse: collapse;
            background-color: #04AA6D;
            color:white;
        }

    </style>
    <form runat="server">
        <br /><br /> <br /><br />
        <center>
                  <asp:Label ID="lblhead" runat="server" Font-Bold="true" Font-Size="XX-Large" Text="GENERATE REPORTS" style="margin-left : 150px"></asp:Label>
           
            </center>
        <br /><br /><br /> <br /><br />
        <center>
            <div style="margin-left: 100px; margin-right: 50px; width : 100%">
                <asp:DropDownList ID="ddlgen" runat="server"  style=" width: 65%; height: 45px; border:2px solid black; border-radius: 5px; padding-left: 8px;">
                    <asp:ListItem Value="0" Selected="True">View HRs</asp:ListItem>
                    <asp:ListItem Value="1">View Employees</asp:ListItem>
                    <asp:ListItem Value="2">View Applied Employees</asp:ListItem>
                </asp:DropDownList>
          <br /> <br />

             <asp:Button ID="btngen" runat="server" CssClass="button button2" Font-Bold="true" Font-Size="Large" Text="GENERATE"  style="margin-top:10px " OnClick="btngen_Click" />
           </div>
        </center>
         <br />
        
        </form>
</asp:Content>
