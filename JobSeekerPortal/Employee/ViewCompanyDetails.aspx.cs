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
    public partial class ViewCompanyDetails : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["cnjob"].ConnectionString);
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                BindVacancy();
            }
        }
        public void BindVacancy()
        {
            try
            {

                string SELECTQUERY = "SELECT * FROM tblhr ";
                SqlCommand cmd = new SqlCommand(SELECTQUERY, con);
                con.Open();

                SqlDataAdapter adapter = new SqlDataAdapter(cmd);
                cmd.Dispose();

                DataSet ds = new DataSet();
                adapter.Fill(ds);

                if (ds.Tables[0].Rows.Count > 0)
                {
                    lvhrlist.DataSource = ds;
                    lvhrlist.DataBind();
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