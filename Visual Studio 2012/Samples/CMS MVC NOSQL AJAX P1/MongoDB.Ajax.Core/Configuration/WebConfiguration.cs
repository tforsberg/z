using System;
using System.Collections.Generic;
using System.Collections.Specialized;
using System.Configuration;
using System.Linq;
using System.Text;
using System.Web;
using System.Xml;

namespace MongoDB.Ajax.Business
{
    public class WebConfigSectionHandler : IConfigurationSectionHandler
    {
        public object Create(object parent, object configContext, XmlNode section)
        {
            return new WebConfiguration(section);
        }

    }


    public class WebConfiguration
    {

        private const string CONFIG_SECTION = "webconfig";

        private static NameValueCollection _values;


        public WebConfiguration(XmlNode node)
        {
            _values = new NameValueCollection();
            XmlNodeList nodes = node.ChildNodes;

            foreach (XmlNode _node in nodes)
            {

                _values.Add(_node.Name, _node.InnerText);
            }
        }

        private static readonly Object _lock = new Object();

        public static WebConfiguration Instant
        {
            get
            {
                lock (_lock)
                {

                    var settings = (WebConfiguration)ConfigurationManager.GetSection(CONFIG_SECTION);

                    if (settings == null)
                    {
                        if (HttpContext.Current == null)
                            throw new ApplicationException(
                                "The main forum control is not design-time compatible due to it's complexity. Please load the individual page controls to modify the website.");
                        throw new ApplicationException("Failed to get configuration from Web.config.");
                    }
                    return settings;
                }

            }
        }

        public string this[string key]
        {
            get { return _values[key]; }
        }


        public string Language
        {
            get { return this["Language"]; }
        }

        public double TimeZoneOffset
        {
            get { return double.Parse(this["TimeZone"]); }
        }

        public string AbsoluteUrl
        {
            get { return this["AbsoluteUrl"] ?? "/"; }
        }

        public string Extension
        {
            get { return this["Extension"]; }
        }

        public string ImagePrefix
        {
            get { return this["ImagePrefix"]; }
        }


        public string HeadContent
        {
            get { return this["HeadContent"]; }
        }
        public string FootContent
        {
            get { return this["FootContent"]; }
        }

        public string Domain
        {
            get { return this["Domain"]; }
        }

        public string Brand
        {
            get { return this["Brand"]; }
        }

        public string PageTitle
        {
            get { return this["PageTitle"]; }
        }

        public string Keywords
        {
            get { return this["Keywords"]; }
        }

        public string Description
        {
            get { return this["Description"]; }
        }

        public string AdminEmail
        {
            get { return this["AdminEmail"]; }
        }

        public string EncryptPassword
        {
            get { return this["EncryptPassword"]; }
        }

        public string DateTimeFormat
        {
            get { return this["DateTimeFormat"]; }
        }

        public int PageSize
        {
            get { return Convert.ToInt32(this["PageSize"]); }
        }

        public int SiteMapPageSize
        {
            get { return Convert.ToInt32(this["SiteMapPageSize"]); }
        }


        public bool AllowRssFeed
        {
            get { return Convert.ToBoolean(this["AllowRssFeed"]); }
        }

        public int FeedPageSize
        {
            get { return Convert.ToInt32(this["FeedPageSize"]); }
        }


        public string SocialSharingWidget
        {
            get { return this["SocialSharingWidget"]; }
        }



        #region Smtp

        public string SmtpServer
        {
            get { return this["SmtpServer"]; }
        }

        public int SmtpPort
        {
            get { return Convert.ToInt32(this["SmtpPort"]); }
        }

        public string SmtpSender
        {
            get { return this["SmtpSender"]; }
        }

        public bool SmtpCredentials
        {
            get { return Convert.ToBoolean(this["SmtpCredentials"]); }
        }

        public string SmtpUserName
        {
            get { return this["SmtpUserName"]; }
        }

        public string SmtpUserPass
        {
            get { return this["SmtpUserPass"]; }
        }

        public string EmailSignature
        {
            get { return this["EmailSignature"]; }
        }

        public bool SmtpSsl
        {
            get { return Convert.ToBoolean(this["SmtpSsl"]); }
        }

        #endregion
    }
}
