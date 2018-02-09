using Microsoft.AspNet.Identity;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace InsuranceCompanyWebApp
{
    public partial class addNewPolicy : System.Web.UI.Page
    {
        String UserID = "";
        String ime;
        String prezime;
        String embg;
        protected void Page_Load(object sender, EventArgs e)
        {
            ime = prezime = embg = "";
            getUserData();
            initUI();
            
        }

        private void getUserData()
        {
            SqlConnection connection = new SqlConnection();
            connection.ConnectionString = ConfigurationManager.ConnectionStrings["DefaultConnection"].ConnectionString;

            //get id of currently logged in user
           
            if (this.User != null && this.User.Identity.IsAuthenticated)
            {
                UserID = HttpContext.Current.User.Identity.GetUserId();
            }

            string sqlString = "SELECT * FROM AspNetUsers WHERE Id = @user_id";
            SqlCommand command = new SqlCommand(sqlString, connection);
            command.Parameters.AddWithValue("@user_id", UserID);

            try
            {
                connection.Open();
                SqlDataReader reader = command.ExecuteReader();
                if (reader.Read())
                {
                    ime = reader["FirstName"].ToString();
                    prezime = reader["LastName"].ToString();
                    embg = reader["EMBG"].ToString();
                }


            }
            catch (Exception er) { }
            finally
            {
                connection.Close();
            }

        }

        private void initUI()
        {
            lblEMBG.Text = embg;
            lblLastName.Text = prezime;
            lblName.Text = ime;
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            bool typeOfPolicy; //0-vozilo 1-imot
            String  type = vehicle.SelectedValue;
            createNewVehiclePolicy();
            //if (type == "vehicle") typeOfPolicy = false;
            //else typeOfPolicy = true;

            //if (!typeOfPolicy) createNewVehiclePolicy();
            //else createNewPropertyPolicy();

        }

        private void createNewVehiclePolicy()
        {
            SqlConnection sqlConnection = new SqlConnection();
            sqlConnection.ConnectionString = ConfigurationManager.ConnectionStrings["DefaultConnection"].ConnectionString;

            SqlCommand cmd = new System.Data.SqlClient.SqlCommand();
            cmd.CommandType = System.Data.CommandType.Text;
            cmd.CommandText = "INSERT Polisi (baratel, datum_izdavanje , tip_polisa) VALUES (@userId, @date, 0)";
            cmd.Connection = sqlConnection;

            cmd.Parameters.AddWithValue("@userId", UserID);
            
            DateTime now = DateTime.Now.Date;
            String date = now.ToString();

            cmd.Parameters.AddWithValue("@date", date);

           
                sqlConnection.Open();

                cmd.ExecuteNonQuery();
           
                sqlConnection.Close();
            
        }

        private void createNewPropertyPolicy()
        {
            throw new NotImplementedException();
        }
    }
}