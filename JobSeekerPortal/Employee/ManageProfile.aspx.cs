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
    public partial class ManageProfile : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["cnjob"].ConnectionString);
        int userid;
        string fn, ln, contact, gen, addr;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                txtemailid.Text = Session["useremail"] + "";
                FetchProfile();

            }


        }
        protected void FetchProfile()
        {
            int g = 0;
            try
            {
                string SELECTQUERY = "SELECT * FROM tblemployee where emailid = @em";
                SqlCommand cmd = new SqlCommand(SELECTQUERY, con);
                cmd.Parameters.AddWithValue("@em", txtemailid.Text.ToString());
                con.Open();

                SqlDataAdapter adapter = new SqlDataAdapter(cmd);
                cmd.Dispose();

                DataSet ds = new DataSet();
                adapter.Fill(ds);

                if (ds.Tables[0].Rows.Count > 0)
                {
                    fn = ds.Tables[0].Rows[0]["fname"].ToString();
                    ln = ds.Tables[0].Rows[0]["lname"].ToString();
                 
                    contact = ds.Tables[0].Rows[0]["contact"].ToString();
                    gen = ds.Tables[0].Rows[0]["gender"].ToString();
                    addr = ds.Tables[0].Rows[0]["address"].ToString();
                }
                else
                {
                    fn = "";
                    ln = "";
                
                    contact = "";
                    gen = "";
                    addr = "";
                }
                txtfname.Text = fn;
                txtlname.Text = ln;
              
                txtcontact.Text = contact;

                if (gen.Contains("Male"))
                {
                    g = 0;
                }
                if (gen.Contains("Female"))
                {
                    g = 1;
                }
                if (gen.Contains("Others"))
                {
                    g = 2;
                }
                ddlgenderlist.SelectedIndex = g;

                txtaddress.Text = addr;


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

        protected void btnprofile_Click(object sender, EventArgs e)
        {

            string SELECTQUERY = "SELECT * FROM tblemployee where emailid = @em";
            SqlCommand cmds = new SqlCommand(SELECTQUERY, con);
            cmds.Parameters.AddWithValue("@em", txtemailid.Text.ToString());
            con.Open();

            SqlDataAdapter adapter = new SqlDataAdapter(cmds);
            cmds.Dispose();

            DataSet ds = new DataSet();
            adapter.Fill(ds);

            if (ds.Tables[0].Rows.Count > 0)
            {
                try
                {

                    string update = "update tblemployee set fname = @fname, lname = @lname, contact = @contactno, gender = @gen, address = @add where emailid = @emailid";
                    SqlCommand cmd = new SqlCommand(update, con);
                    cmd.Parameters.AddWithValue("@fname", txtfname.Text.ToString());
                    cmd.Parameters.AddWithValue("@lname", txtlname.Text.ToString());
                    cmd.Parameters.AddWithValue("@contactno", Convert.ToInt64(txtcontact.Text));
                    cmd.Parameters.AddWithValue("@gen", ddlgenderlist.SelectedValue.ToString());
                    cmd.Parameters.AddWithValue("@add", txtaddress.Text.ToString());
                    cmd.Parameters.AddWithValue("@emailid", txtemailid.Text.ToString());

                    int result = cmd.ExecuteNonQuery();
                    cmd.Dispose();

                    if (result > 0)
                    {
                        lblStatus.Text = "Details saved Successfully";
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
                    FetchProfile();

                }
            }
            else
            {
                try
                {

                    string update = "insert into tblemployee values (@fname, @lname, @contactno, @gen, @add, @emailid)";
                    SqlCommand cmd = new SqlCommand(update, con);
                    cmd.Parameters.AddWithValue("@fname", txtfname.Text.ToString());
                    cmd.Parameters.AddWithValue("@lname", txtlname.Text.ToString());
                    cmd.Parameters.AddWithValue("@contactno", txtcontact.Text);
                    cmd.Parameters.AddWithValue("@gen", ddlgenderlist.SelectedValue.ToString());
                    cmd.Parameters.AddWithValue("@add", txtaddress.Text.ToString());
                    cmd.Parameters.AddWithValue("@emailid", txtemailid.Text.ToString());

                    int result = cmd.ExecuteNonQuery();
                    cmd.Dispose();

                    if (result > 0)
                    {
                        lblStatus.Text = "Details saved Successfully";
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
                    FetchProfile();

                }
            }
        }
    }
}