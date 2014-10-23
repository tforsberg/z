using System;
using System.Collections.Generic;
using System.Text;
using System.Web.UI;

namespace ToolkitExplorer
{
    public class PageStateAdapter : System.Web.UI.Adapters.PageAdapter
    {
        public override PageStatePersister GetStatePersister()
        {
            return new SessionPageStatePersister(this.Page);
        }
    }
}