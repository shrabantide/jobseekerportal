<%@ Page Title="" Language="C#" MasterPageFile="~/HRmaster.Master" AutoEventWireup="true" CodeBehind="EditVacancy.aspx.cs" Inherits="JobSeekerPortal.HR.EditVacancy" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div style="margin-left: 350px; margin-top:20px">
        <form method="post" runat="server">
    <h1 style="padding-left:450px; margin-top: 10px ; margin-left: -200px ; margin-bottom: 10px " >Edit Vacancy Details</h1>
    <asp:Label style="padding-left:450px; margin-top: 10px ; margin-left: -190px ; margin-bottom: 30px" ID="lblStatus" runat="server" ForeColor="Green"></asp:Label>
    <table style="border: 5px solid black ; padding-right: -250px  ; margin-left: 20px ; margin-right:100px; margin-bottom: 50px">
       <tr>
         <td style="width: 900px ; padding-left:20px ; padding-right: 60px ;margin-top: -50px">
              <br />
             <asp:Label ID="lbl" runat="server" Text="Vacancy Title" Font-Bold="true" style="margin: 30px 10px 10px 30px"></asp:Label> 
             &nbsp; <asp:RequiredFieldValidator ID="rfv" runat="server" ControlToValidate="txttitle1" ErrorMessage="*" ForeColor="Red"></asp:RequiredFieldValidator>
               &nbsp; <asp:RegularExpressionValidator ID="ref" runat="server" ControlToValidate="txttitle1" ValidationExpression=".{2,100}" ErrorMessage="Invalid format" ForeColor="Red"></asp:RegularExpressionValidator>
             <br /> 
                <asp:TextBox ID="txttitle1" runat="server"  style="margin: 10px 10px 10px 30px; width: 700px ; height: 35px ; margin-top: 10px"/>
          <br /><br /> <asp:Label ID="Label1" runat="server" Text="Vacancy Description" Font-Bold="true" style="margin: 30px 10px 10px 30px"></asp:Label> 
             &nbsp; <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtdescription1" ErrorMessage="*" ForeColor="Red"></asp:RequiredFieldValidator>
               &nbsp; <asp:RegularExpressionValidator ID="ref1" runat="server" ControlToValidate="txtdescription1" ValidationExpression=".{5,100}" ErrorMessage="Invalid format" ForeColor="Red"></asp:RegularExpressionValidator>
             <br /><br />
                <asp:TextBox ID="txtdescription1" TextMode="MultiLine"   runat="server"  style="margin: 10px 10px 10px 30px;width: 700px ; height: 100px ; margin-top: -10px"/>
                
             <br />
                <asp:Label ID="Label2" runat="server" Text="Location" Font-Bold="true" style="margin: 30px 10px 10px 30px"></asp:Label>
             &nbsp; <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtlocation1" ErrorMessage="*" ForeColor="Red"></asp:RequiredFieldValidator>
               &nbsp; <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="txtlocation1" ValidationExpression=".{3,100}" ErrorMessage="Invalid format" ForeColor="Red"></asp:RegularExpressionValidator>
             <br /> <br />
                <asp:TextBox id="txtlocation1" runat="server"  style="margin: 10px 10px 10px 30px; width: 700px ; height: 35px ; margin-top: -10px"/>
               
                  <br /><br /> <asp:Label ID="Label3" runat="server" Text="Package" Font-Bold="true" style="margin: 30px 10px 10px 30px"></asp:Label>
             &nbsp; <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="txtpackage1" ErrorMessage="*" ForeColor="Red"></asp:RequiredFieldValidator>
               &nbsp; <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ControlToValidate="txtpackage1" ValidationExpression="[1-9][0-9]{2,9}" ErrorMessage="Invalid format" ForeColor="Red"></asp:RegularExpressionValidator>
             <br /> <br />
                <asp:TextBox id="txtpackage1" runat="server" TextMode="Number" style="margin: 10px 10px 10px 30px; width: 700px ; height: 35px ; margin-top: -10px"/>

               <br /><br />
               <asp:Label ID="Label4" runat="server" Text="No. of Vacancies" Font-Bold="true" style="margin: 30px 10px 10px 30px"></asp:Label>
             &nbsp; <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="txtnoofvacancy1" ErrorMessage="*" ForeColor="Red"></asp:RequiredFieldValidator>
               &nbsp; <asp:RegularExpressionValidator ID="RegularExpressionValidator3" runat="server" ControlToValidate="txtnoofvacancy1" ValidationExpression="[1-9][0-9]{0,9}" ErrorMessage="No. of Vacancy should be minimum 1" ForeColor="Red"></asp:RegularExpressionValidator>
             <br /> <br />
                <asp:TextBox id="txtnoofvacancy1" runat="server" TextMode="Number" style="margin: 10px 10px 10px 30px; width: 700px ; height: 35px ; margin-top: -10px"/></br><br />
                
     
                <asp:Button ID="updatev" Text="Add Details" runat="server"  style="margin: 10px 10px 10px 30px; width: 700px ; height: 55px ;background-color: cornflowerblue ; color: white ; font-size: 15px" OnClick="updatev_Click"/>
                
          </td>

        </tr>
        <tr>
            <td>
                
               
            </td>
        </tr>
    </table>
</form>   
    </div>

</asp:Content>
