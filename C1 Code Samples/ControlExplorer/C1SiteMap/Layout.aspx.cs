using C1.Web.Wijmo.Controls.C1SiteMap;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ControlExplorer.C1SiteMap
{
    public partial class Layout : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                ApplySettings();
            }
        }

        protected void C1SiteMap1_NodeDataBound(object sender, C1.Web.Wijmo.Controls.C1SiteMap.C1SiteMapNodeEventArgs e)
        {
            e.Node.NavigateUrl = "#";
        }

        protected void btnApply_Click(object sender, EventArgs e)
        {
            ApplySettings();

            this.UpdatePanel1.Update();
        }

        private void ApplySettings()
        {
            this.C1SiteMap1.LevelSettings.Clear();

            //for level 1, the second level
            C1SiteMapLevelSetting settingLevel1 = new C1SiteMapLevelSetting();
            settingLevel1.Level = 1;
            settingLevel1.Layout = (SiteMapLayoutType)Enum.Parse(typeof(SiteMapLayoutType), cbxLevel1Layout.SelectedValue, true);

            settingLevel1.ListLayout.RepeatColumns = (int)numberLevel1ColumnCount.Value;
            settingLevel1.SeparatorText = tbxLevel1SeparatorText.Text;
            settingLevel1.MaxNodes = (int)numberLevel1MaxNode.Value;

            //for level 2, the third level
            C1SiteMapLevelSetting settingLevel2 = new C1SiteMapLevelSetting();
            settingLevel2.Level = 2;
            settingLevel2.Layout = (SiteMapLayoutType)Enum.Parse(typeof(SiteMapLayoutType), cbxLevel2Layout.SelectedValue, true);

            settingLevel2.ListLayout.RepeatColumns = (int)numberLevel2ColumnCount.Value;
            settingLevel2.MaxNodes = (int)numberLevel2MaxNode.Value;
            settingLevel2.SeparatorText = tbxLevel2SeparatorText.Text;
            
            this.C1SiteMap1.LevelSettings.Add(settingLevel1);
            this.C1SiteMap1.LevelSettings.Add(settingLevel2);
        }

        protected void cbxLevel1Layout_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (cbxLevel1Layout.SelectedIndex == 0)
            {
                tbxLevel1SeparatorText.Enabled = false;
                numberLevel1ColumnCount.Enabled = true;
            }
            else
            {
                tbxLevel1SeparatorText.Enabled = true;
                numberLevel1ColumnCount.Enabled = false;
            }
        }

        protected void cbxLevel2Layout_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (cbxLevel2Layout.SelectedIndex == 0)
            {
                tbxLevel2SeparatorText.Enabled = false;
                numberLevel2ColumnCount.Enabled = true;
            }
            else
            {
                tbxLevel2SeparatorText.Enabled = true;
                numberLevel2ColumnCount.Enabled = false;
            }

        }
    }
}