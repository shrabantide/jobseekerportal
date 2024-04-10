using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace JobSeekerPortal.Employee
{
    public partial class ResumeBuilding : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (!IsPostBack)
                {
                    txtemailid.Text = Session["useremail"] + "";
                   //abc();
                }
            }
        }

        protected void abc() {
            //txtemailid.Text = "2205102110013@gmail.com";
            //txtfname.Text = "Shrabanti";
            //txtlname.Text = "De";
            //txtbio.Text = "I am an IT Enthusiastic. ghjkljhjkjhvijhvkj hjg hgjhjh hjjhjh";
            //txtcontact.Text = "9090908889";
            //txtprofession.Text = "Student";
            //txtaddress.Text = "D-03/13, KAPS ANUMALA, PO: ANUMALA, DISTRICT: TAPI, GUJARAT, 394651";
            //txteducation.Text = "PARUL UNIVERSITY \nMasters of Science in Information Technology, 2022 - present \nUKA TARSADIA UNIVERSITY \nBachlors of Science in Information Technology, 2019 - 2022";
            //txtskills.Text = "Operating Systems: Windows, Linux \nDatabases: MySQL, SQL Server Management Studio \nTools: MS Office, MS Visual Code, MS Visual Studio  Eclipse, Apache NetBeans \nLanguages: C, C++ Core, Java, C# Web \nTechnologies: ASP.NET, HTML, CSS, PHP";
            //Txtpar.Text = "P R O J E C T S  \nOnline Bus Ticket Booking System in 2022  \nJob Seeker Portal in 2023  \nR E S E A R C H  \nCurrently working on Hand Gesture Recognition";
            //txtotherdetails.Text = "-";
        }

        protected void btnresume_Click(object sender, EventArgs e)
        {
            //Session["emailid"];
            //Session["fname"];
            //Session["lname"];
            //Session["bio"];
            //Session["contact"];
            //Session["profession"];
            //Session["address"];
            //Session["education"];
            //Session["skills"];
            //Session["par"];
            //Session["otherdetails"];

            Session["emailid"] = txtemailid.Text;
            Session["fname"] = txtfname.Text;
            Session["lname"] = txtlname.Text;
            Session["bio"] = txtbio.Text;
            Session["contact"] =  txtcontact.Text;
            Session["profession"] = txtprofession.Text;
            Session["address"] = txtaddress.Text;
            Session["education"] = txteducation.Text;

            Session["skills"] = txtskills.Text;
            Session["par"] = Txtpar.Text;
            Session["otherdetails"] = txtotherdetails.Text;

            Response.Redirect("~/Employee/PrintResume.aspx");
        }
    }
}