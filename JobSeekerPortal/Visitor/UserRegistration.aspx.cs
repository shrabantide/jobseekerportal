using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Mail;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace JobSeekerPortal.Visitor
{
    public partial class UserRegistration : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                //data is loaded whenever the page is loaded for the first time. it vanishes whenever loaded after the first time
            }
        }

        protected void btnhr_Click(object sender, EventArgs e)
        {
            int role = Convert.ToInt32(ddlrole.SelectedValue.ToString());

            Random rnd = new Random();
            int rotp = rnd.Next(999999);

            string password = txtpassword.Text.ToString();
            var encryptedpw = EasyEncryption.MD5.ComputeMD5Hash(password);
            password = encryptedpw;

            string em = txtemailid.Text.ToString();

            Session["emailid"] = txtemailid.Text.ToString();
            Session["password"] = password.ToString();
            Session["role"] = role;

            Session["otp"] = rotp.ToString();
            try
             {
                 string fromemail = "shrabantide2002@gmail.com";
                 string frompw = "aovyfutghwxrnmhx";

                 MailMessage mm = new MailMessage();
                 mm.From = new MailAddress(fromemail);
                 mm.Subject = "OTP VERIFICATION FROM KEEP SEEKERS";
                 mm.To.Add(new MailAddress(em));
                 mm.Body = "<html><body><p style='color: lightblue'><b>Dear User,</b><br/><br/>Your verification OTP is <b>" + rotp + ".</b></p><p style='color: darkblue '>Have a Nice Day.<br/>Thank You.</p></body></html>";
                 mm.IsBodyHtml = true;

                 var smtpClient = new SmtpClient("smtp.gmail.com")
                 {
                     Port = 587, //25 465
                     Credentials = new NetworkCredential(fromemail, frompw),
                     EnableSsl = true,
                 };

                 smtpClient.Send(mm);

                 Response.Write("<script>alert('Verification OTP is sent. Kindly check your mail. ')</script>");
                 Response.Redirect("~/Visitor/otpverify.aspx");
             }
             catch (Exception ex)
             {
                 throw;
             }
        }
    }
}