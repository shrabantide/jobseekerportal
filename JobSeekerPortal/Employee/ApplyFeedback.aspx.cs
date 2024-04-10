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
    public partial class ApplyFeedback : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["cnjob"].ConnectionString);
        string email;
        protected void Page_Load(object sender, EventArgs e)
        {
            email = Session["useremail"] + "";
            getCompanyDetails();
            getAllFeedbacks();
        }

        protected void getAllFeedbacks() { 
            
        }

        protected void getCompanyDetails() {
            try
            {
                string SELECTQUERY = "SELECT companyname FROM tblhr";
                SqlCommand cmd = new SqlCommand(SELECTQUERY, con);
                con.Open();

                SqlDataAdapter adapter = new SqlDataAdapter(cmd);
                cmd.Dispose();

                DataSet dsrp = new DataSet();
                adapter.Fill(dsrp);

                if (dsrp.Tables[0].Rows.Count > 0)
                {
                    ddlcompany.DataSource = dsrp;
                    ddlcompany.DataValueField = "companyname";
                    ddlcompany.DataTextField = "companyname";
                    ddlcompany.DataBind();
                }
            }
            catch (Exception e)
            {
                throw;
            }
            finally
            {
                con.Close();
            }
        }

        protected void btnfeedbac_Click(object sender, EventArgs e)
        {
            string companyname = ddlcompany.SelectedValue.ToString();
            string feedback = txtfeedback.Text.ToString();

            try
            {
                con.Open();
                string insert = "insert into tblfeedback values(@cname, @fback, @email)";
                SqlCommand cmd = new SqlCommand(insert, con);
                cmd.Parameters.AddWithValue("@cname", companyname);
                cmd.Parameters.AddWithValue("@fback", feedback);
                cmd.Parameters.AddWithValue("email", email);

                int result = cmd.ExecuteNonQuery();
                cmd.Dispose();

                if (result > 0)
                {
                    lblStatus.Text = "Feedback submitted successfully";
                    txtfeedback.Text = "";
                }

            }
            catch (Exception ex)
            {
                lblStatus.ForeColor = System.Drawing.Color.Red;
                lblStatus.Text = "Something went wrong";
            }
            finally {
                con.Close();
                
            }
        }
    }
}