using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Net;
using System.Net.Mail;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace JobSeekerPortal.Visitor
{
    public partial class forgetpassword3 : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["cnjob"].ConnectionString);
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnfpwc_Click(object sender, EventArgs e)
        {
            string email = Session["uemail"].ToString();
            string password = txtpassword.Text.ToString();

            var encryptedpw = EasyEncryption.MD5.ComputeMD5Hash(password);
            password= encryptedpw;

            try
            {
                con.Open();
                string query = "update tbluser set password = @pw where email = @em";
                SqlCommand cmd = new SqlCommand(query, con); 
                cmd.Parameters.AddWithValue("@em", email);
                cmd.Parameters.AddWithValue("@pw", password);

                int result = cmd.ExecuteNonQuery();
                cmd.Dispose();

                if (result > 0)
                {
                    lblstatus.Text = "Password Updated Successfully";
                }
            }
            catch (Exception ex)
            {
                throw;
            }
        }
    }
}