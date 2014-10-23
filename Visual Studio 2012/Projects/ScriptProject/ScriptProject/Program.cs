using System;
using System.Collections.Generic;
using System.Html;
using jQueryApi;

namespace ScriptProject
{
    public class Program
    {
        static void Main() {
            jQuery.OnDocumentReady(() => {
                jQuery.Select("#main h2").Click(async (el, evt) =>
                {
                    await jQuery.Select("#main p").FadeOutTask();
                    await jQuery.Select("#main p").FadeInTask();
                    Window.Alert("Done");
                });
            });
            
        }
    }

    public class Person
    {
        string name = "";
    }

    public class Todd : Person
    {
        string myname = "Todd";
    }
    
}