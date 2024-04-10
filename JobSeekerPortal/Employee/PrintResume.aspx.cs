using iTextSharp.text;
using iTextSharp.text.pdf;
using iTextSharp.tool.xml;
using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace JobSeekerPortal.Employee
{
    public partial class PrintResume : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            lblname.Text = Session["fname"] + " " + Session["lname"];
            lblprofession.Text = Session["profession"] + "";
            lblbio.Text = Session["bio"] + "";
            phn2.Text = Session["contact"] + "";
            emailid2.Text = Session["emailid"] + "";
            address2.Text = Session["address"] + "";
            edu.Text = Session["education"] + "";
            skills.Text = Session["skills"] + "";
            par.Text = Session["par"] + "";
            od.Text = Session["otherdetails"] + "";
        }

        protected void btnprint_onclick(object sender, EventArgs e)
        {

            using (StringWriter sw = new StringWriter())
            {
                using (HtmlTextWriter hw = new HtmlTextWriter(sw))
                {
                    this.pnprint.RenderControl(hw);
                    // this.Page.RenderControl(hw);
                    StringReader sr = new StringReader(sw.ToString());
                    Document pdfDoc = new Document(PageSize.A4, 10f, 10f, 10f, 10f);
                    PdfWriter writer = PdfWriter.GetInstance(pdfDoc, Response.OutputStream);
                    pdfDoc.Open();
                    XMLWorkerHelper.GetInstance().ParseXHtml(writer, pdfDoc, sr);
                    pdfDoc.Close();
                    Response.ContentType = "application/pdf";
                    Response.AddHeader("content-disposition", "attachment;filename=resume.pdf");
                    Response.Cache.SetCacheability(HttpCacheability.NoCache);
                    Response.Write(pdfDoc);
                    Response.End();
                }
            }
        }
    }
}