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
    public partial class moiTransakcii : System.Web.UI.Page
    {
        private String UserID;
        protected void Page_Load(object sender, EventArgs e)
        {

            if (this.User != null && this.User.Identity.IsAuthenticated)
            {
                UserID = HttpContext.Current.User.Identity.GetUserId();
            }

            fillTransactions();
        }

        private void fillTransactions()
        {
            SqlConnection connection2 = new SqlConnection();
            connection2.ConnectionString = ConfigurationManager.ConnectionStrings["defaultconnection"].ConnectionString;

            SqlCommand command = new SqlCommand();
            string sqlStringTransakcii = "SELECT br_uplata 'Број на уплата', br_polisa 'Број на полиса', iznos 'Износ', datum 'Датум на уплата' FROM transakcii WHERE klient_id = @user_id";
            command.Connection = connection2;
            command.CommandText = sqlStringTransakcii;
            command.Parameters.AddWithValue("@user_id", UserID);

            SqlCommand command1 = new SqlCommand();
            string vk = "SELECT SUM(iznos) vkupno FROM transakcii WHERE klient_id = @user_id";
            command1.Connection = connection2;
            command1.CommandText = vk;
            command1.Parameters.AddWithValue("@user_id", UserID);

            SqlDataAdapter adapter = new SqlDataAdapter(command);
            DataSet ds = new DataSet();

            try
            {
                connection2.Open();

                adapter.Fill(ds, "transakcii");
                gvTransakcii.DataSource = ds;
                gvTransakcii.DataBind();

                SqlDataReader reader = command1.ExecuteReader();
                if (reader.Read()) {
                    vkupno.Text = reader["vkupno"].ToString() + " денари";
                }

            }
            catch (Exception e) { vkupno.Text = e.ToString(); }
            finally { connection2.Close(); }
        }

        protected void gvTransakcii_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            String d = e.Row.Cells[3].Text.ToString();
            String[] sub = d.Split(' ');
            if (d != "Датум на издавање")
                e.Row.Cells[3].Text = sub[0];
        }
    }
}