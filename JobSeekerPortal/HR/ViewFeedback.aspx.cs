using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace JobSeekerPortal.HR
{
    public partial class ViewFeedback : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["cnjob"].ConnectionString);
        string emailid;
        string comname;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                emailid = Session["useremail"] + "";
                BindFeedback();
            }
        }
        public void BindFeedback()
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
                    comname = ds.Tables[0].Rows[0]["companyname"].ToString();
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
            try
            {
                string SELECTQUERY = "SELECT * FROM tblfeedback where companyname = @cname ";
                SqlCommand cmd = new SqlCommand(SELECTQUERY, con);
                cmd.Parameters.AddWithValue("@cname", comname);
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
            finally {
                con.Close();
            }

        }
    }
}