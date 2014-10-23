using System.Runtime.Serialization;

namespace MongoDB.Ajax.Business
{
    [DataContract]
    public enum AjaxResultInlineMode
    {
        [EnumMember(Value = "replace")]
        Replace,
        [EnumMember(Value = "replaceWith")]
        ReplaceWith,
        [EnumMember(Value = "append")]
        Append,
        [EnumMember(Value = "before")]
        InsertBefore,
        [EnumMember(Value = "after")]
        InsertAfter,


    }
}