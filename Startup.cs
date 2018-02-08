using Microsoft.Owin;
using Owin;

[assembly: OwinStartupAttribute(typeof(InsuranceCompanyWebApp.Startup))]
namespace InsuranceCompanyWebApp
{
    public partial class Startup {
        public void Configuration(IAppBuilder app) {
            ConfigureAuth(app);
        }
    }
}
