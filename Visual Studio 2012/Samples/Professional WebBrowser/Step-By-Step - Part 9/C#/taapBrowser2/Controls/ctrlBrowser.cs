using System;
using System.Collections.Generic;
using System.Drawing;
using System.IO;
using System.Net;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace taapBrowser2.Controls
{
	public partial class ctrlBrowser : UserControl
	{

		public delegate void NewTitleEventArgs(object sender, string title, int browserNumber);

		public event NewTitleEventArgs NewTitle;

		public delegate void NewTabPageEventArgs(object sender, string url);
		public event NewTabPageEventArgs NewUrl;
		public delegate void NewFavIconEventArgs(object sender, Image favIcon, int browserNumber);
		public event NewFavIconEventArgs NewFavIcon;
		public delegate void NewConsoleMessageEventArgs(object sender, string message, int browserNumber);
		public event NewConsoleMessageEventArgs NewMessage;

		public static int BrowserCounter { get; set; }
		public static List<string> HistoryList = new List<string>();

		public ctrlBrowser()
		{
			InitializeComponent();

			this.BrowserControl.AddressChanged += BrowserControl_AddressChanged;
			this.BrowserControl.CertificateError += BrowserControl_CertificateError;
			this.BrowserControl.ConsoleMessage += BrowserControl_ConsoleMessage;
			this.BrowserControl.Crashed += BrowserControl_Crashed;
			this.BrowserControl.DocumentReady += BrowserControl_DocumentReady;
			this.BrowserControl.TargetURLChanged += BrowserControlTargetUrlChanged;
			this.BrowserControl.TitleChanged += BrowserControl_TitleChanged;
			this.BrowserControl.WindowClose += BrowserControl_WindowClose;


			this.BrowserControl.Name = BrowserCounter.ToString();

			BrowserCounter++;
		}

		void BrowserControl_WindowClose(object sender, Awesomium.Core.WindowCloseEventArgs e)
		{
			// throw new NotImplementedException();
		}

		// Raise an Event that the Title of the document has changed
		void BrowserControl_TitleChanged(object sender, Awesomium.Core.TitleChangedEventArgs e)
		{
			if (NewTitle != null) NewTitle(this, e.Title, this.GetBrowserIndex());
			if (NewMessage != null) NewMessage(this, e.Title, this.GetBrowserIndex());
		}

		void BrowserControlTargetUrlChanged(object sender, Awesomium.Core.UrlEventArgs e)
		{
			if (!e.Url.ToString().ToLowerInvariant().StartsWith("about:")) NewMessage(this, "Mouse Over :" + e.Url.ToString(), this.GetBrowserIndex());

		}

		void BrowserControl_DocumentReady(object sender, Awesomium.Core.UrlEventArgs e)
		{
			Task tFavIcon = Task.Factory.StartNew(() => GetFavIcon(BrowserControl.Source.ToString()));
			if (e.HasErrors)
			{
				lbStatus.Text = "Done. (Has Errors)";
			}
			else
			{
				lbStatus.Text = "Done.";
			}
			UpdateControls();
		}

		void BrowserControl_Crashed(object sender, Awesomium.Core.CrashedEventArgs e)
		{
			switch (e.Status)
			{
				case Awesomium.Core.TerminationStatus.Abnormal:
					NewMessage(this, "Abnormal Termination of browser ", this.GetBrowserIndex());
					break;
				case Awesomium.Core.TerminationStatus.Crashed:
					NewMessage(this, "Crashed Termination of browser ", this.GetBrowserIndex());
					break;
				case Awesomium.Core.TerminationStatus.Killed:
					NewMessage(this, "Killed Termination of browser ", this.GetBrowserIndex());
					break;
				case Awesomium.Core.TerminationStatus.None:
					NewMessage(this, "None Termination of browser ", this.GetBrowserIndex());
					break;
				case Awesomium.Core.TerminationStatus.Normal:
					NewMessage(this, "Normal Termination of browser ", this.GetBrowserIndex());
					break;
				case Awesomium.Core.TerminationStatus.StillRunning:
					NewMessage(this, "Browser Still Running ", this.GetBrowserIndex());
					break;
				default:
					break;
			}
		}

		void BrowserControl_ConsoleMessage(object sender, Awesomium.Core.ConsoleMessageEventArgs e)
		{
			if (NewMessage != null) NewMessage(this, e.Message, this.GetBrowserIndex()); // Subscribed to by FrmBrowsers
		}

		void BrowserControl_CertificateError(object sender, Awesomium.Core.CertificateErrorEventArgs e)
		{
			if (NewMessage != null) NewMessage(this, "Certificate Error ", this.GetBrowserIndex());
		}

		/// <summary>
		/// Also save the new address to the history list
		/// </summary>
		/// <param name="sender"></param>
		/// <param name="e"></param>
		void BrowserControl_AddressChanged(object sender, Awesomium.Core.UrlEventArgs e)
		{
			HistoryList.Add(e.Url.ToString()); 
			lbStatus.Text = e.Url.ToString();
		}

		internal int GetBrowserIndex()
		{
			return int.Parse(this.BrowserControl.Name);
		}

		public void SetBrowserIndex(int count)
		{
			this.BrowserControl.Name = count.ToString();
		}

		public string GetTitle()
		{
			return this.BrowserControl.Title;
		}

		// Does not check for error-ed URLs
		public void Navigate(string url)
		{
			BrowserControl.Source = new Uri(url);
			UpdateControls();
		}

		private void UpdateControls()
		{
			try
			{
				btnBack.Enabled = BrowserControl.CanGoBack();
				btnForward.Enabled = BrowserControl.CanGoForward();
			}
			catch (NullReferenceException)
			{
				// Occurs if Windows are not created yet.
			}
			catch (Exception ex)
			{
				try
				{
					if (NewMessage != null) NewMessage(this, ex.Message, this.GetBrowserIndex());
				}
				catch (NullReferenceException)
				{
					// Occurs if Windows are not created yet.
				}
				catch (Exception)
				{

					throw;
				}
			}
		}

		public void GetFavIcon(string u)
		{
			Uri url = new Uri(u);
			String iconurl = "http://" + url.Host + "/favicon.ico";

			WebRequest request = WebRequest.Create(iconurl);
			try
			{
				WebResponse response = request.GetResponse();

				Stream s = response.GetResponseStream();
				NewFavIcon(this, Image.FromStream(s), this.GetBrowserIndex());
			}
			catch (Exception ex)
			{
				//return a default icon in case 
				//the web site doesn`t have a favicon
				NewFavIcon(this, Image.FromFile(@"Styles\Default\Document.png"), this.GetBrowserIndex());
			}
		}

		private void AddressBar_SizeChanged(object sender, EventArgs e)
		{
			ResizeTheAddressBar();
			UpdateControls();
		}

		private void ResizeTheAddressBar()
		{
			if (AddressBar.Width - GetAddressBarControlsWidth() != tbAddressBar.Width)
			{
				tbAddressBar.Width = AddressBar.Width - (GetAddressBarControlsWidth() + 50);
			}
		}

		private int GetAddressBarControlsWidth()
		{
			int width = 0;
			ToolStripItemCollection tsic = AddressBar.Items;

			foreach (ToolStripItem item in tsic)
			{
				if (item.Name != "tbAddressBar")
				{
					width += item.Width;
					width += item.Margin.Horizontal;
				}
			}
			return width;
		}

		private void BtnReloadClick(object sender, EventArgs e)
		{
			BrowserControl.Reload(true); // Ignore the cache when reloading
		}

		private void BtnHomeClick(object sender, EventArgs e)
		{
			Navigate(Properties.Settings.Default.Homepage);
		}

		private void BtnBackClick(object sender, EventArgs e)
		{
			BrowserControl.GoBack();
		}

		private void BtnForwardClick(object sender, EventArgs e)
		{
			BrowserControl.GoForward();
		}

		private void TbSearchBoxKeyUp(object sender, KeyEventArgs e)
		{
			if (e.KeyCode == Keys.Return || e.KeyCode == Keys.Enter && !string.IsNullOrWhiteSpace(this.tbSearchBox.Text))
				Navigate(string.Format("https://www.google.co.uk/#q={0}", this.tbSearchBox.Text.Replace(" ", "+")));

		}

		private void BtnSearchClick(object sender, EventArgs e)
		{
			if (!string.IsNullOrWhiteSpace(this.tbSearchBox.Text))
				Navigate(string.Format("https://www.google.co.uk/#q={0}", this.tbSearchBox.Text.Replace(" ", "+")));
		}

		private void BtnSecureClick(object sender, EventArgs e)
		{
			MessageBox.Show("Security is not implemented yet");
		}


		private void BtnFavouritesClick(object sender, EventArgs e)
		{
			MessageBox.Show("Bookmarks is not implemented yet");
		}


	}
}
