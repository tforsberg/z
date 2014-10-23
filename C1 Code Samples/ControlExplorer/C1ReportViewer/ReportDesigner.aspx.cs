using C1.C1Report;
using C1.Web.Wijmo.Controls.C1ComboBox;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ControlExplorer.C1ReportViewer
{
    public partial class ReportDesigner : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                ApplyComboboxItems();
            }
        }

        protected void cbbFile_SelectedIndexChanged(object sender, EventArgs args)
        {
            ApplyComboboxItems();
            update1.Update();
            update2.Update();
        }

        private void ApplyComboboxItems()
        {
            cbbDefinition.Items.Clear();
            var fileName = cbbFile.SelectedValue;
            fileName = MapPath(fileName);
            var reports = C1Report.GetReportList(fileName);
            foreach (string name in reports)
            {
                var item = new ListItem(name, name);
                cbbDefinition.Items.Add(item);
            }
            cbbDefinition.SelectedIndex = 0;
            C1ReportViewer1.FileName = cbbFile.SelectedValue;
            C1ReportViewer1.ReportName = cbbDefinition.SelectedValue;
        }

        protected void cbbDefinition_SelectedIndexChanged(object sender, EventArgs args)
        {
            var fileName = cbbFile.SelectedValue;
            var reportName = cbbDefinition.SelectedValue;
            C1ReportViewer1.FileName = fileName;
            C1ReportViewer1.ReportName = reportName;
            update1.Update();
        }
    }
}