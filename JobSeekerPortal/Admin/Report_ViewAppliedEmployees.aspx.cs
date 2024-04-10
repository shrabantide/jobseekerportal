using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using iTextSharp.text;
using iTextSharp.text.pdf;
using iTextSharp.tool.xml;
using System.IO;
namespace JobSeekerPortal.Admin
{
    public partial class Report_ViewAppliedEmployees : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["cnjob"].ConnectionString);

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                ViewAllAppliedEmployees();
                printReport();
            }
        }
        protected void ViewAllAppliedEmployees()
        {
            try
            {
                con.Open();
                string select = "select * from tblemployee inner join tbljob on tblemployee.emailid = tbljob.empemail inner join tblvacancy on tbljob.vacancyid = tblvacancy.vacancyid";
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

        protected void printReport()
        {
            using (StringWriter sw = new StringWriter())
            {
                using (HtmlTextWriter hw = new HtmlTextWriter(sw))
                {
                    this.pn.RenderControl(hw);
                    // this.Page.RenderControl(hw);
                    StringReader sr = new StringReader(sw.ToString());
                    Document pdfDoc = new Document(PageSize.A4, 10f, 10f, 10f, 10f);
                    PdfWriter writer = PdfWriter.GetInstance(pdfDoc, Response.OutputStream);
                    pdfDoc.Open();
                    XMLWorkerHelper.GetInstance().ParseXHtml(writer, pdfDoc, sr);
                    pdfDoc.Close();
                    Response.ContentType = "application/pdf";
                    Response.AddHeader("content-disposition", "attachment;filename=report_appliedEmployees.pdf");
                    Response.Cache.SetCacheability(HttpCacheability.NoCache);
                    Response.Write(pdfDoc);
                    Response.End();
                }
            }
            Response.Redirect("~/Admin/GenerateReports.aspx");
        }
    }
}