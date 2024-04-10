<%@ Page Title="" Language="C#" MasterPageFile="~/EmployeeMaster.Master" AutoEventWireup="true" CodeBehind="ViewVacancy.aspx.cs" Inherits="JobSeekerPortal.Employee.ViewVacancy" %>
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
        <div style="margin-left: 300px; margin-right: 50px">
            <asp:TextBox ID="txtsearch" runat="server" placeholder="Search"  style=" width: 650px; height: 50px;  border-radius: 5px; padding-left: 8px;"></asp:TextBox>
            <asp:Button ID="btnsearch" runat="server" Text="Search" CssClass="button button2" OnClick="btnsearch_Click"/><br /><br /><br />
        <asp:ListView ID="lvvacancylist" runat="server" GroupPlaceholderID="gp" ItemPlaceholderID="ip">
                         <LayoutTemplate>
                             <table border="1">
                                     <tr style="border:2px solid black; padding-bottom:-30px">
                                                 <th style="text-align:center">Title</th>
                                                 <th style="text-align:center">Company Name</th>
                                                 <th style="text-align:center">Description</th>
                                                 <th style="text-align:center">Type</th>
                                                 <th style="text-align:center">Location</th>
                                                 <th style="text-align:center">Package</th>
                                                 <th style="text-align:center">No. of vacancy</th>
                                                 <th style="text-align:center">Apply</th>
                                                
                                                
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
                            
                    <td>
                       <%# Eval("vacancy_title") %>
                        
                    </td>
                   <td>
                       <%# Eval("companyname") %>
                        
                    </td>
                    <td>
                        <%# Eval("vacancy_description") %>

                    </td>
                    <td>
                          <%# Eval("vacancy_type") %>
                    </td>

               
                    <td>
                      <%# Eval("vacancy_location") %>

                    </td>


                    <td>
                      <%# Eval("vacancy_package") %>

                    </td>
                    <td>
                      <%# Eval("vacancy_noofvacancy") %>

                    </td>
                 
                    <td>
                        <asp:LinkButton ID="lnkbtn1" runat="server" CommandArgument='<%# Eval("vacancyid") %>' CausesValidation="false" OnClick="lnkbtn1_Click">APPLY</asp:LinkButton>

                    </td>


                
                         </ItemTemplate>
                     </asp:ListView> 
            </div>
            <br />
            <div style="margin-left: 300px; margin-right: 50px">
                <asp:Label ID="lblStatus" runat="server"></asp:Label>
                </div>
    </form>
</asp:Content>
