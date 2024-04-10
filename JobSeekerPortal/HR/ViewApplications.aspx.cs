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

namespace JobSeekerPortal.HR
{
    public partial class ViewApplications : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["cnjob"].ConnectionString);
        int userid, hrid;
        string emailid;
        int vid, jid;
        protected void Page_Load(object sender, EventArgs e)
        {
            emailid = Session["useremail"] + "";

            if (!IsPostBack) {
                ViewAllJobs();
            }

        }

        protected void lnkapply_Click(object sender, EventArgs e)
        {
            LinkButton b = (LinkButton)sender;

            string arguments = b.CommandArgument;
            string[] args = arguments.Split(',');
            vid = Convert.ToInt32(args[1]);
            jid = Convert.ToInt32(args[0]);

            try
            {
                con.Open();
                string update1 = "update tbljob set approve = @app where jobid = @jid";
                SqlCommand cmd = new SqlCommand(update1, con);
                cmd.Parameters.AddWithValue("@app", "1");
                cmd.Parameters.AddWithValue("@jid", jid);

                string update2 = "update tblvacancy set vacancy_noofvacancy = vacancy_noofvacancy - 1 where vacancyid = @vid";
                SqlCommand cmd1 = new SqlCommand(update2, con);
                cmd1.Parameters.AddWithValue("@vid", vid);

                int result = cmd.ExecuteNonQuery();
                cmd.Dispose();

                int result1 = cmd1.ExecuteNonQuery();
                cmd1.Dispose();

                if (result > 0 && result1 > 0)
                {
                    con.Close();
                    
                    lblStatus.ForeColor = System.Drawing.Color.Green;
                    lblStatus.Text = "Job Approved Successfully";

                }
            }
            catch (Exception ex)
            {
                lblStatus.ForeColor = System.Drawing.Color.Red;
                lblStatus.Text = "Details saved unsuccessfully";
            }
            finally
            {

                Response.Redirect("~/HR/ViewApplications.aspx");
            }
          
        }

        protected void ViewAllJobs()
        {
            try
            {
                string SELECTQUERY = "SELECT * FROM tblhr where emailid = @em";
                SqlCommand cmds = new SqlCommand(SELECTQUERY, con);
                cmds.Parameters.AddWithValue("@em", emailid);
                con.Open();

                SqlDataAdapter adapter = new SqlDataAdapter(cmds);
                cmds.Dispose();

                DataSet ds = new DataSet();
                adapter.Fill(ds);

                if (ds.Tables[0].Rows.Count > 0)
                {
                    hrid = Convert.ToInt32(ds.Tables[0].Rows[0]["hrid"]);
                }

            }
            catch (Exception ex)
            {
                // Response.Write("<script>alert('Kindly Complete your profile.')</script>");
                throw;
            }
            finally
            {
                con.Close();
            } 
            try
            {
                con.Open();
                string select = "select tblvacancy.vacancy_title, tblvacancy.vacancy_location, tblvacancy.vacancy_type, tblvacancy.vacancy_package, tbljob.jobid, tbljob.empemail, tbljob.approve, tbljob.resume, tbljob.resume_size, tbljob.vacancyid from tbljob inner join tblvacancy on tbljob.vacancyid = tblvacancy.vacancyid where tblvacancy.hr_id = @hrid and tbljob.approve = 0 and tblvacancy.vacancy_noofvacancy > 0";
                SqlCommand cmd = new SqlCommand(select, con);
                cmd.Parameters.AddWithValue("@hrid", hrid);
                

                SqlDataAdapter adapter = new SqlDataAdapter(cmd);
                cmd.Dispose();

                DataSet ds = new DataSet();
                adapter.Fill(ds);

                if (ds.Tables[0].Rows.Count > 0)
                {
                    gvalljobs.DataSource = ds;
                    gvalljobs.DataBind();
                }
                else
                {
                    gvalljobs.Visible = false;
                    lblStatus.Text = "No Applications Pending. ";
                }

            }
            catch (Exception ex)
            {
                throw;
            }
            finally {
                con.Close();
            }
            
        }

    }
}