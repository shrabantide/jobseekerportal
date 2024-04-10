<%@ Page Title="" Language="C#" MasterPageFile="~/HRmaster.Master" AutoEventWireup="true" CodeBehind="AddVacancy.aspx.cs" Inherits="JobSeekerPortal.HR.AddVacancy" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
     <div style="margin-left: 350px; margin-top:20px">
        <form method="post" runat="server">
    <h1 style="padding-left:450px; margin-top: 10px ; margin-left: -250px ; margin-bottom: 10px " >Add Vacancy Details</h1>
    <asp:Label style="padding-left:450px; margin-top: 10px ; margin-left: -190px ; margin-bottom: 30px" ID="lblStatus" runat="server" ForeColor="Green"></asp:Label>
    <table style="border: 5px solid black ; padding-right: -250px  ; margin-left: 20px ; margin-right:100px; margin-bottom: 50px">
       <tr>
         <td style="width: 900px ; padding-left:20px ; padding-right: 60px ;margin-top: -30px">
             <br />
             <asp:Label ID="lbl" runat="server" Text="Vacancy Title" Font-Bold="true" style="margin: 30px 10px 10px 30px"></asp:Label> 
             &nbsp; <asp:RequiredFieldValidator ID="rfv" runat="server" ControlToValidate="txttitle" ErrorMessage="*" ForeColor="Red"></asp:RequiredFieldValidator>
               &nbsp; <asp:RegularExpressionValidator ID="ref" runat="server" ControlToValidate="txttitle" ValidationExpression=".{2,100}" ErrorMessage="Invalid format" ForeColor="Red"></asp:RegularExpressionValidator>
             <br /> 
                <asp:TextBox ID="txttitle" runat="server"  style="margin: 10px 10px 10px 30px; width: 700px ; height: 35px ; margin-top: 10px"/>
          <br /><br />
                  <asp:Label ID="Label1" runat="server" Text="Vacancy Description" Font-Bold="true" style="margin: 30px 10px 10px 30px"></asp:Label> 
             &nbsp; <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtdescription" ErrorMessage="*" ForeColor="Red"></asp:RequiredFieldValidator>
               &nbsp; <asp:RegularExpressionValidator ID="ref1" runat="server" ControlToValidate="txtdescription" ValidationExpression=".{5,100}" ErrorMessage="Invalid format" ForeColor="Red"></asp:RegularExpressionValidator>
             <br /><br />
                <asp:TextBox ID="txtdescription" TextMode="MultiLine"   runat="server"  style="margin: 10px 10px 10px 30px;width: 700px ; height: 100px ; margin-top: -10px"/>
                

                <b><h4 style="margin: 10px 10px 10px 30px">Vacancy Type: </h4></b>
                     <asp:Panel ID="pn2" runat="server" Enabled="true">
                            <asp:CheckBoxList ID="chkvtype" runat="server" RepeatDirection="Horizontal" style="margin: 10px 10px 10px 30px;width: 700px ; height: 35px ; margin-top: -10px">
                                <asp:ListItem Value="Work from Office" Selected="True">Work from Office</asp:ListItem>
                                <asp:ListItem Value="Work from Home">Work from Home</asp:ListItem>
                            </asp:CheckBoxList>
                     </asp:Panel>

                  <br />
             <asp:Label ID="Label2" runat="server" Text="Location" Font-Bold="true" style="margin: 30px 10px 10px 30px"></asp:Label>
             &nbsp; <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtlocation" ErrorMessage="*" ForeColor="Red"></asp:RequiredFieldValidator>
               &nbsp; <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="txtlocation" ValidationExpression=".{3,100}" ErrorMessage="Invalid format" ForeColor="Red"></asp:RegularExpressionValidator>
             <br /> <br />
                <asp:TextBox id="txtlocation" runat="server"  style="margin: 10px 10px 10px 30px; width: 700px ; height: 35px ; margin-top: -10px"/>
               
                  <br /><br />
             <asp:Label ID="Label3" runat="server" Text="Package Per Month" Font-Bold="true" style="margin: 30px 10px 10px 30px"></asp:Label>
             &nbsp; <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="txtpackage" ErrorMessage="*" ForeColor="Red"></asp:RequiredFieldValidator>
               &nbsp; <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ControlToValidate="txtpackage" ValidationExpression="[1-9][0-9]{2,9}" ErrorMessage="Invalid format" ForeColor="Red"></asp:RegularExpressionValidator>
             <br /> <br />
                <asp:TextBox id="txtpackage" runat="server" TextMode="Number" style="margin: 10px 10px 10px 30px; width: 700px ; height: 35px ; margin-top: -10px"/>

               <br /><br />
                <asp:Label ID="Label4" runat="server" Text="No. of Vacancies" Font-Bold="true" style="margin: 30px 10px 10px 30px"></asp:Label>
             &nbsp; <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="txtnoofvacancy" ErrorMessage="*" ForeColor="Red"></asp:RequiredFieldValidator>
               &nbsp; <asp:RegularExpressionValidator ID="RegularExpressionValidator3" runat="server" ControlToValidate="txtnoofvacancy" ValidationExpression="[1-9][0-9]{0,9}" ErrorMessage="No. of Vacancy should be minimum 1" ForeColor="Red"></asp:RegularExpressionValidator>
             <br /> <br />
                <asp:TextBox id="txtnoofvacancy" runat="server" TextMode="Number" style="margin: 10px 10px 10px 30px; width: 700px ; height: 35px ; margin-top: -10px"/></br><br />
                
                <asp:Button ID="addv" Text="Add Details" runat="server"  style="margin: 10px 10px 10px 30px; width: 700px ; height: 55px ;background-color: cornflowerblue ; color: white ; font-size: 15px" OnClick="addv_Click"/>
                
          </td>

        </tr>
    
    </table>
</form>   
    </div>

</asp:Content>
