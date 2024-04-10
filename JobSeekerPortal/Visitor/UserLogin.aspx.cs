using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Net;
using System.Net.Mail;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace JobSeekerPortal.Visitor
{
    public partial class UserLogin : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["cnjob"].ConnectionString);
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnlogin_Click(object sender, EventArgs e)
        {
            con.Open();

            String pwd1 = txtpassword.Text.ToString();
            String pwdencrypt = EasyEncryption.MD5.ComputeMD5Hash(pwd1);
            String pwd = pwdencrypt;

            string SELECT_QUERY = "select * from tbluser where email='" + txtemailid.Text + "' and password='" + pwd + "'";
            SqlCommand cmd = new SqlCommand(SELECT_QUERY, con);

            int result = cmd.ExecuteNonQuery();
            DataTable dtlogin = new DataTable();
            SqlDataAdapter adp = new SqlDataAdapter(cmd);
            cmd.Dispose();
            adp.Fill(dtlogin);

            if (dtlogin.Rows.Count > 0)
            {
                String userrole = dtlogin.Rows[0]["userrole"].ToString();
                String userid = dtlogin.Rows[0]["userid"].ToString();
                String useremail = dtlogin.Rows[0]["email"].ToString();


                Session["userid"] = userid;
                Session["useremail"] = useremail;

                if (userrole.Equals("0"))
                {
                    Response.Redirect("~/Employee/ViewVacancy.aspx");

                }
                else if (userrole.Equals("1"))
                {
                    Response.Redirect("~/HR/ManageProfile.aspx");
                }
                else if (userrole.Equals("2"))
                {
                    Response.Redirect("~/Admin/GenerateReports.aspx");                    
                }
            }
            else
            {
                lblstatus.Text = "Login Unsuccessful";
            }

            con.Close();
        }
    }
}