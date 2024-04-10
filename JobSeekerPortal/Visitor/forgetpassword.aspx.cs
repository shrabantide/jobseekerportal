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
    public partial class forgetpassword : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["cnjob"].ConnectionString);
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnforgetpw_Click(object sender, EventArgs e)
        {
            con.Open();
            string em = txtemailid.Text.ToString();
            Random rnd = new Random();
            int rotp = rnd.Next(999999);

            string SELECT_QUERY = "select * from tbluser where email='" + txtemailid.Text + "'";
            SqlCommand cmd = new SqlCommand(SELECT_QUERY, con);

            int result = cmd.ExecuteNonQuery();
            DataTable dtfpw = new DataTable();
            SqlDataAdapter adp = new SqlDataAdapter(cmd);
            cmd.Dispose();

            adp.Fill(dtfpw);

            if (dtfpw.Rows.Count > 0)
            {

                string useremail = dtfpw.Rows[0]["email"].ToString();
                Session["uemail"] = useremail;
                Session["otp"] = rotp.ToString();

                try
                {
                    string fromemail = "shrabantide2002@gmail.com";
                    string frompw = "aovyfutghwxrnmhx";

                    MailMessage mm = new MailMessage();
                    mm.From = new MailAddress(fromemail);
                    mm.Subject = "FORGET PASSWORD OTP";
                    mm.To.Add(new MailAddress(em));
                    mm.Body = "<html><body><p style='color: lightblue'><b>Dear User,</b><br/><br/>Your forget password OTP is <b>" + rotp + ".</b></p><p style='color: darkblue '>Have a Nice Day.<br/>Thank You.</p></body></html>";
                    mm.IsBodyHtml = true;

                    var smtpClient = new SmtpClient("smtp.gmail.com")
                    {
                        Port = 587, //25 465
                        Credentials = new NetworkCredential(fromemail, frompw),
                        EnableSsl = true,
                    };

                    smtpClient.Send(mm);

                    Response.Write("<script>alert('Verification OTP is sent. Kindly check your mail. ')</script>");
                    Response.Redirect("~/Visitor/forgetpassword2.aspx");
                }
                catch (Exception ex)
                {
                    throw;
                }
            }
            else
            {
                lblStatus.Text = em + " is not registered.";
            }
        }
    }
}