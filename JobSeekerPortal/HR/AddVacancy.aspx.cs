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
    public partial class AddVacancy : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["cnjob"].ConnectionString);
        int userid, hrid;
        string emailid;
        protected void Page_Load(object sender, EventArgs e)
        {

                emailid = Session["useremail"] + "";

        }

        protected void addv_Click(object sender, EventArgs e)
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
                else
                {
                    hrid = 0;
                }
            }
            catch (Exception ex)
            {
                lblStatus.Text = ex.ToString();
            }
            finally
            {
                con.Close();
            }

            string jobtype = "";
            for (int i = 0; i < chkvtype.Items.Count; i++)
            {
                if (chkvtype.Items[i].Selected)
                {
                    if (jobtype == "")
                    {
                        jobtype = chkvtype.Items[i].Text;
                    }
                    else
                    {
                        jobtype += " and " + chkvtype.Items[i].Value;
                    }
                }
            }

            if (hrid == 0)
            {
                Response.Write("<script>alert('Kindly complete your Profile');</script>");
            }
            else
            {
                try
                {
                    con.Open();
                    string insert = "insert into tblvacancy values (@title, @des, @type, @loc, @pack, @numvac, @hrid)";
                    SqlCommand cmd = new SqlCommand(insert, con);

                    cmd.Parameters.AddWithValue("@title", txttitle.Text.ToString());
                    cmd.Parameters.AddWithValue("@des", txtdescription.Text.ToString());
                    cmd.Parameters.AddWithValue("@type", jobtype);
                    cmd.Parameters.AddWithValue("@loc", txtlocation.Text.ToString());
                    cmd.Parameters.AddWithValue("@pack", Convert.ToInt32(txtpackage.Text));
                    cmd.Parameters.AddWithValue("@numvac", Convert.ToInt32(txtnoofvacancy.Text));
                    cmd.Parameters.AddWithValue("@hrid", hrid);

                    int result = cmd.ExecuteNonQuery();
                    cmd.Dispose();

                    if (result > 0)
                    {
                        lblStatus.Text = "Details saved Successfully";
                    }
                }
                catch (Exception ex)
                {
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
}