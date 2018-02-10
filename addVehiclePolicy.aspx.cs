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

    public partial class addVehiclePolicy : System.Web.UI.Page
    {
        String br_polisa;
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
            //0-vozilo, 1-imot

            createNewVehiclePolicy();
            

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

             

            SqlCommand cmd1 = new SqlCommand();
            cmd1.CommandType = System.Data.CommandType.Text;
            cmd1.CommandText =
                "INSERT vozila (seriski_br, registracija, sopstvenik, godina, br_vrati, model, proizvoditel)" +
                 "VALUES (@seriski_br, @registracija, @sopstvenik, @godina, @br_vrati, @model, @proizvoditel)";
            cmd1.Parameters.AddWithValue("@seriski_br",SerialN.Text);
            var godina = DropDownListYear.SelectedValue;
            var vrati = DropDownList1.SelectedValue;
            if (godina == "year") cmd1.Parameters.AddWithValue("@godina", DBNull.Value );
                else cmd1.Parameters.AddWithValue("@godina", godina);
            if (vrati== "nDoors") cmd1.Parameters.AddWithValue("@br_vrati", DBNull.Value );
                else cmd1.Parameters.AddWithValue("@br_vrati", vrati);
        
            cmd1.Parameters.AddWithValue("@registracija", Registration.Text);
            cmd1.Parameters.AddWithValue("@sopstvenik", UserID);
            cmd1.Parameters.AddWithValue("@model", Model.Text);
            cmd1.Parameters.AddWithValue("@proizvoditel", proizvoditel.Text);
            cmd1.Connection = sqlConnection;


            SqlCommand getVehicleId = new SqlCommand();
            getVehicleId.CommandType  = System.Data.CommandType.Text;
            getVehicleId.CommandText = "SELECT max(br_polisa) br FROM polisi";
            getVehicleId.Connection = sqlConnection;

            SqlCommand cmd2 = new SqlCommand();
            cmd2.CommandType = System.Data.CommandType.Text;
            cmd2.CommandText = "INSERT osiguruvanje_vozilo (br_polisa, seriski_br) VALUES (@br_polisa, @seriski_br)";
            cmd2.Parameters.AddWithValue("@seriski_br", SerialN.Text);
            cmd2.Connection = sqlConnection;
            br_polisa = "";
            
            sqlConnection.Open();

            SqlDataReader reader = getVehicleId.ExecuteReader();
            if (reader.Read())
            {
                br_polisa = reader["br"].ToString();
            }
            cmd2.Parameters.AddWithValue("@br_polisa", br_polisa);
            reader.Close();

            try
            {
                cmd.ExecuteNonQuery();
                cmd1.ExecuteNonQuery();
                cmd2.ExecuteNonQuery();
            }
            catch (Exception e)
            {}

            sqlConnection.Close();

            policyAdded();
           

        }

        private void policyAdded()
        {

            price.Text = 

           // result.Text = "Успешно додадена полиса";
            SerialN.Text = "";
            Registration.Text = "";
            proizvoditel.Text = "";
            Model.Text = "";
            DropDownListYear.SelectedIndex = 0;
            DropDownList1.SelectedIndex = 0;

            typePolicy.Visible = false;
            complete.Visible = true;
            showMessage.Text = "Успешно додадена полиса";
            showMessage.Style.Add("font-size", "20pt");
            showMessage.Style.Add("font-weight", "bold");
        }

        protected void Property_Click(object sender, EventArgs e)
        {
            Response.Redirect("/addPropertyPolicy.aspx");
        }

        protected void pay_Click(object sender, EventArgs e)
        {

        }
    }
}