using System.Runtime.Serialization;

namespace MongoDB.Ajax.Business
{

    public enum EditorToolbarMode
    {
        [EnumMember(Value = "small")]
        Small,
        [EnumMember(Value = "medium")]
        Medium,
        [EnumMember(Value = "full")]
        Full
    }
}
