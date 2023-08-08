using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Web;

namespace JDash.WebForms
{
    internal class RequestManager
    {
        public static bool IsMicrosoftAjaxRequest
        {
            get
            {
                if (HttpContext.Current != null && HttpContext.Current.Request != null)
                {
                    return RequestManager.HasXMicrosoftAjaxHeader(HttpContext.Current.Request);
                }

                return false;
            }
        }

        public static bool HasXMicrosoftAjaxHeader(HttpRequest request)
        {
            string[] values = HttpContext.Current.Request.Headers.GetValues("X-MicrosoftAjax");

            if (values != null)
            {
                foreach (string value in values)
                {
                    if (value.ToLower().Contains("delta=true"))
                    {
                        return true;
                    }
                }
            }

            return false;
        }


        
        
    }
}
