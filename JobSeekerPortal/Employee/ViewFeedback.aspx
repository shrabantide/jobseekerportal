<%@ Page Title="" Language="C#" MasterPageFile="~/EmployeeMaster.Master" AutoEventWireup="true" CodeBehind="ViewFeedback.aspx.cs" Inherits="JobSeekerPortal.Employee.ViewFeedback" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
      <style>
        table {
            border-collapse: collapse;
        }

        th, td {
            text-align: center;
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
        <br />
        <center>
             <asp:Label ID="Label1" runat="server" Text="All Feedbacks" Font-Bold="true" Font-Size="Larger"></asp:Label>
            
        </center>
        <br />
    
        <asp:ListView ID="lvvacancylist" runat="server" GroupPlaceholderID="gp" ItemPlaceholderID="ip">
                         <LayoutTemplate>
                             <table border="1">
                                     <tr style="border:2px solid black; padding-bottom:-30px">
                        
                                                <th style="text-align:center">Company Name</th>
                                                 <th style="text-align:center">Feedback</th>
                                                
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
                      <%# Eval("companyname") %>

                    </td>

                    <td>
                      <%# Eval("review") %>

                    </td>
           
                         </ItemTemplate>
                     </asp:ListView> 
            </div>

            <br />
        <br />
         <div style="margin-left: 310px; margin-right: 50px">
             <center>
                 
        <asp:Label ID="lbl" runat="server" Text="My Feedbacks" Font-Bold="true" Font-Size="Larger"></asp:Label>
                 
             </center>
             <br />
        <asp:ListView ID="ListView1" runat="server" GroupPlaceholderID="gp" ItemPlaceholderID="ip">
                         <LayoutTemplate>
                             <table border="1">
                                     <tr style="border:2px solid black; padding-bottom:-30px">
                        
                                                <th style="text-align:center">Company Name</th>
                                                 <th style="text-align:center">Feedback</th>
                                                <th style="text-align:center">Delete</th>
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
                      <%# Eval("companyname") %>

                    </td>

                    <td>
                      <%# Eval("review") %>

                    </td>
                    <td>
                        <asp:LinkButton ID="lnkdelete" runat="server" OnClick="lnkdelete_Click" CommandArgument='<%# Eval("feedbackid") %>' Text="Delete" ></asp:LinkButton>
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
