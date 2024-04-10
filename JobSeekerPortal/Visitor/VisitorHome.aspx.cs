using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace JobSeekerPortal.Visitor
{
    public partial class VisitorHome : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["cnjob"].ConnectionString);
        string title="", cname="";
        protected void Page_Load(object sender, EventArgs e)
        {
            getAllCompanies();
            getAllJobs();
        }

        public void getAllCompanies()
        {
            try
            {
                string SELECTQUERY = "SELECT companyname FROM tblhr";
                SqlCommand cmd = new SqlCommand(SELECTQUERY, con);

                con.Open();

                SqlDataAdapter adapter = new SqlDataAdapter(cmd);
                cmd.Dispose();

                DataTable ds = new DataTable();
                adapter.Fill(ds);

                ds.Rows.Add(" ");
               
                ddlsearchcompany.DataSource = ds;
                ddlsearchcompany.DataValueField = "companyname";
                ddlsearchcompany.DataTextField = "companyname";
                ddlsearchcompany.DataBind();
                
            }
            catch
            {
                throw;
            }
            finally
            {
                con.Close();
            }
        }
        public void getAllJobs() {
        try
            {
                string SELECTQUERY = "SELECT vacancy_title FROM tblvacancy where vacancy_noofvacancy > 0  ";
                SqlCommand cmd = new SqlCommand(SELECTQUERY, con);

                con.Open();

                SqlDataAdapter adapter = new SqlDataAdapter(cmd);
                cmd.Dispose();

                DataTable ds = new DataTable();
                adapter.Fill(ds);

                ds.Rows.Add(" ");

                ddljob.DataSource = ds;
                ddljob.DataValueField = "vacancy_title";
                ddljob.DataTextField = "vacancy_title";
                ddljob.DataBind();
            }
            catch
            {
                throw;
            }
            finally
            {
                con.Close();
            }
        }
        protected void btnhr_Click(object sender, EventArgs e)
        {
            Response.Write("<script>alert('Kindly Login')</script>");
        }
    }
}