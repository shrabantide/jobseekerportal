using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace JobSeekerPortal.Employee
{
    public partial class ApplyJob : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["cnjob"].ConnectionString);
        string emailid, filename, extension;
        int vid;
        int fsize;

        protected void btnprint_Click(object sender, EventArgs e)
        {
            lblstatus.Text = "jkkj";
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            emailid = Session["useremail"] + "";
        }

        protected void btnupload_Click(object sender, EventArgs e)
        {
            vid = Convert.ToInt32(Session["vid"]);
            if (fup.HasFile)
            {
                filename = fup.PostedFile.FileName;
                extension = Path.GetExtension(filename);
                fsize = fup.PostedFile.ContentLength;
                int flag = 0;

                switch (extension.ToLower())
                {
                    case ".doc":
                    case ".docx":
                    case ".pdf":
                        flag = 1;
                        break;
                    default:
                        flag = 0;
                        break;

                }
                if (flag == 1)
                {
                    fup.SaveAs(Server.MapPath("~/Resumesuploaded/" + filename));
                    try
                    {
                        string insert = "insert into tbljob values (@vid, @eemail, @approve, @res, @res_size)";
                        con.Open();
                        SqlCommand cmd = new SqlCommand(insert, con);
                        cmd.Parameters.AddWithValue("@vid", vid);
                        cmd.Parameters.AddWithValue("@eemail", emailid);
                        cmd.Parameters.AddWithValue("@approve", "0");
                        cmd.Parameters.AddWithValue("@res", filename);
                        cmd.Parameters.AddWithValue("@res_size", fsize / 1024);

                        int result = cmd.ExecuteNonQuery();
                        cmd.Dispose();

                        if (result > 0)
                        {
                            lblstatus.Text = "Resume Uploaded Successfully.. ";
                            lblstatus.ForeColor = System.Drawing.Color.Green;
                            
                        }
                        else
                        {
                            lblstatus.Text = "Resume Uploaded unsuccessfully";
                            lblstatus.ForeColor = System.Drawing.Color.Red;
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
                else
                {
                    lblstatus.Text = "Only .doc, .docx and .pdf file is allowed.";
                }
            }
            else
            {
                lblstatus.Text = "Select your resume.";
            }

            
        }
    }
}