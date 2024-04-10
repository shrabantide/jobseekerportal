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
    public partial class ViewHRs : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["cnjob"].ConnectionString);

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                ViewAllHR();
            }
        }

        protected void ViewAllHR() {
            try
            {
                con.Open();
                string select = "select * from tblhr";
                SqlCommand cmd = new SqlCommand(select, con);


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
                    lblStatus.Text = "There's no details in the database ";
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