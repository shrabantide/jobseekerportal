<%@ Page Title="" Language="C#" MasterPageFile="~/VisitorMaster.Master" AutoEventWireup="true" CodeBehind="VisitorHome_Search.aspx.cs" Inherits="JobSeekerPortal.Visitor.VisitorHome_Search" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
     <asp:DataList ID="dlall" runat="server" RepeatColumns="1" Visible="false">
        <ItemTemplate>
            <table width="100%" style ="border: 1px solid black; margin-top:20px; height:290px">
                <tr>
                    <td style="padding-right:80px; padding-left:80px">
                        <asp:Label ID="Label1" runat="server" Text="Vacancy Title" ForeColor="Blue"></asp:Label><%# Eval("vacancy_title") %>
                        
                    </td>
                    <td style="padding-right:80px">
                        <asp:Label ID="Label2" runat="server" Text="Company Name :" ForeColor="Blue"></asp:Label><%# Eval("companyname") %>

                    </td>
                    <td style="padding-right:80px">
                          <asp:Label ID="Label3" runat="server" Text="No of Vacancy :" ForeColor="Blue"></asp:Label><%# Eval("vacancy_noofvacancy") %>
                    </td>

                </tr>
                <tr>
                    <td style="padding-right:80px; padding-left:80px">
                        <asp:Label ID="Label4" runat="server" Text="Job Location :" ForeColor="Blue"></asp:Label><%# Eval("vacancy_location") %>
                        
                    </td>
                    <td style="padding-right:80px">
                        <asp:Label ID="Label5" runat="server" Text="Job Package:" ForeColor="Blue"></asp:Label><%# Eval("vacancy_package") %>
                       

                    </td>
                    <td style="padding-right:80px">
                         <asp:Label ID="Label6" runat="server" Text="Job Type:" ForeColor="Blue"></asp:Label><%# Eval("vacancy_type") %>

                    </td>
                </tr>
                <tr>
                    <td style="padding-right:80px; padding-left:80px" colspan="3">
                        <asp:Label ID="Label7" runat="server" Text="Job Description :" ForeColor="Blue"></asp:Label><%# Eval("vacancy_description") %>
                        
                    </td>
         

                </tr>
         
            </table>
            <br>
            </br>
        </ItemTemplate>
        
    </asp:DataList>
         <asp:DataList ID="dlalljobs" runat="server" RepeatColumns="1" Visible="false">
        <ItemTemplate>
            <table width="100%" style ="border: 1px solid black; margin-top:20px; height:290px">
                <tr>
                    <td style="padding-right:80px; padding-left:80px">
                        <asp:Label ID="Label1" runat="server" Text="Vacancy Title" ForeColor="Blue"></asp:Label><%# Eval("vacancy_title") %>
                        
                    </td>
                    
                    <td style="padding-right:80px">
                          <asp:Label ID="Label3" runat="server" Text="No of Vacancy :" ForeColor="Blue"></asp:Label><%# Eval("vacancy_noofvacancy") %>
                    </td>
                    <td style="padding-right:80px; padding-left:80px">
                        <asp:Label ID="Label4" runat="server" Text="Job Location :" ForeColor="Blue"></asp:Label><%# Eval("vacancy_location") %>
                        
                    </td>

                </tr>
                <tr>
                    
                    <td style="padding-right:80px">
                        <asp:Label ID="Label5" runat="server" Text="Job Package:" ForeColor="Blue"></asp:Label><%# Eval("vacancy_package") %>
                       

                    </td>
                    <td style="padding-right:80px" colspan="2">
                         <asp:Label ID="Label6" runat="server" Text="Job Type:" ForeColor="Blue"></asp:Label><%# Eval("vacancy_type") %>

                    </td>
                </tr>
                <tr>
                    <td style="padding-right:80px; padding-left:80px" colspan="3">
                        <asp:Label ID="Label7" runat="server" Text="Job Description :" ForeColor="Blue"></asp:Label><%# Eval("vacancy_description") %>
                        
                    </td>
         

                </tr>
         
            </table>
            <br>
            </br>
        </ItemTemplate>
        
    </asp:DataList>
</asp:Content>
