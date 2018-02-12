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
    public partial class myProperty : System.Web.UI.Page
    {
        private String UserID;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (this.User != null && this.User.Identity.IsAuthenticated)
            {
                UserID = HttpContext.Current.User.Identity.GetUserId();
            }

            fillKukji();
            fillStanovi();
        }

        private void fillKukji()
        {
            SqlConnection connection2 = new SqlConnection();
            connection2.ConnectionString = ConfigurationManager.ConnectionStrings["defaultconnection"].ConnectionString;

            SqlCommand command = new SqlCommand();
            string sqlStringKukja = "SELECT ulica Улица, broj Броj, kod Код, grad Град, vrednost Вредност, povrshina Површина, br_spratovi 'Број на спратови' FROM imoti, lokacii, kukji WHERE imoti.lokacija=lokacii.lokacija_id AND sopstvenik=@user_id AND tip_imot=1 AND imoti.imot_id=kukji.imot_id";

            command.Connection = connection2;
            command.CommandText = sqlStringKukja;
            command.Parameters.AddWithValue("@user_id", UserID);

            SqlDataAdapter adapter = new SqlDataAdapter(command);
            DataSet ds = new DataSet();

            try
            {
                connection2.Open();

                adapter.Fill(ds, "kukji");
                gvKukji.DataSource = ds;
                gvKukji.DataBind();
            } catch (Exception e) { } finally { connection2.Close(); }
        }

        private void fillStanovi()
        {
            SqlConnection connection2 = new SqlConnection();
            connection2.ConnectionString = ConfigurationManager.ConnectionStrings["defaultconnection"].ConnectionString;

            SqlCommand command = new SqlCommand();
            string sqlStringStanovi = "SELECT ulica Улица, broj Броj, kod Код, grad Град, vrednost Вредност, povrshina Површина, vlez Влез, sprat Спрат, br_stan Стан FROM imoti, lokacii, stanovi WHERE imoti.lokacija=lokacii.lokacija_id AND sopstvenik=@user_id AND tip_imot=0 AND imoti.imot_id=stanovi.imot_id";

            command.Connection = connection2;
            command.CommandText = sqlStringStanovi;
            command.Parameters.AddWithValue("@user_id", UserID);

            SqlDataAdapter adapter = new SqlDataAdapter(command);
            DataSet ds = new DataSet();

            try
            {
                connection2.Open();

                adapter.Fill(ds, "stanovi");
                gvStanovi.DataSource = ds;
                gvStanovi.DataBind();
            }
            catch (Exception e) { }
            finally { connection2.Close(); }
        }

        protected void GridView2_RowDataBound(object sender, GridViewRowEventArgs e)
        {

        }
    }
}