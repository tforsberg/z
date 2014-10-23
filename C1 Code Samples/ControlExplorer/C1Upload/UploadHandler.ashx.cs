using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;

namespace ControlExplorer.C1Upload
{
	/// <summary>
	/// Summary description for UploadHandler
	/// </summary>
	public class UploadHandler : IHttpHandler
	{

		public void ProcessRequest(HttpContext context)
		{
			string sDirectory = HttpContext.Current.Server.MapPath("~/UploadedFiles");
			if (!Directory.Exists(sDirectory))
			{
				Directory.CreateDirectory(sDirectory);
			}
			var request = context.Request;
			var requestType = request.Headers["Wijmo-RequestType"];
			if (!String.IsNullOrEmpty(requestType) && requestType == "XMLHttpRequest")
			{
				var fileName = request.Headers["Wijmo-FileName"];
				using (FileStream fs = new FileStream(sDirectory + "\\" + context.Server.UrlDecode(fileName), FileMode.Create))
				{
					var inputStream = context.Request.InputStream;
					byte[] bytes = new byte[(int)inputStream.Length];
					inputStream.Read(bytes, 0, (int)inputStream.Length);
					fs.Write(bytes, 0, bytes.Length);
					fs.Close();
				}
			}
			else
			{
				HttpFileCollection oFiles = context.Request.Files;
				if (oFiles != null && oFiles.Count > 0)
				{
					for (int i = 0; i < oFiles.Count; i++)
					{
						string fileName = oFiles[i].FileName;
						int idx = fileName.LastIndexOf("\\");
						if (idx > -1)
						{
							fileName = fileName.Substring(idx + 1);
						}
						oFiles[i].SaveAs(sDirectory + "\\" + fileName);
					}
					context.Response.Write("Sucess");
				}
				else
				{
					context.Response.Write("Fail");
				}
			}       
		}

		public bool IsReusable
		{
			get
			{
				return false;
			}
		}
	}
}