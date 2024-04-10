using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace JobSeekerPortal.Visitor
{
    public partial class otpverify : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["cnjob"].ConnectionString);
        protected void Page_Load(object sender, EventArgs e)
        {          
            if(!IsPostBack)
            {
                Response.Write("<script>alert('Verification OTP is sent. Kindly check your mail. ')</script>");
            }
        }

        protected void btnhr_Click(object sender, EventArgs e)
        {
            // Session["role"] + " " + Session["emailid"] + " " + Session["otp"] + " " Session["password"]

            int otpt = Convert.ToInt32(txtotp.Text.ToString());
            int otps = Convert.ToInt32(Session["otp"]);

            string email = Session["emailid"].ToString();
            string pass = Session["password"].ToString();
            int urole = Convert.ToInt32(Session["role"].ToString());

            try
            {
                if (otpt == otps)
                {
                    con.Open();
                    string query = "insert into tbluser values(@em,@pw,@ur)";
                    SqlCommand cmd = new SqlCommand(query, con);
                    cmd.Parameters.AddWithValue("@em", email);
                    cmd.Parameters.AddWithValue("@pw", pass);
                    cmd.Parameters.AddWithValue("@ur", urole);

                    int result = cmd.ExecuteNonQuery();
                    cmd.Dispose();

                    if (result > 0)
                    {
                        lblStatus.Text = "Registration Successfully";
                    }
                }
                else
                {
                    lblStatus.Text = "Incorrect OTP";
                }
            }
            catch (Exception)
            {
                lblStatus.Text = "The Email ID is already registered. Kindly sign up again.";
                lbtnlink.Visible = true;
                lblStatus.ForeColor = System.Drawing.Color.Red;


            }
        }

        protected void lbtnlink_Click(object sender, EventArgs e)
        {
            Response.Redirect("UserRegistration.aspx");
        }
    }
}