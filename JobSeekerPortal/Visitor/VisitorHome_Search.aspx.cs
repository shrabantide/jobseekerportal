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
    public partial class VisitorHome_Search : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["cnjob"].ConnectionString);
        protected void Page_Load(object sender, EventArgs e)
        {
            searches();
        }

        public void searches() {
            dlall.Visible = false;
            dlalljobs.Visible = false;
            string title = Request.QueryString["t"];
            string cname = Request.QueryString["c"];

            if (title == "" || title == " " || cname == "" || cname == " ")
            {
                title = " ";
                cname = " ";
            }

            if (title == " " && cname == " ")
            {
                try
                {
                    dlall.Visible = true;
                    string SELECTQUERY = "SELECT * FROM tblvacancy inner join tblhr on tblvacancy.hr_id = tblhr.hrid where tblvacancy.vacancy_noofvacancy > 0  ";
                    SqlCommand cmd = new SqlCommand(SELECTQUERY, con);
                    con.Open();

                    SqlDataAdapter adapter = new SqlDataAdapter(cmd);
                    cmd.Dispose();

                    DataSet ds = new DataSet();
                    adapter.Fill(ds);

                    if (ds.Tables[0].Rows.Count > 0)
                    {
                        dlall.DataSource = ds;
                        dlall.DataBind();
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
            else if (title != " " && cname == " ")   // one condition with search query
            {
                try
                {
                    dlalljobs.Visible = true;
                    string SELECTQUERY = "SELECT * FROM tblvacancy where vacancy_noofvacancy > 0 and vacancy_title = @title ";
                    SqlCommand cmd = new SqlCommand(SELECTQUERY, con);
                    cmd.Parameters.AddWithValue("@title", title);
                    con.Open();

                    SqlDataAdapter adapter = new SqlDataAdapter(cmd);
                    cmd.Dispose();

                    DataSet ds = new DataSet();
                    adapter.Fill(ds);

                    if (ds.Tables[0].Rows.Count > 0)
                    {
                        dlalljobs.DataSource = ds;
                        dlalljobs.DataBind();
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
            else if (title == " " && cname != " ")   // one condition with search query
            {

            }
            else                                   // two conditions with search query
            {

            }
        }

    }
}