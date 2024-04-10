<%@ Page Title="" Language="C#" MasterPageFile="~/EmployeeMaster.Master" AutoEventWireup="true" CodeBehind="ManageProfile.aspx.cs" Inherits="JobSeekerPortal.Employee.ManageProfile" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
     <style>
        table,tr,td {
            width:150px;
            border-spacing: 0px 20px;
            padding:5px
         
        }
    
.button {
  background-color: #4CAF50; 
  border: none;
  color: white;
  padding: 16px 32px;
  text-align: center;
  text-decoration: none;
  display: inline-block;
  font-size: 16px;
  margin: 4px 2px;
  transition-duration: 0.4s;
  cursor: pointer;
  width: 124%;
  border-radius: 5px;

}

.button2 {
  background-color: white; 
  color: black; 
  border: 2px solid black;
}

.button2:hover {
  background-color: black;
  color: white;
}

    </style>
    <form runat="server">
     <div style="background-color:whitesmoke; height:500px; width:500px; margin-left:500px; font-family:'Times New Roman' ">
         <br /><br />
            <asp:Label ID="label1" runat="server" Text="MANAGE PROFILE"  Font-Size="30px" Font-Bold="true" style="margin-left:130px"></asp:Label>

            <table style="margin-left:-70px">
                                <tr>
                    <td colspan="2">
                        
            <div font-family: Courier New, Courier, monospace;">
                <asp:Label ID="lblemailid" runat="server" Text="Enter Email" Font-Bold="true"></asp:Label>
                &nbsp; &nbsp;
                <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="txtemailid" ForeColor="Red" ErrorMessage="*" style="margin-left : -30px"></asp:RequiredFieldValidator>
                <br />
            </div>
            <div style="margin-left:0px; margin-top:10px; font-family: Courier New, Courier, monospace;">
                <asp:TextBox ID="txtemailid" TextMode="Email" runat="server" Font-Bold="true" Enabled="false"  style=" width: 620px; height: 40px;  border-radius: 5px; padding-left: 8px;"></asp:TextBox>
            </div>
                    </td>
                </tr>
                <tr>
                    <td>
                            <div style=" font-family: Courier New, Courier, monospace;">
                <asp:Label ID="lblfname" runat="server" Text="Enter First Name" Font-Bold="true"></asp:Label>
                &nbsp; &nbsp;
                <asp:RequiredFieldValidator ID="rfv1" runat="server" ControlToValidate="txtfname" ForeColor="Red" ErrorMessage="*" style="margin-left : -30px"></asp:RequiredFieldValidator>
                  &nbsp;
                <asp:RegularExpressionValidator ID="rge1" runat="server" ControlToValidate="txtfname" ForeColor="Red" ErrorMessage="Invalid format" ValidationExpression="[A-Za-z]{3,50}"></asp:RegularExpressionValidator>
                <br />
            </div>
            <div style="margin-left:0px; margin-top:10px; font-family: Courier New, Courier, monospace;">
                <asp:TextBox ID="txtfname" runat="server"   style=" width: 300px; height: 40px;  border-radius: 5px; padding-left: 8px;"></asp:TextBox>
            </div>
                    </td>

                    <td>
                            <div style="font-family: Courier New, Courier, monospace;">
                <asp:Label ID="lbllname" runat="server" Text="Enter Last Name" Font-Bold="true"></asp:Label>
                  &nbsp;
                <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="txtlname" ForeColor="Red" ErrorMessage="Invalid format" ValidationExpression="[A-Za-z]{2,50}"></asp:RegularExpressionValidator>
               
                <br />
            </div>
            <div style="margin-left:0px; margin-top:10px; font-family: Courier New, Courier, monospace;">
                <asp:TextBox ID="txtlname"  runat="server"   style=" width: 300px; height: 40px;  border-radius: 5px; padding-left: 8px;"></asp:TextBox>
            </div>
                    </td>
                </tr>

                 <tr>
                    <td>
                            <div style=" font-family: Courier New, Courier, monospace;">
                <asp:Label ID="lblgender" runat="server" Text="Select Gender" Font-Bold="true"></asp:Label>
                &nbsp; &nbsp;
                
            </div>
            <div style="font-family: Courier New, Courier, monospace;" >
               <asp:DropDownList ID="ddlgenderlist" runat="server"  style=" width: 300px; height: 40px;  border-radius: 5px; padding-left: 8px; border: 2px solid black; margin-top:10px">
                   <asp:ListItem Selected="True" Value="Male"> Male</asp:ListItem>
                   <asp:ListItem Value="Female"> Female</asp:ListItem>
                   <asp:ListItem Value="Others"> Others</asp:ListItem>
               </asp:DropDownList>
            </div>
                    </td>
                     <td>
                            <div style="font-family: Courier New, Courier, monospace;">
                <asp:Label ID="lblcontact" runat="server" Text="Enter Contact" Font-Bold="true"></asp:Label>
                &nbsp; &nbsp;
                <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="txtcontact" ForeColor="Red" ErrorMessage="*" style="margin-left : -30px"></asp:RequiredFieldValidator>
                 &nbsp;
                <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ControlToValidate="txtcontact" ForeColor="Red" ErrorMessage="Invalid format" ValidationExpression="[6789][0-9]{9}"></asp:RegularExpressionValidator>
              <br />
            </div>
            <div style="margin-left:0px; margin-top:10px; font-family: Courier New, Courier, monospace;">
                <asp:TextBox ID="txtcontact" TextMode="Number" runat="server"   style=" width: 300px; height: 40px;  border-radius: 5px; padding-left: 8px;"></asp:TextBox>
            </div>
                    </td>
                </tr>
                
                <tr>
                    
                    <td colspan="2">
                            <div style="font-family: Courier New, Courier, monospace;">
                <asp:Label ID="Label3" runat="server" Text="Enter Address" Font-Bold="true"></asp:Label>
               &nbsp;
                <asp:RegularExpressionValidator ID="RegularExpressionValidator3" runat="server" ControlToValidate="txtaddress" ForeColor="Red" ErrorMessage="Invalid format" ValidationExpression=".{3,250}"></asp:RegularExpressionValidator>
            </div>
            <div style="margin-left:0px; margin-top:10px; font-family: Courier New, Courier, monospace;">
                <asp:TextBox ID="txtaddress" runat="server" TextMode="MultiLine" style=" width: 620px; height: 70px; border:2px solid black; border-radius: 5px; padding: 10px;"></asp:TextBox>
            </div>
                    </td>
                    
                </tr>
            </table>
        <br />
             <asp:Button ID="btnprofile" runat="server" CssClass="button button2" Font-Bold="true" Font-Size="Large" Text="Submit" style="margin-top:-10px; margin-left:-60px" OnClick="btnprofile_Click" />
            <br />
            <asp:Label ID="lblStatus" runat="server" ForeColor="Green"></asp:Label>
       
        </div>
        <br /><br />
        </form>

</asp:Content>
