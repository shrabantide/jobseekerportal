using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Net;
using System.Net.Mail;
using System.Web.UI.WebControls;

namespace JobSeekerPortal.Employee
{
    public partial class AppliedJob : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["cnjob"].ConnectionString);

        string emailid;
    
        protected void Page_Load(object sender, EventArgs e)
        {
            emailid = Session["useremail"] + "";
            if (!IsPostBack)
            {

                ViewAllJobs();

            }
        }
        protected void ViewAllJobs() {
        try
            {
                con.Open();
                string select = "select * from tbljob inner join tblvacancy on tbljob.vacancyid = tblvacancy.vacancyid inner join tblhr on tblvacancy.hr_id = tblhr.hrid where tbljob.empemail = @email";
                SqlCommand cmd = new SqlCommand(select, con);
                cmd.Parameters.AddWithValue("@email", emailid);


                SqlDataAdapter adapter = new SqlDataAdapter(cmd);
                cmd.Dispose();

                DataSet ds = new DataSet();
                adapter.Fill(ds);

                if (ds.Tables[0].Rows.Count > 0)
                {
                    lvjoblist.DataSource = ds;
                    lvjoblist.DataBind();
                }
                else
                {
                    lvjoblist.Visible = false;
                    lblStatus.Text = "You didn't applied for Job ";
                    lblStatus.ForeColor = System.Drawing.Color.Red;
                }

            }
            catch (Exception ex)
            {
                throw;
            }
            finally
            {
                con.Close();
            }

        }
    }
}