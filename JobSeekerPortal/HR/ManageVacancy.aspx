<%@ Page Title="" Language="C#" MasterPageFile="~/HRmaster.Master" AutoEventWireup="true" CodeBehind="ManageVacancy.aspx.cs" Inherits="JobSeekerPortal.HR.ManageVacancy" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
            <style>
        table {
            border-collapse: collapse;
        }

        th, td {
            text-align: left;
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
        <asp:ListView ID="lvvacancylist" runat="server" GroupPlaceholderID="gp" ItemPlaceholderID="ip">
                         <LayoutTemplate>
                             <table border="1">
                                     <tr style="border:2px solid black; padding-bottom:-30px">
                                                 <th style="text-align:center">Title</th>
                                                 <th style="text-align:center">Description</th>
                                                 <th style="text-align:center">Type</th>
                                                 <th style="text-align:center">Location</th>
                                                 <th style="text-align:center">Package</th>
                                                 <th style="text-align:center">No. of vacancy</th>
                                                 <th colspan="2" style="text-align:center">Actions</th>
                                                
                                                
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
                        <asp:LinkButton ID="lnkbtn1" runat="server" CommandName="Edit" CommandArgument='<%# Eval("vacancyid") %>' CausesValidation="false" OnClick="lnkbtn1_Click">EDIT</asp:LinkButton>

                    </td>


                    <td>
                         <asp:LinkButton ID="lnkbtn2" runat="server" CommandName="deactive" CommandArgument='<%# Eval("vacancyid") %>' CausesValidation="false" OnClick="lnkbtn2_Click">DELETE</asp:LinkButton>

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
