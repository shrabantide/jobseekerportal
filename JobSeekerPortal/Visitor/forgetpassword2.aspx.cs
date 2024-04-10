using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace JobSeekerPortal.Visitor
{
    public partial class forgetpassword2 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                Response.Write("<script>alert('Forget Password OTP is sent. Kindly check your mail. ')</script>");
            }
        }

        protected void btnotpverify_Click(object sender, EventArgs e)
        {
            int otpt = Convert.ToInt32(txtotp.Text.ToString());
            int otps = Convert.ToInt32(Session["otp"]);

            if (otps == otpt)
            {
                Response.Redirect("forgetpassword3.aspx");
            }
            else
            {
                lblStatus.Text = "Incorrect OTP. ";
            }
        }
    }
}