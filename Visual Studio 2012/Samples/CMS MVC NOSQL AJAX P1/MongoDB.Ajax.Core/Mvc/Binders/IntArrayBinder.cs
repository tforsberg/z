using System;
using System.Web.Mvc;

namespace MongoDB.Ajax.Business.Mvc.Binders
{
    public class IntArrayBinder : IModelBinder
    {
        public object BindModel(ControllerContext controllerContext, ModelBindingContext bindingContext)
        {
            var result = bindingContext.ValueProvider.GetValue(bindingContext.ModelName);
            if (!string.IsNullOrWhiteSpace(result.AttemptedValue))
            {

                var _words = result.AttemptedValue.Trim().Split(new char[] { ',', ';' }, StringSplitOptions.RemoveEmptyEntries);
                var ints = new int[_words.Length];
                for (int i = 0; i < _words.Length; i++)
                {
                    ints[i] = int.Parse(_words[i].Trim());
                }

                return ints;
            }

            return null;
        }
    }
}
