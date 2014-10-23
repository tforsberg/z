using System.Web.Mvc;
using MongoDB.Bson;

namespace MongoDB.Ajax.Business.Mvc.Binders
{
    public class ObjectIdBinder : IModelBinder
    {
        // ModelBinders.Binders.Add(typeof(ObjectId), new ObjectIdBinder());
        public object BindModel(ControllerContext controllerContext, ModelBindingContext bindingContext)
        {
            var result = bindingContext.ValueProvider.GetValue(bindingContext.ModelName);
            return !string.IsNullOrWhiteSpace(result.AttemptedValue) ? ObjectId.Parse(result.AttemptedValue) : ObjectId.Empty;
        }
    }

}
