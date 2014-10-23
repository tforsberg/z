using System;
using System.Collections.Generic;
using System.Drawing;
using System.Windows.Forms;
using taapBrowser2.Controls;
using taapBrowser2.Properties;
using WeifenLuo.WinFormsUI.Docking;

namespace taapBrowser2.Forms
{
	public partial class FrmBrowsers : DockContent
	{
		IntPtr hTabControl;

		private ctrlBrowser browser;
		private delegate void AddFavIconDelegate(TabPage tp);
		public delegate void NewConsoleMessageEventArgs(object sender, string message, int browserNumber);
		public event NewConsoleMessageEventArgs NewMessage;

		public List<string> HistoryList = new List<string>();

		public FrmBrowsers()
		{
			InitializeComponent();
			hTabControl = this.BrowserTabs.Handle;

		}

		private void AddNewTab(string url = "")
		{
			if (string.IsNullOrEmpty(url)) url = Settings.Default.Homepage;



			if (BrowserTabs.TabPages.Count == 0)
			{
				BrowserNewMessage(this, "Creating New Browser ", -1);
				browser = new ctrlBrowser();

				browser.NewTitle += BrowserNewTitle;
				browser.NewUrl += BrowserNewUrl;
				browser.NewFavIcon += BrowserNewFavIcon;
				browser.NewMessage += BrowserNewMessage;

				browser.Dock = DockStyle.Fill;

				BrowserNewMessage(this, "Creating New Tab ", -1);
				TabPage tp = new TabPage();
				browser.Tag = tp;
				tp.Controls.Add(browser);
				BrowserTabs.Controls.Add(tp);
				tp.Text = "Loading...";
				tp.Tag = browser;
				tp.ImageIndex = 1;

				BrowserNewMessage(this, "Tab Index = " + browser.GetBrowserIndex().ToString(), -1);
				browser.Navigate(url);

				DoLastTab();
			}
			else
			{
				BrowserNewMessage(this, "Creating New Browser ", -1);
				browser = new ctrlBrowser();
				browser.Tag = BrowserTabs.TabPages[BrowserTabs.TabPages.Count - 1];
				browser.NewTitle += BrowserNewTitle;
				browser.NewUrl += BrowserNewUrl;
				browser.NewFavIcon += BrowserNewFavIcon;
				browser.NewMessage += BrowserNewMessage;

				browser.Dock = DockStyle.Fill;
				BrowserNewMessage(this, "Using Last Tab For Browser ", -1);
				BrowserTabs.TabPages[BrowserTabs.TabPages.Count - 1].Controls.Add(browser);
				BrowserTabs.TabPages[BrowserTabs.TabPages.Count - 1].Text = "Loading...";
				BrowserTabs.TabPages[BrowserTabs.TabPages.Count - 1].Tag = browser;
				BrowserTabs.TabPages[BrowserTabs.TabPages.Count - 1].ImageIndex = 1;


				BrowserNewMessage(this, "Tab Index = " + browser.GetBrowserIndex().ToString(), -1);
				browser.Navigate(url);

				DoLastTab();
			}

		}

		private void DoLastTab()
		{

			TabPage tp = new TabPage();
			tp.Tag = null;
			tp.ImageIndex = 0;
			BrowserTabs.TabPages.Add(tp);

		}

		void BrowserNewMessage(object sender, string message, int browserNumber)
		{
			if (NewMessage != null) NewMessage(this, message, browserNumber); // Passed on to Form1
		}

		void BrowserNewFavIcon(object sender, Image favIcon, int browserNumber)
		{
			ctrlBrowser browser = sender as ctrlBrowser;
			TabPage tp = browser.Tag as TabPage;

			ilDefault.Images.Add(favIcon);
			AddFavIcon(tp);
		}

		private void AddFavIcon(TabPage tp)
		{
			if (BrowserTabs.InvokeRequired)
			{
				BrowserTabs.Invoke(new AddFavIconDelegate(AddFavIcon), tp);
			}
			else
			{
				tp.ImageIndex = ilDefault.Images.Count - 1;

			}
		}

		/// <summary>
		/// Notify a change of URL and add it to our history list
		/// </summary>
		/// <param name="sender"></param>
		/// <param name="url"></param>
		void BrowserNewUrl(object sender, string url)
		{
			HistoryList.Add(url);
			AddNewTab(url);
		}

		// Display the document title
		void BrowserNewTitle(object sender, string title, int browserNumber)
		{
			ctrlBrowser browser = sender as ctrlBrowser;
			// We don't want really long tabs so we will make sure it is not too long before using it
			if (title.Length > Settings.Default.MaximumTabLength) title = ShortTitle(title);
			TabPage tp = browser.Tag as TabPage;
			tp.Text = title;
			BrowserTabs.Refresh();
			this.Text = "taapBrowser :: " + BrowserTabs.TabPages[browserNumber].Text;
			this.Refresh();
		}

		// Shorten the title if it's too long
		private string ShortTitle(string title)
		{
			return title.Substring(0, Convert.ToInt32(Settings.Default.MaximumTabLength)).ToString() + "...";
		}

		private void BrowserTabs_SelectedIndexChanged(object sender, EventArgs e)
		{
			if (BrowserTabs.SelectedIndex == BrowserTabs.TabCount - 1)
			{
				BrowserNewMessage(this, "Adding New Tab ", -1);
				AddNewTab();
			}
			else
			{
				this.Text = "taapBrowser :: " + BrowserTabs.TabPages[BrowserTabs.SelectedIndex].Text;
				ctrlBrowser cb = BrowserTabs.TabPages[BrowserTabs.SelectedIndex].Tag as ctrlBrowser;
				if (cb == null)
				{
					BrowserNewMessage(this, "Selecting Tab " + BrowserTabs.SelectedIndex.ToString() + " No Attached Browser", -1);
				}
				else
				{
					BrowserNewMessage(this, "Selecting Tab " + BrowserTabs.SelectedIndex.ToString() + " Browser " + cb.GetBrowserIndex().ToString(), -1);
				}

				this.Refresh();
			}
		}

		[Obsolete]
		private void UpdateTabs(int removedTabIndex)
		{

			int currentTab = 0;
			int realTabCount = 0;

			foreach (TabPage tp in BrowserTabs.TabPages)  // Go through each TabPage
			{
				foreach (Control ctrl in tp.Controls) // Go through each Control on the page
				{
					ctrlBrowser cb = ctrl as ctrlBrowser;
					if (currentTab < removedTabIndex) // These tabs are all fine
					{
						BrowserNewMessage(this, "Renumbering Tabs " + currentTab.ToString() + " to " + realTabCount.ToString(), -1);
						realTabCount++;
					}
					else if (currentTab == removedTabIndex) // This is the Tab Being Removed
					{
						BrowserNewMessage(this, "Removing Tab " + currentTab.ToString(), -1);

					}
					else if (currentTab > removedTabIndex)
					{
						cb.Name = realTabCount.ToString();
						cb.SetBrowserIndex(realTabCount);
						tp.Text = cb.GetTitle();
						tp.Tag = cb;
						BrowserNewMessage(this, "Renumbering Tabs " + currentTab.ToString() + " to " + realTabCount.ToString(), -1);
						realTabCount++;
					}

				}

				currentTab++;
			}

		}

		private void BrowserTabs_TabClosing(object sender, TabControlCancelEventArgs e)
		{
			// UpdateTabs(e.TabPageIndex);
		}

		private void FrmBrowsers_Load(object sender, EventArgs e)
		{
			AddNewTab();
		}



	}
}
