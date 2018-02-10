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
  

    public partial class addPropertyPolicy : System.Web.UI.Page
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
        protected void Vehicle_Click(object sender, EventArgs e)
        {
            Response.Redirect("/addVehiclePolicy");
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


        protected void RadioButtonListType_SelectedIndexChanged(object sender, EventArgs e)
        {
            
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            createNewPropertyPolicy();
        }

        private void createNewPropertyPolicy()
        {
            SqlConnection sqlConnection = new SqlConnection();
            sqlConnection.ConnectionString = ConfigurationManager.ConnectionStrings["DefaultConnection"].ConnectionString;

            SqlCommand cmd = new System.Data.SqlClient.SqlCommand();
            cmd.CommandType = System.Data.CommandType.Text;
            cmd.CommandText = "INSERT Polisi (baratel, datum_izdavanje , tip_polisa) OUTPUT INSERTED.br_polisa VALUES (@userId, @date, 1)";
            cmd.Connection = sqlConnection;
            cmd.Parameters.AddWithValue("@userId", UserID);
            DateTime now = DateTime.Now.Date;
            String date = now.ToString();
            cmd.Parameters.AddWithValue("@date", date); //insert polisa

            String ulica = Street.Text;
            String broj = Number.Text;
            String kod = Code.Text;
            String grad = City.Text;

            //get lokacija_id if the location already exists in Db, 
            //else create a new entry for this location and get the location_id 
            String lokacija_id = "";
            SqlCommand checkLocation = new SqlCommand();
            checkLocation.CommandType= System.Data.CommandType.Text;
            checkLocation.Connection = sqlConnection;
            checkLocation.CommandText =
            "SELECT lokacija_id FROM lokacii WHERE ulica=@ulica AND broj=@broj AND kod=@kod AND grad=@grad";
            checkLocation.Parameters.AddWithValue("@ulica", ulica);
            checkLocation.Parameters.AddWithValue("@broj", broj);
            checkLocation.Parameters.AddWithValue("@kod", kod);
            checkLocation.Parameters.AddWithValue("@grad", grad);
            try
            {
                sqlConnection.Open();

                SqlDataReader reader = checkLocation.ExecuteReader();
                if (reader.Read())
                {
                    lokacija_id = reader["lokacija_id"].ToString();
                }
                reader.Close();
                if (lokacija_id == "")
                {
                    SqlCommand insertLokacija = new SqlCommand();
                    insertLokacija.CommandType = System.Data.CommandType.Text;
                    insertLokacija.Connection = sqlConnection;
                    insertLokacija.CommandText = "INSERT lokacii (ulica,broj,kod,grad) OUTPUT INSERTED.lokacija_id VALUES (@ulica,@broj,@kod,@grad)";
                    insertLokacija.Parameters.AddWithValue("@ulica", ulica);
                    insertLokacija.Parameters.AddWithValue("@broj", broj);
                    insertLokacija.Parameters.AddWithValue("@kod", kod);
                    insertLokacija.Parameters.AddWithValue("@grad", grad);

                    lokacija_id = (insertLokacija.ExecuteScalar()).ToString();
                   
                }


            }
            catch (Exception e) { result.Text = e.ToString(); } finally { sqlConnection.Close(); }

            bool tipImot = false; //0-stan 1-kukja
            if (RadioButtonListType.SelectedItem.Value == "house") tipImot = true;

  
            SqlCommand insertImot = new SqlCommand();
            insertImot.CommandType = System.Data.CommandType.Text;
            insertImot.CommandText = "INSERT imoti (sopstvenik, vrednost, povrshina, lokacija,tip_imot) OUTPUT INSERTED.imot_id VALUES (@userId, @vrednost, @povrshina, @lokacija, @tip_imot)";
            insertImot.Parameters.AddWithValue("@userId", UserID);
            insertImot.Parameters.AddWithValue("@vrednost", Value.Text);
            insertImot.Parameters.AddWithValue("@povrshina", Area.Text);
            insertImot.Parameters.AddWithValue("@lokacija", lokacija_id);
            insertImot.Parameters.AddWithValue("@tip_imot", tipImot);
            insertImot.Connection = sqlConnection;

            String polisa_id = "";
            String imot_id = "";

            SqlCommand insertKukjaStan = new SqlCommand();
            insertKukjaStan.CommandType = System.Data.CommandType.Text;
            insertKukjaStan.Connection = sqlConnection;
            if (!tipImot) { //stan
                insertKukjaStan.CommandText = "INSERT stanovi (imot_id,vlez,sprat,br_stan) VALUES (@imot_id,@vlez,@sprat,@br_stan)";
                insertKukjaStan.Parameters.AddWithValue("@vlez", vlez.Text);
                insertKukjaStan.Parameters.AddWithValue("@sprat", sprat.Text);
                insertKukjaStan.Parameters.AddWithValue("@br_stan", stan.Text);
            }
            else //kukja
            {
                insertKukjaStan.CommandText = "INSERT kukji (imot_id,br_spratovi) VALUES (@imot_id,@br_spratovi)";
                insertKukjaStan.Parameters.AddWithValue("@br_spratovi", brSpratovi.Text);
            }

            SqlCommand insertOsiguruvanje = new SqlCommand();
            insertOsiguruvanje.CommandType = System.Data.CommandType.Text;
            insertOsiguruvanje.Connection = sqlConnection;
            insertOsiguruvanje.CommandText = "INSERT osiguruvanje_imot (br_polisa,imot_id) VALUES (@br_polisa,@imot_id)";

            try
            {
                sqlConnection.Open();
                polisa_id = (cmd.ExecuteScalar()).ToString();
                imot_id = (insertImot.ExecuteScalar()).ToString();

                insertKukjaStan.Parameters.AddWithValue("@imot_id", imot_id);
                insertKukjaStan.ExecuteNonQuery();

                insertOsiguruvanje.Parameters.AddWithValue("@br_polisa", polisa_id);
                insertOsiguruvanje.Parameters.AddWithValue("@imot_id", imot_id);
                insertOsiguruvanje.ExecuteNonQuery();

                result.Text = "Успешно додадена полиса";
                City.Text = "";
                Street.Text = "";
                Number.Text = "";
                Code.Text = "";
                Area.Text = "";
                Value.Text = "";
                brSpratovi.Text = "";
                vlez.Text = "";
                stan.Text = "";
                sprat.Text = "";

            }
            catch (Exception e) { result.Text = e.ToString(); } finally { sqlConnection.Close(); }

        }
    }
}