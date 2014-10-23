using System;

namespace MongoDB.Ajax.Business
{
    public class ActiveUrl
    {

        public bool IsHomePage { get; set; }

        public string Title { get; set; }

        public string Url { get; set; }

        public string ShortUrl { get; set; }

        public DateTime? Created { get; set; }

        public string Keywords { get; set; }

        public string Description { get; set; }

        public string RssLink { get; set; }

    }
}
