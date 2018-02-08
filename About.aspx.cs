using Microsoft.AspNet.Identity;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace InsuranceCompanyWebApp
{
    public partial class About : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            SqlConnection connection = new SqlConnection();
            connection.ConnectionString = ConfigurationManager.ConnectionStrings["DefaultConnection"].ConnectionString;

            //get id of currently logged in user
            String UserID = "";
            if (this.User != null && this.User.Identity.IsAuthenticated)
            {
                UserID = HttpContext.Current.User.Identity.GetUserId();
            }

            string sqlString = "SELECT * FROM polisi WHERE baratel = @user_id";
            SqlCommand command = new SqlCommand(sqlString, connection);
            command.Parameters.AddWithValue("@user_id", UserID);
            SqlDataAdapter adapter = new SqlDataAdapter(command);
            DataSet ds = new DataSet();

            try
            {
                connection.Open();
                adapter.Fill(ds, "Polisa");
                GridView1.DataSource = ds;
                GridView1.DataBind();

            }
            catch (Exception er) { Label1.Text = er.ToString(); }
            finally {
                connection.Close();
            }
        }
    }
}