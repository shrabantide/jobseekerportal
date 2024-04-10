<%@ Page Title="" Language="C#" MasterPageFile="~/HRmaster.Master" AutoEventWireup="true" CodeBehind="ViewApplications.aspx.cs" Inherits="JobSeekerPortal.HR.ViewApplications" %>
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
            <asp:GridView ID="gvalljobs" runat="server" AutoGenerateColumns="False" Width="90%">
                <Columns>
                    <asp:BoundField DataField="empemail" HeaderText="Employee Email" />

                    <asp:TemplateField>
                        <ItemTemplate>
                            
                             <asp:Label Text='<%# Eval("approve").ToString() == "1" ? "Approved" : "Pending" %>' runat="server" />
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:BoundField DataField="vacancy_title" HeaderText="Title" />
                    <asp:BoundField DataField="vacancy_location" HeaderText="Location" />
                    <asp:BoundField DataField="vacancy_type" HeaderText="Type" />
                    <asp:BoundField DataField="vacancy_package" HeaderText="Package" />
                    <asp:HyperLinkField DataNavigateUrlFields="resume" DataNavigateUrlFormatString="~/Resumesuploaded/{0}" DataTextField="resume" HeaderText="Resume" />
                    <asp:TemplateField>
                        <ItemTemplate>
                            <asp:LinkButton ID="lnkapply" Text="Approve" runat="server" CommandArgument='<%# Eval("jobid") + ","  + Eval("vacancyid") %>' OnClick="lnkapply_Click" />
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>

            </asp:GridView>
            </div>
            <br />
            <div style="margin-left: 300px; margin-right: 50px">
                <asp:Label ID="lblStatus" runat="server"></asp:Label>
                </div>
    </form>
</asp:Content>

