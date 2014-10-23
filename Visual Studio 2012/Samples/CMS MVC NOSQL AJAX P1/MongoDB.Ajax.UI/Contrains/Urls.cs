using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace MongoDB.Ajax.Business.Contrains
{
    public class Urls
    {

        public const string DEFAULT = "{0}";
        public const string HOME_PAGE = "{0}";

        public const string TAG = "{0}search/tag/{1}{2}";

        public const string FIND_POST = "{0}go/{1}{2}";


        public const string GROUP_LIST = "{0}{1}/X{2}{3}";

        public const string GROUP_PAGING = "{0}{1}/X{2}P{3}{4}";


        public const string NEWS_DETAIL = "{0}{1}.NI{2}{3}";

        public const string NEWS_DETAIL_FRIEND_URL = "{0}{1}/{2}/{3}{4}";

        public const string PRODUCT_DETAIL = "{0}{1}.XY{2}{3}";

        public const string GROUP_FRIEND_URL_LIST = "{0}{1}{2}";

        public const string GROUP_FRIEND_URL_LIST_PAGING = "{0}{1}/page-{2}{3}";
    }
}
