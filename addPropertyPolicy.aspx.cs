using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace InsuranceCompanyWebApp
{
  
    public partial class addPropertyPolicy : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        protected void Vehicle_Click(object sender, EventArgs e)
        {
            Response.Redirect("/addVehiclePolicy");
        }
    }
}