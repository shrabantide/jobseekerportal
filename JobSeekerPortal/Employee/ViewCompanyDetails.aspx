<%@ Page Title="" Language="C#" MasterPageFile="~/EmployeeMaster.Master" AutoEventWireup="true" CodeBehind="ViewCompanyDetails.aspx.cs" Inherits="JobSeekerPortal.Employee.ViewCompanyDetails" %>
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
        <div style="margin-left: 300px; margin-right: 50px; width : 80%">
             <asp:ListView ID="lvhrlist" runat="server" GroupPlaceholderID="gp" ItemPlaceholderID="ip"  >
                         <LayoutTemplate>
                             <table border="1" style="width:90%" >
                                     <tr style="border:2px solid black; padding-bottom:-30px">
                                                 <th style="text-align:center" colspan="2">HR name</th>
                                                 <th style="text-align:center">Company Name</th>
                                                 <th style="text-align:center">Contact</th>
                                                 <th style="text-align:center">Address</th>
                                                 <th style="text-align:center">EmailID</th>
                                           
                                         </tr>
                                 <tr id="gp" runat="server"> </tr>
                                
                             </table>
                         </LayoutTemplate>
                         <GroupTemplate>
                             <tr>
                                 <tr id="ip" runat="server"></tr>
                             </tr>
                         </GroupTemplate>
                         <ItemTemplate>
                            
                    <td colspan="2">
                       <%# Eval("fname") + " "  + Eval("lname") %>
                        
                    </td>
                 
                    <td>
                          <%# Eval("companyname") %>
                    </td>

               
                    <td>
                      <%# Eval("contact") %>

                    </td>


                    <td>
                      <%# Eval("address") %>

                    </td>
                    <td>
                      <%# Eval("emailid") %>

                    </td>
                         </ItemTemplate>
                     </asp:ListView> 
            </div>
            <br />
            
    </form>
</asp:Content>
