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
    public partial class Transactions : System.Web.UI.Page
    {
        String polisa_id;
        int vrednost1;
        String UserID;
        SqlConnection connection = new SqlConnection();
       
        protected void Page_Load(object sender, EventArgs e)
        {

            connection.ConnectionString = ConfigurationManager.ConnectionStrings["DefaultConnection"].ConnectionString;

            if (this.User != null && this.User.Identity.IsAuthenticated)
            {
                UserID = HttpContext.Current.User.Identity.GetUserId();
            }

            if (Session["polisa_id"] != null)
            {
                polisa_id = Session["polisa_id"].ToString();
                getDataFromDb();
                getTransactionHistory();
            }
            //polisa_id = 12411;
           
            
        }

        private void getTransactionHistory()
        {
       
            
            lblVkupno.Text = vrednost1.ToString();

            int plateno = 0;

            SqlCommand getTransakcija = new SqlCommand();
            getTransakcija.CommandType = System.Data.CommandType.Text;
            getTransakcija.Connection = connection;
            getTransakcija.CommandText = "SELECT SUM(iznos) AS vkupno FROM transakcii WHERE br_polisa = @polisa_id";
            getTransakcija.Parameters.AddWithValue("@polisa_id", polisa_id);

            try
            {
                connection.Open();
                SqlDataReader reader = getTransakcija.ExecuteReader();
                if (reader.Read())
                {
                    plateno = (int)reader["vkupno"];
                }
                reader.Close();
            }
            catch (Exception e) { }
            finally { connection.Close(); }
            if (plateno == 0) {
                lblPlateno.Visible = false;
                Plateno.Visible = false;
            }
            else
            {
                lblPlateno.Visible = true;
                Plateno.Visible = true;
                lblPlateno.Text = plateno.ToString();
            }

            lblZaPlakjanje.Text = (vrednost1 - plateno).ToString();


        }

        private void getDataFromDb()
        {
           
            SqlCommand getPolisa = new SqlCommand();
            getPolisa.CommandType = System.Data.CommandType.Text;
            getPolisa.Connection = connection;
            getPolisa.CommandText = "SELECT * FROM polisi WHERE br_polisa = @polisa_id";
            getPolisa.Parameters.AddWithValue("@polisa_id", polisa_id);

            SqlCommand getImot = new SqlCommand();
            getImot.Connection = connection;
            getImot.CommandType = System.Data.CommandType.Text;
            getImot.CommandText = "SELECT * FROM imoti WHERE imot_id = (SELECT imot_id FROM osiguruvanje_imot WHERE br_polisa=@polisa_id)";
            getImot.Parameters.AddWithValue("@polisa_id", polisa_id);
            bool tipPolisa = false;
            bool tipImot = false;

            SqlCommand getLokacija = new SqlCommand();

            getLokacija.Connection = connection;
            getLokacija.CommandType = System.Data.CommandType.Text;
            getLokacija.CommandText = "SELECT * FROM lokacii WHERE lokacija_id = @lokacija_id";

            SqlCommand getKukja = new SqlCommand();
            getKukja.Connection = connection;
            getKukja.CommandType = System.Data.CommandType.Text;
            getKukja.CommandText = "SELECT * FROM kukji WHERE imot_id = @imot_id";

            SqlCommand getStan = new SqlCommand();
            getStan.Connection = connection;
            getStan.CommandType = System.Data.CommandType.Text;
            getStan.CommandText = "SELECT * FROM stanovi WHERE imot_id = @imot_id";
            
            String imot_id ="";

            SqlCommand getVozilo = new SqlCommand();
            getVozilo.Connection = connection;
            getVozilo.CommandType = System.Data.CommandType.Text;
            getVozilo.CommandText = "SELECT * FROM vozila WHERE seriski_br = (SELECT seriski_br FROM osiguruvanje_vozilo WHERE br_polisa = @br_polisa)";
            getVozilo.Parameters.AddWithValue("@br_polisa", polisa_id);

            try
            {
                connection.Open();
                SqlDataReader reader = getPolisa.ExecuteReader();
                if (reader.Read())
                {
                    DateTime date = (DateTime) reader["datum_izdavanje"];


                    lblDatum.Text = date.Day.ToString() + "/" + date.Month.ToString() + "/" + date.Year.ToString();

                    tipPolisa = (bool)reader["tip_polisa"];
                    if (tipPolisa == false)
                    {
                        lbltipPolisa.Text = "Осигурување на возило";
                    }
                    else lbltipPolisa.Text = "Осигурување на имот";
                    
                }
                reader.Close();

                if (tipPolisa)
                {
                    reader = getImot.ExecuteReader();
                    if (reader.Read())
                    {
                        imot_id = reader["imot_id"].ToString();
                        vrednost1=(int) reader["vrednost"]/100;
                        lblVrednost.Text = (vrednost1*100).ToString();
                        tipImot = (bool)reader["tip_imot"];
                        if (tipImot) lblTipImot.Text = "Куќа";
                        else lblTipImot.Text = "Стан";
                        int lokacija_id = (int)reader["lokacija"];
                        getLokacija.Parameters.AddWithValue("@lokacija_id", lokacija_id);
                    }
                    reader.Close();

                    if (tipImot)
                    {
                        getKukja.Parameters.AddWithValue("@imot_id", imot_id);
                        reader = getKukja.ExecuteReader();
                        if (reader.Read())
                        {
                            lblBrSpratovi.Text = reader["br_spratovi"].ToString();
                        }
                        else { brSpratobi.Visible = false; }
                        reader.Close();
                    }
                    else
                    {
                        getStan.Parameters.AddWithValue("@imot_id", imot_id);
                        reader = getStan.ExecuteReader();
                        if (reader.Read())
                        {
                            lblVlez.Text = reader["vlez"].ToString();
                            lblSprat.Text = reader["sprat"].ToString();
                            lblStan.Text = reader["br_stan"].ToString();
                        }
                        reader.Close();
                    }

                    reader = getLokacija.ExecuteReader();
                    if (reader.Read())
                    {
                        String lokacija = "ул. " + reader["ulica"] + " бр. " + reader["broj"] + " " + reader["kod"] + " " + reader["grad"];
                        lblAdresa.Text = lokacija;
                    }
                    reader.Close();
                }

                else
                {
                    reader = getVozilo.ExecuteReader();
                    if (reader.Read())
                    {
                        lblSeriskiBr.Text = reader["seriski_br"].ToString();
                        lblRegistracija.Text = reader["registracija"].ToString();
                        if (reader["proizvoditel"] != null && reader["proizvoditel"].ToString() != "")
                            lblProizvoditel.Text = reader["proizvoditel"].ToString();
                        else {
                            lblProizvoditel.Text = "Нема податоци";
                        }
                        if (reader["model"] != null && reader["model"].ToString()!="")
                        {
                            lblModel.Text = reader["model"].ToString();
                        }
                        else {
                            lblModel.Text = "Нема податоци";
                           
                        }
                        if (!reader["br_vrati"].Equals(DBNull.Value))
                        {
                            lblBrVrati.Text = reader["br_vrati"].ToString();
                        }
                        else {
                            
                            lblBrVrati.Text = "Нема податоци";
                        }
                        lblGodina.Text = reader["godina"].ToString();
                        
                        vrednost1 = (int)reader["godina"] * 3;
                        reader.Close();

                    }
                }
            }
            catch (Exception e) { result.Text = e.ToString(); }
            finally
            {
                connection.Close();
            }
          
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            addNewTransaction();
        }

        private void addNewTransaction()
        {

           

            SqlCommand insertTransakcija = new SqlCommand();
            insertTransakcija.CommandType = System.Data.CommandType.Text;
            insertTransakcija.Connection = connection;
            insertTransakcija.CommandText = "INSERT transakcii (klient_id, br_polisa, br_uplata, iznos, datum) VALUES (@klient_id, @br_polisa, @br_uplata, @iznos, @datum)";
            insertTransakcija.Parameters.AddWithValue("@klient_id", UserID);
            insertTransakcija.Parameters.AddWithValue("@br_polisa", polisa_id);
            insertTransakcija.Parameters.AddWithValue("@br_uplata", kod.Text);
            insertTransakcija.Parameters.AddWithValue("@iznos", Iznos.Text);
            DateTime now = DateTime.Now.Date;
            String date = now.ToString();
            insertTransakcija.Parameters.AddWithValue("@datum", date);

            try
            {
                connection.Open();
                insertTransakcija.ExecuteNonQuery();
                
            } catch (Exception e) { result.Text = e.ToString(); }
            finally
            {
                connection.Close();
            }
            getTransactionHistory();
            Iznos.Text = "";
            kod.Text = "";


        }
    }
}