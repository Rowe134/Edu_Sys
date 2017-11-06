using Microsoft.Owin;
using Owin;

[assembly: OwinStartupAttribute(typeof(Education_SYS.Startup))]
namespace Education_SYS
{
    public partial class Startup {
        public void Configuration(IAppBuilder app) {
            ConfigureAuth(app);
        }
    }
}
