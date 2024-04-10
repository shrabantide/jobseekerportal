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
    public partial class ViewVacancy : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["cnjob"].ConnectionString);
        string emailid;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                emailid = Session["useremail"] + "";
                BindVacancy();
            }
        }
        public void BindVacancy()
        {
            try
            {

                string SELECTQUERY = "SELECT * FROM tblvacancy inner join tblhr on tblvacancy.hr_id = tblhr.hrid where tblvacancy.vacancy_noofvacancy > 0  ";
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

        protected void lnkbtn1_Click(object sender, EventArgs e)
        {
            LinkButton b = (LinkButton)sender;
            int vid = Convert.ToInt32(b.CommandArgument);

            Session["vid"] = vid;
            Response.Redirect("~/Employee/ApplyJob.aspx");
        }

        protected void btnsearch_Click(object sender, EventArgs e)
        {
            string search = "";


            if (txtsearch.Text != "")
            {
                search = txtsearch.Text.ToString();
            }
            else
            {
                search = " ";
            }

            try
            {
                string searchbynamequery = "select * from tblvacancy inner join tblhr on tblvacancy.hr_id = tblhr.hrid where (tblhr.companyname Like '%' + @param1 + '%' OR tblvacancy.vacancy_title Like '%' + @param1 + '%' OR tblvacancy.vacancy_description Like '%' + @param1 + '%' OR tblvacancy.vacancy_type Like '%' + @param1 + '%' OR tblvacancy.vacancy_location Like '%' + @param1 + '%' OR tblvacancy.vacancy_package Like '%' + @param1 + '%' OR tblvacancy.vacancy_noofvacancy Like '%' + @param1 + '%') and tblvacancy.vacancy_noofvacancy > 0 ";

                SqlCommand cmd = new SqlCommand(searchbynamequery, con);

                cmd.Parameters.AddWithValue("@param1", search);

                con.Open();

                SqlDataAdapter adapter = new SqlDataAdapter(cmd);
                cmd.Dispose();

                DataSet dsone = new DataSet();
                adapter.Fill(dsone);
                if (dsone.Tables[0].Rows.Count > 0)
                {
                    lvvacancylist.DataSource = dsone;
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