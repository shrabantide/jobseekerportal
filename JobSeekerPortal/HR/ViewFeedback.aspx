<%@ Page Title="" Language="C#" MasterPageFile="~/HRmaster.Master" AutoEventWireup="true" CodeBehind="ViewFeedback.aspx.cs" Inherits="JobSeekerPortal.HR.ViewFeedback" %>
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
            width: 900px;
        }

        tr:nth-child(even){background-color: #f2f2f2}
    
        th {
            border-collapse: collapse;
            background-color: #04AA6D;
            color:white;
        }

    </style>
    <form runat="server">

        <div style="margin-left: 310px; margin-right: 50px">
        <asp:ListView ID="lvvacancylist" runat="server" GroupPlaceholderID="gp" ItemPlaceholderID="ip">
                         <LayoutTemplate>
                             <table border="1">
                                     <tr style="border:2px solid black; padding-bottom:-30px">
                        
                                                 <th style="text-align:center">Feedbacks</th>
                                                
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
                      <%# Eval("review") %>

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
