using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.IO;

namespace wijmoSample1.Controllers
{
	public class UploadController : Controller
	{
		
		public ActionResult Overview()
		{
			return View();
		}

		[HttpPost]
		public JsonResult Upload() 
		{
			string sDirectory = Server.MapPath(Request["folder"]);
			if (!Directory.Exists(sDirectory))
			{
				Directory.CreateDirectory(sDirectory);
			}
			string requestType = Request.Headers["Wijmo-RequestType"];
			if (!String.IsNullOrEmpty(requestType) && requestType == "XMLHttpRequest")
			{
				string fileName = Request.Headers["Wijmo-FileName"];
				using (FileStream fs = new FileStream(sDirectory + "\\" + fileName, FileMode.Create))
				{
					var inputStream = Request.InputStream;
					byte[] bytes = new byte[(int)inputStream.Length];
					inputStream.Read(bytes, 0, (int)inputStream.Length);
					fs.Write(bytes, 0, bytes.Length);
					fs.Close();
					return Json(true, "text/html");
				}
			}
			else {
				HttpFileCollectionBase oFiles = Request.Files;
				if (oFiles != null && oFiles.Count > 0)
				{
					for (int i = 0; i < oFiles.Count; i++)
					{
						string fileName = oFiles[i].FileName;
						int idx = fileName.LastIndexOf("\\");
						if (idx > -1)
						{
							fileName = fileName.Substring(idx);
						}
						oFiles[i].SaveAs(sDirectory + fileName);
					}
					return Json(true, "text/html");
				}
			}
			return Json(false, "text/html");
		}
	}
}
