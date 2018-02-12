using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using System.Web;
using Microsoft.AspNet.Identity;
using Microsoft.AspNet.Identity.EntityFramework;
using Microsoft.AspNet.Identity.Owin;
using Microsoft.Owin.Security;
using Owin;
using InsuranceCompanyWebApp.Models;
using System.Data.SqlClient;
using System.Configuration;
using System.Web.UI.WebControls;
using System.Web.UI;

namespace InsuranceCompanyWebApp.Account
{
    public partial class Manage : System.Web.UI.Page
    {
        protected string SuccessMessage
        {
            get;
            private set;
        }

        private bool HasPassword(ApplicationUserManager manager)
        {
            return manager.HasPassword(User.Identity.GetUserId());
        }

        public bool HasPhoneNumber { get; private set; }

        public bool TwoFactorEnabled { get; private set; }

        public bool TwoFactorBrowserRemembered { get; private set; }

        public int LoginsCount { get; set; }

        String UserID;

        protected void Page_Load()
        {


            if (this.User != null && this.User.Identity.IsAuthenticated)
            {
                UserID = HttpContext.Current.User.Identity.GetUserId();
            }



            loadAccountDetails();


            var manager = Context.GetOwinContext().GetUserManager<ApplicationUserManager>();

            HasPhoneNumber = String.IsNullOrEmpty(manager.GetPhoneNumber(User.Identity.GetUserId()));

            // Enable this after setting up two-factor authentientication
            //PhoneNumber.Text = manager.GetPhoneNumber(User.Identity.GetUserId()) ?? String.Empty;

            TwoFactorEnabled = manager.GetTwoFactorEnabled(User.Identity.GetUserId());

            LoginsCount = manager.GetLogins(User.Identity.GetUserId()).Count;

            var authenticationManager = HttpContext.Current.GetOwinContext().Authentication;

            if (!IsPostBack)
            {
                // Determine the sections to render
                if (HasPassword(manager))
                {
                   
                }
                else
                {
                    
                }

                // Render success message
                var message = Request.QueryString["m"];
                if (message != null)
                {
                    // Strip the query string from action
                    Form.Action = ResolveUrl("~/Account/Manage");

                    SuccessMessage =
                        message == "ChangePwdSuccess" ? "Your password has been changed."
                        : message == "SetPwdSuccess" ? "Your password has been set."
                        : message == "RemoveLoginSuccess" ? "The account was removed."
                        : message == "AddPhoneNumberSuccess" ? "Phone number has been added"
                        : message == "RemovePhoneNumberSuccess" ? "Phone number was removed"
                        : String.Empty;
                 // successMessage.Visible = !String.IsNullOrEmpty(SuccessMessage);
                }

                

            }
        }

        private void loadAccountDetails()
        {
          
            SqlConnection connection = new SqlConnection();
            connection.ConnectionString = ConfigurationManager.ConnectionStrings["DefaultConnection"].ConnectionString;


            string sqlString = "SELECT * FROM AspNetUsers WHERE Id = @user_id";
            SqlCommand command = new SqlCommand(sqlString, connection);
            command.Parameters.AddWithValue("@user_id", UserID);

            string sqlString1 = "SELECT * FROM telefoni WHERE sopstvenik = @user_id";
            SqlCommand command1 = new SqlCommand(sqlString1, connection);
            command1.Parameters.AddWithValue("@user_id", UserID);
            int i = 0;
            try
            {
                connection.Open();
                SqlDataReader reader = command.ExecuteReader();
                if (reader.Read())
                {
                    lblName.Text = reader["FirstName"].ToString();
                    lblLastName.Text = reader["LastName"].ToString();
                    lblEMBG.Text = reader["EMBG"].ToString();
                }
                reader.Close();
                
                reader = command1.ExecuteReader();
                while (reader.Read()) {

                    Label l = new Label();
                    l.Text = reader["telefon"].ToString();
                    if (l.Text != "")
                    {
                        l.Style.Add("padding-left", "15px");
                        panelTelefoni.Controls.Add(l);
                        panelTelefoni.Controls.Add(new LiteralControl("<br />"));
                    }
                    
                }


                reader.Close();
               

            }
            catch (Exception er) { }
            finally
            {
                connection.Close();
            }

                  

         

        }


        protected void buttonTel_Click(Object sender, EventArgs e) {
            SqlConnection cn = new SqlConnection();
            cn.ConnectionString = ConfigurationManager.ConnectionStrings["DefaultConnection"].ConnectionString;


            string insBr = "INSERT telefoni (sopstvenik, telefon) VALUES (@user_id, @telefon)";
            SqlCommand cmd = new SqlCommand(insBr, cn);
            cmd.Parameters.AddWithValue("@user_id", UserID);
            cmd.Parameters.AddWithValue("@telefon", tbTelefoni.Text);

            try
            {
                cn.Open();
                cmd.ExecuteNonQuery();
            }
            catch (Exception er) {  }
            finally { cn.Close(); }
            tbTelefoni.Text = "";
            Response.Redirect(Request.RawUrl);
        }

    

    private void AddErrors(IdentityResult result)
        {
            foreach (var error in result.Errors)
            {
                ModelState.AddModelError("", error);
            }
        }

        // Remove phonenumber from user
        protected void RemovePhone_Click(object sender, EventArgs e)
        {
            var manager = Context.GetOwinContext().GetUserManager<ApplicationUserManager>();
            var signInManager = Context.GetOwinContext().Get<ApplicationSignInManager>();
            var result = manager.SetPhoneNumber(User.Identity.GetUserId(), null);
            if (!result.Succeeded)
            {
                return;
            }
            var user = manager.FindById(User.Identity.GetUserId());
            if (user != null)
            {
                signInManager.SignIn(user, isPersistent: false, rememberBrowser: false);
                Response.Redirect("/Account/Manage?m=RemovePhoneNumberSuccess");
            }
        }

        // DisableTwoFactorAuthentication
        protected void TwoFactorDisable_Click(object sender, EventArgs e)
        {
            var manager = Context.GetOwinContext().GetUserManager<ApplicationUserManager>();
            manager.SetTwoFactorEnabled(User.Identity.GetUserId(), false);

            Response.Redirect("/Account/Manage");
        }

        //EnableTwoFactorAuthentication 
        protected void TwoFactorEnable_Click(object sender, EventArgs e)
        {
            var manager = Context.GetOwinContext().GetUserManager<ApplicationUserManager>();
            manager.SetTwoFactorEnabled(User.Identity.GetUserId(), true);

            Response.Redirect("/Account/Manage");
        }
    }
}