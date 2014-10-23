using Microsoft.Owin;
using Owin;

[assembly: OwinStartupAttribute(typeof(WijmoMvcApplication1.Startup))]
namespace WijmoMvcApplication1
{
    public partial class Startup
    {
        public void Configuration(IAppBuilder app)
        {
            ConfigureAuth(app);
        }
    }
}
