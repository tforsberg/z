using System;
using WeifenLuo.WinFormsUI.Docking;

namespace taapBrowser2.Forms
{
	public partial class FrmConsoleWindow : DockContent
	{

		public enum MessageStatus 
		{
			SYS = -1
		}

		public FrmConsoleWindow()
		{
			InitializeComponent();
		}

		internal void Message(string p, int browserNumber)
		{
			if (browserNumber > (int)MessageStatus.SYS)
			{
				string msg = "[" + DateTime.Now.ToString() + "]\t:[" + browserNumber.ToString() + "]\t" + p;
				rtbConOut.AppendText(msg + Environment.NewLine); // the \t is the escape sequence to enter a tab
				Console.WriteLine(msg);
			}
			else if(browserNumber ==  (int)MessageStatus.SYS) // FrmBrowsers Message not a ctrlBrowser Message
			{
				string msg = "[" + DateTime.Now.ToString() + "]\t:[SYS]\t" + p;
				rtbConOut.AppendText(msg + Environment.NewLine); // the \t is the escape sequence to enter a tab
				Console.WriteLine(msg);
			}
			rtbConOut.Refresh();
			rtbConOut.Focus();
		}
	}
}
