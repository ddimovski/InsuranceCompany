using Microsoft.AspNet.Identity;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace InsuranceCompanyWebApp
{
    public partial class myVehicles : System.Web.UI.Page
    {
        private String UserID;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (this.User != null && this.User.Identity.IsAuthenticated)
            {
                UserID = HttpContext.Current.User.Identity.GetUserId();
            }

            fillVehicles();
        }

        private void fillVehicles()
        {
            SqlConnection connection2 = new SqlConnection();
            connection2.ConnectionString = ConfigurationManager.ConnectionStrings["defaultconnection"].ConnectionString;

            SqlCommand command = new SqlCommand();
            string sqlStringVozila = "SELECT seriski_br, registracija, godina, br_vrati, proizvoditel, model FROM vozila WHERE sopstvenik=@user_id";
            command.Connection = connection2;
            command.CommandText = sqlStringVozila;
            command.Parameters.AddWithValue("@user_id", UserID);

            SqlDataAdapter adapter = new SqlDataAdapter(command);
            DataSet ds = new DataSet();

            try
            {
                connection2.Open();

                adapter.Fill(ds, "vozila");
                gvVozila.DataSource = ds;
                gvVozila.DataBind();
            }
            catch (Exception e) { }
            finally { connection2.Close(); }
        }

    }
}