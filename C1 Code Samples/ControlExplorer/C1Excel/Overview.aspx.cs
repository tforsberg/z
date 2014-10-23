﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using C1.C1Excel;
using System.Drawing;
using System.Data;
using System.Diagnostics;
using System.Data.OleDb;
using System.Collections;
using System.IO;
namespace ControlExplorer.C1Excel
{
    public partial class CreatingWorkSheets : System.Web.UI.Page
    {
       
        //Excel styles
        XLStyle _styTitle;
        XLStyle _styHeader;
        XLStyle _styMoney;
        XLStyle _styOrder;
        C1XLBook _c1xl = new C1.C1Excel.C1XLBook();

        private Hashtable tempFiles = null;
        protected static string TEMP_DIR;


        protected void Page_Load(object sender, EventArgs e)
        {
            TEMP_DIR = Server.MapPath("~") + "\\Temp";
            if (Directory.Exists(TEMP_DIR))
            {

            }
            else
            {
                Directory.CreateDirectory(TEMP_DIR);

            }
        }

        private string CreateExcelFile()
        {
            //clear Excel book, remove the single blank sheet
            _c1xl.Clear();
            _c1xl.Sheets.Clear();
            _c1xl.DefaultFont = new Font("Tahoma", 8);

            //create Excel styles
            _styTitle = new XLStyle(_c1xl);
            _styHeader = new XLStyle(_c1xl);
            _styMoney = new XLStyle(_c1xl);
            _styOrder = new XLStyle(_c1xl);

            //set up styles
            _styTitle.Font = new Font(_c1xl.DefaultFont.Name, 15, FontStyle.Bold);
            _styTitle.ForeColor = Color.Blue;
            _styHeader.Font = new Font(_c1xl.DefaultFont, FontStyle.Bold);
            _styHeader.ForeColor = Color.White;
            _styHeader.BackColor = Color.DarkGray;
            _styMoney.Format = XLStyle.FormatDotNetToXL("c");
            _styOrder.Font = _styHeader.Font;
            _styOrder.ForeColor = Color.Red;

            //create report with one sheet per category
            DataTable dt = GetCategories();
            foreach (DataRow dr in dt.Rows)
            {
                CreateSheet(dr);
            }

            //save xls file
            string uid = System.Guid.NewGuid().ToString();
            string filename = Server.MapPath("~") + "\\Temp\\testexcel" + uid + ".xls"; 
            _c1xl.Save(filename);
            
            return filename;

        }

        private DataTable GetCategories()
        {
            string conn = this.DemoConnectionString;

            //load data into tables
            DataTable dtCategories = new DataTable("Categories");
            DataTable dtProducts = new DataTable("Products");
            OleDbDataAdapter daCat = new OleDbDataAdapter("select * from Categories", conn);
            OleDbDataAdapter daPrd = new OleDbDataAdapter("select * from Products", conn);
            daCat.Fill(dtCategories);
            daPrd.Fill(dtProducts);

            //add calculated columns
            DataColumn col = dtProducts.Columns.Add("ValueInStock", typeof(decimal), "UnitPrice * UnitsInStock");
            col.Caption = "Value In Stock";
            col = dtProducts.Columns.Add("OrderNow", typeof(bool), "UnitsInStock <= ReorderLevel");
            col.Caption = "Order Now";

            //build data set with relation between categories and products
            DataSet ds = new DataSet();
            ds.Tables.Add(dtCategories);
            ds.Tables.Add(dtProducts);
            ds.Relations.Add("Categories_Products", dtCategories.Columns["CategoryID"], dtProducts.Columns["CategoryID"]);

            // return Categories table
            return dtCategories;
        }

        private void CreateSheet(DataRow dr)
        {
            //get current category name
            string catName = (string)dr["CategoryName"];

            //add a new worksheet to the workbook 
            //('/' is invalid in sheet names, so replace it with '+')
            string sheetName = catName.Replace("/", " + ");
            XLSheet sheet = _c1xl.Sheets.Add(sheetName);

            //add title to worksheet
            sheet[0, 0].Value = catName;
            sheet.Rows[0].Style = _styTitle;

            // set column widths (in twips)
            sheet.Columns[0].Width = 300;
            sheet.Columns[1].Width = 2200;
            sheet.Columns[2].Width = 1000;
            sheet.Columns[3].Width = 1600;
            sheet.Columns[4].Width = 1000;
            sheet.Columns[5].Width = 1000;
            sheet.Columns[6].Width = 1000;

            //add column headers
            int row = 2;
            sheet.Rows[row].Style = _styHeader;
            sheet[row, 1].Value = "Product Name";
            sheet[row, 2].Value = "Unit Price";
            sheet[row, 3].Value = "Qty/Unit";
            sheet[row, 4].Value = "Stock Units";
            sheet[row, 5].Value = "Stock Value";
            sheet[row, 6].Value = "Reorder";

            //loop through products in this category
            DataRow[] products = dr.GetChildRows("Categories_Products");
            foreach (DataRow product in products)
            {
                //move on to next row
                row++;

                //add row with some data
                sheet[row, 1].Value = product["ProductName"];
                sheet[row, 2].Value = product["UnitPrice"];
                sheet[row, 3].Value = product["QuantityPerUnit"];
                sheet[row, 4].Value = product["UnitsInStock"];

                //calculate value in stock
                double valueInStock =
                                     Convert.ToDouble(product["UnitPrice"]) *
                                     Convert.ToInt32(product["UnitsInStock"]);
                sheet[row, 5].Value = valueInStock;

                //check reorder level
                if (Convert.ToInt32(product["UnitsInStock"]) <=
                      Convert.ToInt32(product["ReorderLevel"]))
                {
                    sheet[row, 6].Value = "<<<";
                    sheet[row, 6].Style = _styOrder;
                }

                //format money cells
                sheet[row, 2].Style = _styMoney;
                sheet[row, 5].Style = _styMoney;
            }
            if (products.Length == 0)
            {
                row++;
                sheet[row, 1].Value = "No products in this category";
            }
        }

        protected void btnexcel_Click(object sender, EventArgs e)
        {
            string filename = CreateExcelFile();
            try
            {

                Response.Clear();
                Response.Charset = "UTF-8";
                Response.ContentEncoding = System.Text.Encoding.UTF8;
                Response.AddHeader("Content-Disposition", "attachment; filename=" + filename);
                 Response.ContentType = "application/ms-excel";
                Response.TransmitFile(filename);
                Response.Flush();
                File.Delete(filename);
                Response.End(); 
            }
            catch
            {
               Response.Write("Unable to load file from temp directory: " + filename);
            }
        }

      
        public string DemoConnectionString
        {
            get
            {
                return "Provider=Microsoft.Jet.OLEDB.4.0;Data Source=|DataDirectory|C1NWind.mdb;Persist Security Info=False";
            }
        }

    }
}