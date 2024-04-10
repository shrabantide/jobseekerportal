using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace JobSeekerPortal.Admin
{
    public partial class ChangePassword : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["cnjob"].ConnectionString);
        int userid;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                txtemailid.Text = Session["useremail"] + "";
            }
        }

        protected void btnadmn_Click(object sender, EventArgs e)
        {
            userid = Convert.ToInt32(Session["userid"]);
            String pwd1 = txtpassword.Text.ToString();
            String pwdencrypt = EasyEncryption.MD5.ComputeMD5Hash(pwd1);
            String pwd = pwdencrypt;

            try
            {
                con.Open();
                string update = "update tbluser set password = @pass where userid = @uid";
                SqlCommand cmd = new SqlCommand(update, con);
                cmd.Parameters.AddWithValue("@pass", pwd);
                cmd.Parameters.AddWithValue("@uid", userid);

                int result = cmd.ExecuteNonQuery();
                cmd.Dispose();

                if (result > 0)
                {
                    lblStatus.Text = "Password Changed Successfully";
                }
            }
            catch (Exception ex)
            {
                throw;
                lblStatus.ForeColor = System.Drawing.Color.Red;
                lblStatus.Text = "Password Changed unsuccessfully";
            }
            finally
            {
                con.Close();
            }
        
        }
    }
}