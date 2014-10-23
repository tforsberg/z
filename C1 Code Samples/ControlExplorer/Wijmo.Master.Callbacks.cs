using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;

namespace ControlExplorer
{
	public partial class Wijmo : System.Web.UI.MasterPage, ICallbackEventHandler
    {
		private string _callbackArgument = "";
		private string _callbackResult = "unknown command";

		protected void RegisterCallbacks()
		{

			string webFormDoCallbackScript = this.Page.ClientScript.GetCallbackEventReference(this, "arg", "onCallbackSuccess", null, true);
			string serverCallScript = "function executeCallback(arg){" + webFormDoCallbackScript + ";\n}\n";

			if (!this.Page.ClientScript.IsClientScriptBlockRegistered("executeCallbackScript"))
			{
				this.Page.ClientScript.RegisterClientScriptBlock(this.GetType(), "executeCallbackScript", serverCallScript, true);
			}
		}

		public string GetCallbackResult()
		{
			return _callbackResult;
		}

		public void RaiseCallbackEvent(string eventArgument)
		{
			_callbackArgument = eventArgument;
			string[] arr = eventArgument.Split('=');
			if (arr.Length == 2)
			{
				switch (arr[0])
				{
					case "theme":
						WidgetTabs.Theme = arr[1];
						_callbackResult = "ok";
						break;
					default:
						break;
				}
			}
		}
	}
}