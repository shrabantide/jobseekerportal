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
    public partial class EditVacancy : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["cnjob"].ConnectionString);
        int hrid, vid;
        string title, des, loc, pac, novac;
        string emailid;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                emailid = Session["useremail"] + "";
                VacancyAll();
            }
        }

        protected void VacancyAll() {
            vid = Convert.ToInt32(Session["vacancyid"]); 
            //userid = Convert.ToInt32(Session["userid"]);
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

                string SELECTQUERY = "SELECT * FROM tblvacancy where hr_id = @hid and vacancyid = @vid ";
                SqlCommand cmd = new SqlCommand(SELECTQUERY, con);
                cmd.Parameters.AddWithValue("@hid", hrid);
                cmd.Parameters.AddWithValue("@vid", vid);
                con.Open();

                SqlDataAdapter adapter = new SqlDataAdapter(cmd);
                cmd.Dispose();

                DataSet ds = new DataSet();
                adapter.Fill(ds);

                if (ds.Tables[0].Rows.Count > 0)
                {
                    title = ds.Tables[0].Rows[0]["vacancy_title"].ToString();
                    des = ds.Tables[0].Rows[0]["vacancy_description"].ToString();
                    loc = ds.Tables[0].Rows[0]["vacancy_location"].ToString();
                    pac = ds.Tables[0].Rows[0]["vacancy_package"].ToString();
                    novac = ds.Tables[0].Rows[0]["vacancy_noofvacancy"].ToString();
                }
                else
                {
                    title = "";
                    des = "";
                    loc = "";
                    pac = "";
                    novac = "";
                }
                txttitle1.Text = title;
                txtdescription1.Text = des;
                txtlocation1.Text = loc;
                txtpackage1.Text = pac;
                txtnoofvacancy1.Text = novac;
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

        protected void updatev_Click(object sender, EventArgs e)
        {
            vid = Convert.ToInt32(Session["vacancyid"]);
            try
            {
                con.Open();
                string update = "update tblvacancy set vacancy_title = @title, vacancy_description = @des, vacancy_location = @loc, vacancy_package = @pack, vacancy_noofvacancy= @numvac where vacancyid = @vacid ";
                SqlCommand cmd = new SqlCommand(update, con);
                cmd.Parameters.AddWithValue("@title", txttitle1.Text.ToString());
                cmd.Parameters.AddWithValue("@des", txtdescription1.Text.ToString());
                cmd.Parameters.AddWithValue("@loc", txtlocation1.Text.ToString());
                cmd.Parameters.AddWithValue("@pack", Convert.ToInt32(txtpackage1.Text));
                cmd.Parameters.AddWithValue("@numvac", Convert.ToInt32(txtnoofvacancy1.Text));
                cmd.Parameters.AddWithValue("@vacid", vid);

                int result = cmd.ExecuteNonQuery();
                cmd.Dispose();

                if (result > 0)
                {
                    Response.Redirect("~/HR/ManageVacancy.aspx");
                }
            }
            catch (Exception ex)
            {
                throw;
                lblStatus.ForeColor = System.Drawing.Color.Red;
                lblStatus.Text = "Details saved unsuccessfully";
            }
            finally
            {
                con.Close();
            }
        }
    }
}