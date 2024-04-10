using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace JobSeekerPortal.Employee
{
    public partial class ViewFeedback : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["cnjob"].ConnectionString);
        string email;
        protected void Page_Load(object sender, EventArgs e)
        {
            email = Session["useremail"] + "";
            
                BindFeedback();
                BindFeedbackmyemail();
            
        }
        public void BindFeedbackmyemail() {
            try
            {
                string SELECTQUERY = "SELECT * FROM tblfeedback where empemail = @em";
                SqlCommand cmd = new SqlCommand(SELECTQUERY, con);
                cmd.Parameters.AddWithValue("@em", email);
                con.Open();

                SqlDataAdapter adapter = new SqlDataAdapter(cmd);
                cmd.Dispose();

                DataSet ds = new DataSet();
                adapter.Fill(ds);

                if (ds.Tables[0].Rows.Count > 0)
                {
                    ListView1.DataSource = ds;
                    ListView1.DataBind();
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
        public void BindFeedback()
        {
            try
            {
                string SELECTQUERY = "SELECT * FROM tblfeedback ";
                SqlCommand cmd = new SqlCommand(SELECTQUERY, con);
                
                con.Open();

                SqlDataAdapter adapter = new SqlDataAdapter(cmd);
                cmd.Dispose();

                DataSet ds = new DataSet();
                adapter.Fill(ds);

                if (ds.Tables[0].Rows.Count > 0)
                {
                    lvvacancylist.DataSource = ds;
                    lvvacancylist.DataBind();
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

        protected void lnkdelete_Click(object sender, EventArgs e)
        {
            LinkButton b = (LinkButton)sender;
            int fid = Convert.ToInt32(b.CommandArgument);

            con.Open();
            string delete = "delete from tblfeedback where feedbackid = @fid";
            SqlCommand cmd = new SqlCommand(delete, con);
            cmd.Parameters.AddWithValue("@fid", fid);

            int result = cmd.ExecuteNonQuery();

            if (result > 0)
            {
                Response.Write("<script>alert('Record deleted successfully');</script>");
            }
            else
            {
                Response.Write("<script>alert('Record deleted unsuccessfully');</script>");
            }

            con.Close();

            Response.Redirect("~/Employee/ViewFeedback.aspx");
        }
    }
}