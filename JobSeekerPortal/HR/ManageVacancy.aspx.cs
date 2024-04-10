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
    public partial class ManageVacancy : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["cnjob"].ConnectionString);
        int userid, hrid;
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

            userid = Convert.ToInt32(Session["userid"]);
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
                Response.Write("<script>alert('Kindly Complete your profile.')</script>");
            }
            finally
            {
                con.Close();
            }
            try
            {
                
                string SELECTQUERY = "SELECT * FROM tblvacancy where hr_id = @hid ";
                SqlCommand cmd = new SqlCommand(SELECTQUERY, con);
                cmd.Parameters.AddWithValue("@hid", hrid);
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

        }

        protected void lnkbtn2_Click(object sender, EventArgs e)
        {
            LinkButton b = (LinkButton)sender;
            int vid = Convert.ToInt32(b.CommandArgument);

            try
            {
                con.Open();
                string delete = "delete from tblvacancy where vacancyid = @vid";
                SqlCommand cmd = new SqlCommand(delete, con);
                cmd.Parameters.AddWithValue("@vid", vid);

                int result = cmd.ExecuteNonQuery();
                cmd.Dispose();

                if (result > 0)
                {
                    Response.Redirect("~/HR/ManageVacancy.aspx");
                }
            }
            catch (Exception ex)
            {
                lblStatus.ForeColor = System.Drawing.Color.Red;
                lblStatus.Text = "Details saved unsuccessfully";
            }
        }

        protected void lnkbtn1_Click(object sender, EventArgs e)
        {
            LinkButton b = (LinkButton)sender;
            int vid1 = Convert.ToInt32(b.CommandArgument);

            Session["vacancyid"] = vid1;
            Response.Redirect("~/HR/EditVacancy.aspx");
        }
    }
}