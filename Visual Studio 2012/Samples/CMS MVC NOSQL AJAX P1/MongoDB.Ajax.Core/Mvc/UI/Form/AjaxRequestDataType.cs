using System.Runtime.Serialization;

namespace MongoDB.Ajax.Business
{
    [DataContract]
    public enum AjaxRequestDataType
    {
        [EnumMember(Value = "html")]
        Html,
        [EnumMember(Value = "json")]
        Json,
        Jsonp,
        [EnumMember(Value = "script")]
        Script,
        [EnumMember(Value = "xml")]
        Xml,
        Text
    }
}