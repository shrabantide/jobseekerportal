<%@ Page Title="" Language="C#" MasterPageFile="~/EmployeeMaster.Master" AutoEventWireup="true" CodeBehind="ResumeBuilding.aspx.cs" Inherits="JobSeekerPortal.Employee.ResumeBuilding" %>
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
  width: 127%;
  border-radius: 5px;

}

.button2 {
  background-color: white; 
  color: black; 
  border: 2px solid blue;
}

.button2:hover {
  background-color: cornflowerblue;
  color: white;
}

    </style>
    <form runat="server">
     <div style="background-color:whitesmoke; height:500px; width:500px; margin-left:500px; font-family:'Times New Roman' ">
         <br /><br />
            <asp:Label ID="label1" runat="server" Text="RESUME BUILDING"  Font-Size="30px" Font-Bold="true" style="margin-left:130px"></asp:Label>
        
            <table style="margin-left:-70px">
                                <tr>
                    <td colspan="2">
                        
            <div font-family: Courier New, Courier, monospace;">
                <asp:Label ID="lblemailid" runat="server" Text="Enter Email" Font-Bold="true"></asp:Label>
              
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
                    &nbsp; &nbsp;
                  <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtlname" ForeColor="Red" ErrorMessage="*" style="margin-left : -30px"></asp:RequiredFieldValidator>
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
                <asp:Label ID="lblbio" runat="server" Text="Enter Your Bio" Font-Bold="true"></asp:Label>
                &nbsp; &nbsp;
                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtbio" ForeColor="Red" ErrorMessage="*" style="margin-left : -30px"></asp:RequiredFieldValidator>
                 &nbsp;
                <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ControlToValidate="txtbio" ForeColor="Red" ErrorMessage="Invalid format" ValidationExpression=".{3,50}"></asp:RegularExpressionValidator>
                <br />
            </div>
            <div style="margin-left:0px; margin-top:10px; font-family: Courier New, Courier, monospace;">
                <asp:TextBox ID="txtbio" runat="server" style=" width: 300px; height: 40px;  border-radius: 5px; padding-left: 8px;"></asp:TextBox>
            </div>
                    </td>

                    <td>
                            <div style="font-family: Courier New, Courier, monospace;">
                <asp:Label ID="lblcontact" runat="server" Text="Enter Contact" Font-Bold="true"></asp:Label>
                &nbsp; &nbsp;
                <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="txtcontact" ForeColor="Red" ErrorMessage="*" style="margin-left : -30px"></asp:RequiredFieldValidator>
                 &nbsp;
                <asp:RegularExpressionValidator ID="RegularExpressionValidator3" runat="server" ControlToValidate="txtcontact" ForeColor="Red" ErrorMessage="Invalid format" ValidationExpression="[6789][0-9]{9}"></asp:RegularExpressionValidator>
                <br />
            </div>
            <div style="margin-left:0px; margin-top:10px; font-family: Courier New, Courier, monospace;">
                <asp:TextBox ID="txtcontact" TextMode="Number" runat="server"   style=" width: 300px; height: 40px;  border-radius: 5px; padding-left: 8px;"></asp:TextBox>
            </div>
                    </td>
                </tr>
                 <tr>
                    <td>
                            <div style=" font-family: Courier New, Courier, monospace;">
                <asp:Label ID="lblprofession" runat="server" Text="Enter Profession" Font-Bold="true"></asp:Label>
                &nbsp; &nbsp;
                
             <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="txtprofession" ForeColor="Red" ErrorMessage="*" style="margin-left : -30px"></asp:RequiredFieldValidator>
                &nbsp;
                <asp:RegularExpressionValidator ID="RegularExpressionValidator4" runat="server" ControlToValidate="txtprofession" ForeColor="Red" ErrorMessage="Invalid format" ValidationExpression="[A-Za-z ]{3,15}"></asp:RegularExpressionValidator>
                                <br />
            </div>
            <div style="margin-left:0px; margin-top:10px; font-family: Courier New, Courier, monospace;">
                <asp:TextBox ID="txtprofession" runat="server"   style=" width: 300px; height: 40px;  border-radius: 5px; padding-left: 8px;"></asp:TextBox>
            </div>
                </td>    

                    <td>
                            <div style="font-family: Courier New, Courier, monospace;">
                <asp:Label ID="Label3" runat="server" Text="Enter Address" Font-Bold="true"></asp:Label>
             &nbsp; &nbsp;
                
            <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ControlToValidate="txtaddress" ForeColor="Red" ErrorMessage="*" style="margin-left : -30px"></asp:RequiredFieldValidator>
                                  &nbsp;
                <asp:RegularExpressionValidator ID="RegularExpressionValidator5" runat="server" ControlToValidate="txtaddress" ForeColor="Red" ErrorMessage="Invalid format" ValidationExpression=".{3,100}"></asp:RegularExpressionValidator>
                <br />
            </div>
            <div style="margin-left:0px; margin-top:10px; font-family: Courier New, Courier, monospace;">
                <asp:TextBox ID="txtaddress" runat="server" style=" width: 300px; height: 40px; border:2px solid black; border-radius: 5px; padding-left: 8px;"></asp:TextBox>
            </div>
                    </td>
                </tr>
        <tr>
                                <td>
                            <div style="font-family: Courier New, Courier, monospace;">
                <asp:Label ID="Label2" runat="server" Text="Enter Education" Font-Bold="true"></asp:Label>
              &nbsp; &nbsp;
                
            <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ControlToValidate="txteducation" ForeColor="Red" ErrorMessage="*" style="margin-left : -30px"></asp:RequiredFieldValidator>
                &nbsp;
                <asp:RegularExpressionValidator ID="RegularExpressionValidator6" runat="server" ControlToValidate="txteducation" ForeColor="Red" ErrorMessage="Invalid format" ValidationExpression=".{3,250}"></asp:RegularExpressionValidator>
                                
                                <br />
            </div>
            <div style="margin-left:0px; margin-top:10px; font-family: Courier New, Courier, monospace;">
                <asp:TextBox ID="txteducation" TextMode="MultiLine" runat="server" style=" width: 300px; height: 100px; padding:10px; border:2px solid black; border-radius: 5px; padding-left: 8px;"></asp:TextBox>
            </div>
                    </td>
             <td>
                            <div style="font-family: Courier New, Courier, monospace;">
                <asp:Label ID="Label4" runat="server" Text="Enter Sills" Font-Bold="true"></asp:Label>
              &nbsp; &nbsp;
                
            <asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" ControlToValidate="txtskills" ForeColor="Red" ErrorMessage="*" style="margin-left : -30px"></asp:RequiredFieldValidator>
                &nbsp;
                <asp:RegularExpressionValidator ID="RegularExpressionValidator7" runat="server" ControlToValidate="txtskills" ForeColor="Red" ErrorMessage="Invalid format" ValidationExpression=".{3,250}"></asp:RegularExpressionValidator>
               <br />
            </div>
            <div style="margin-left:0px; margin-top:10px; font-family: Courier New, Courier, monospace;">
                <asp:TextBox ID="txtskills" runat="server" TextMode="MultiLine" style=" width: 300px; height: 100px; padding:10px; border:2px solid black; border-radius: 5px; padding-left: 8px;"></asp:TextBox>
            </div>
                    </td>
        </tr>
                <tr>
                                <td>
                            <div style="font-family: Courier New, Courier, monospace;">
                <asp:Label ID="Label5" runat="server" Text="Enter Projects & Researches" Font-Bold="true"></asp:Label>
              &nbsp; &nbsp;
                
            <asp:RequiredFieldValidator ID="RequiredFieldValidator9" runat="server" ControlToValidate="txtpar" ForeColor="Red" ErrorMessage="*" style="margin-left : -30px"></asp:RequiredFieldValidator>
                                  &nbsp;
                <asp:RegularExpressionValidator ID="RegularExpressionValidator" runat="server" ControlToValidate="txtpar" ForeColor="Red" ErrorMessage="Invalid format" ValidationExpression=".{3,250}"></asp:RegularExpressionValidator>
                <br />
            </div>
            <div style="margin-left:0px; margin-top:10px; font-family: Courier New, Courier, monospace;">
                <asp:TextBox ID="Txtpar" runat="server" TextMode="MultiLine" style=" width: 300px; height: 100px; padding:10px; border:2px solid black; border-radius: 5px; padding-left: 8px;"></asp:TextBox>
            </div>
                    </td>
             <td>
                            <div style="font-family: Courier New, Courier, monospace;">
                <asp:Label ID="Label6" runat="server" Text="Enter Other Details" Font-Bold="true"></asp:Label>
              &nbsp; &nbsp;
                
            <asp:RequiredFieldValidator ID="RequiredFieldValidator10" runat="server" ControlToValidate="txtotherdetails" ForeColor="Red" ErrorMessage="*" style="margin-left : -30px"></asp:RequiredFieldValidator>
                                  &nbsp;
                <asp:RegularExpressionValidator ID="RegularExpressionValidator8" runat="server" ControlToValidate="txtotherdetails" ForeColor="Red" ErrorMessage="Invalid format" ValidationExpression=".{1,150}"></asp:RegularExpressionValidator>
                <br />
            </div>
            <div style="margin-left:0px; margin-top:10px; font-family: Courier New, Courier, monospace;">
                <asp:TextBox ID="txtotherdetails" runat="server" TextMode="MultiLine" style=" width: 300px; height: 100px; padding:10px; border:2px solid black; border-radius: 5px; padding-left: 8px;"></asp:TextBox>
            </div>
                    </td>
        </tr>
            </table>
        <br />
             <asp:Button ID="btnresume" runat="server" CssClass="button button2" Font-Bold="true" Font-Size="Large" Text="Submit" style="margin-top:-20px; margin-left:-70px" OnClick="btnresume_Click" />
            <br />
            <asp:Label ID="lblStatus" runat="server" ForeColor="Green"></asp:Label>
       
        </div>

        </form>
</asp:Content>
