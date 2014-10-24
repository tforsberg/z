using Microsoft.Owin;
using Owin;

[assembly: OwinStartupAttribute(typeof(ASP.NET_MVC5_with_Bootstrap_3._1._1_LESS1.Startup))]
namespace ASP.NET_MVC5_with_Bootstrap_3._1._1_LESS1
{
    public partial class Startup
    {
        public void Configuration(IAppBuilder app)
        {
            ConfigureAuth(app);
        }
    }
}
