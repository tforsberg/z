using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Xml.Linq;

namespace ToolkitExplorer
{
	public class WidgetData
	{

		private XElement _ele;
		private XElement Ele
		{
			get
			{
				if (_ele == null)
				{
					_ele = XElement.Load(HttpContext.Current.Server.MapPath("~/ControlList.xml"));
				}
				return _ele;
			}
		}


		private IEnumerable<XElement> GetAllWidgetData() 
		{
			var rootwidgets = from el in Ele.Elements("Control") where el.Element("action") != null select el;
			var childWidgets = from el in Ele.Descendants("ChildControl") select el;
			return rootwidgets.Union(childWidgets).OrderBy(p=>p.Attribute("name").Value);
		}

		public List<WidgetEntity> GetFavoriteWidgets()
		{
			List<WidgetEntity> widgets = new List<WidgetEntity>();
			WidgetEntity widget;
			var res = GetAllWidgetData().Where(p => p.Attribute("isFavorite") != null && p.Attribute("isFavorite").Value == "true");
			foreach (var obj in res) {
				widget = new WidgetEntity();
				widget.WidgetName = obj.Attribute("name").Value;
				widget.WidgetHref = "~/" + widget.WidgetName + "/Overview.aspx";
				widget.Title = obj.Attribute("text") != null ? obj.Attribute("text").Value : widget.WidgetName;
                widget.Icon = "~/explore/css/images/icons/widget/" + widget.WidgetName + ".png";
				//widget.Icon = "explore/css/images/icons/widget/accordion.png";
				widgets.Add(GetWidgetEntity(obj,true));
			}
			return widgets;
		}

		public List<WidgetEntity> GetAllWidgets() 
		{
			List<WidgetEntity> widgets = new List<WidgetEntity>();
			WidgetEntity widget;
			var res = GetAllWidgetData();
			foreach (var obj in res)
			{
				widget = new WidgetEntity();
				widget.WidgetName = obj.Attribute("name").Value;
				widget.WidgetHref = "~/" + widget.WidgetName + "/Overview.aspx";
				widget.Title = obj.Attribute("text") != null ? obj.Attribute("text").Value : widget.WidgetName;
				widget.Icon = "~/explore/css/images/icons/widget/" + widget.WidgetName + ".png";
				//widget.Icon = "explore/css/images/icons/widget/accordion.png";
				widgets.Add(GetWidgetEntity(obj,false));
			}
			return widgets;
		}

		public WidgetEntity GetWidgetEntity(XElement obj, bool bigIcon){
			var widget = new WidgetEntity();
			widget.WidgetName = obj.Attribute("name").Value;
			widget.WidgetHref = "~/" + widget.WidgetName + "/Overview.aspx";
			widget.Title = obj.Attribute("text") != null ? obj.Attribute("text").Value : widget.WidgetName;
			widget.Icon = "~/explore/css/images/icons/widget/" + widget.WidgetName + ".png";
			if (bigIcon)
			{
                //widget.Icon = "explore/css/images/icons/widget/accordion.png";
                widget.Icon = "~/explore/css/images/icons/widget/" + widget.WidgetName + ".png";
			}
			else
			{
				//widget.Icon = "explore/css/images/icons/widget/accordion.png";
                widget.Icon = "~/explore/css/images/icons/widget/" + widget.WidgetName + ".png";
			}
			
			return 	widget;
	}

	}



	public class WidgetEntity 
	{
		public string WidgetName
		{
			get;
			set;
		}

		public string Icon
		{
			get;
			set;
		}

		public string Title
		{
			get;
			set;
		}

		public string WidgetHref
		{
			get;
			set;
		}
	}
}