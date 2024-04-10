using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace JobSeekerPortal.Admin
{
    public partial class GenerateReports : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btngen_Click(object sender, EventArgs e)
        {
            int g = Convert.ToInt32(ddlgen.SelectedValue.ToString());

            if (g == 0)
            {
                Response.Redirect("~/Admin/Report_ViewHRs.aspx");
            }
            else if(g == 1)
            {
                Response.Redirect("~/Admin/Report_ViewEmployees.aspx");
            }
            else if (g == 2)
            {
                Response.Redirect("~/Admin/Report_ViewAppliedEmployees.aspx");
            }
        }
    }
}