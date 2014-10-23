using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Xml.Linq;

namespace ControlExplorer
{

    public class ControlData
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

        private IEnumerable<XElement> GetAllControlsData()
        {
            var rootControls = from el in Ele.Elements("Control") where el.Element("action") != null select el;
            var childControls = from el in Ele.Descendants("ChildControl") select el;
            
            return rootControls.Union(childControls).OrderBy(p => p.Attribute("name").Value);
        }

        public List<ControlEntity> GetFavoriteControls()
        {
            List<ControlEntity> controls = new List<ControlEntity>();
            var res = GetAllControlsData().Where(p => p.Attribute("isFavorite") != null && p.Attribute("isFavorite").Value == "true");
            
            foreach (var obj in res)
            {
                controls.Add(GetControlEntity(obj));
            }

            return controls;
        }

        public List<ControlEntity> GetAllControls()
        {
            List<ControlEntity> controls = new List<ControlEntity>();
            var res = GetAllControlsData();
            
            foreach (var obj in res)
            {
                controls.Add(GetControlEntity(obj));
            }
            
            return controls;
        }

        public ControlEntity GetControlEntity(XElement obj)
        {
            var control = new ControlEntity();

            control.Name = obj.Attribute("name").Value;
            control.Link = "~/C1" + control.Name + "/Overview.aspx";
            control.Title = obj.Attribute("text") != null ? obj.Attribute("text").Value : control.Name;
            control.Icon = "~/explore/css/images/icons/widget/" + control.Name + ".png";

            return control;
        }
    }

	public class ControlEntity 
	{
		public string Name
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

		public string Link
		{
			get;
			set;
		}
	}

    public class FeatureData
    {
        private XElement _ele;
        private XElement Ele
        {
            get
            {
                if (_ele == null)
                {
                    _ele = XElement.Load(HttpContext.Current.Server.MapPath("~/NewFeatures.xml"));
                }

                return _ele;
            }
        }

        public List<Feature> GetWhatsNewFeatures()
        {
            var features = new List<Feature>();

            foreach (var f in Ele.Elements("feature"))
            {
                var feature = new Feature
                {
                    Name = f.Attribute("name").Value,
                    Title = f.Attribute("title").Value,
                    Icon = f.Attribute("icon").Value,
                    Description = f.Attribute("description").Value,
                    Link = f.Attribute("link").Value
                };

                features.Add(feature);
            }

            return features;
        }
    }

    public class Feature
    {
        public string Name
        {
            get;
            set;
        }

        public string Title
        {
            get;
            set;
        }

        public string Icon
        {
            get;
            set;
        }

        public string Description
        {
            get;
            set;
        }

        public string Link
        {
            get;
            set;
        }     
    }
}