using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Reflection;
using System.Text;
using System.Web;
using System.Web.UI;

namespace JDash.WebForms
{
    /// <summary>
    /// Nls handler class. Used internally.
    /// </summary>
    public class NlsHandler : IHttpHandler
    {
        public bool IsReusable
        {
            get { return true; }
        }

        private void sendit(Stream stream, HttpContext context)
        {
            using (StreamReader reader = new StreamReader(stream, Encoding.Default))
            {
                context.Response.ContentType = "application/x-javascript";
                context.Response.Write(reader.ReadToEnd());
                reader.Close();
            }
        }

        public void ProcessRequest(HttpContext context)
        {
            var vpath = context.Request.Path;
            var physicalPath = context.Request.PhysicalPath;
            var redirectPath = string.Empty;

            context.Response.Cache.SetCacheability(HttpCacheability.Public);
            context.Response.Cache.SetMaxAge(new TimeSpan(1, 0, 0));

            if (File.Exists(physicalPath))
            {
                var lastModified = File.GetLastWriteTime(physicalPath);
                string rawIfModifiedSince = context.Request.Headers.Get("If-Modified-Since");
                if (string.IsNullOrEmpty(rawIfModifiedSince))
                {
                    context.Response.Cache.SetLastModified(lastModified);
                    using (Stream stream = new FileStream(physicalPath, FileMode.Open, FileAccess.Read, FileShare.Read))
                    {
                        sendit(stream, context);
                        stream.Close();
                    }
                }
                else
                {
                    DateTime ifModifiedSince = DateTime.Parse(rawIfModifiedSince);

                    if (lastModified.AddMilliseconds(lastModified.Millisecond) == ifModifiedSince)
                    {                        
                        context.Response.StatusCode = 304;
                        return;
                    }

                    using (Stream stream = new FileStream(physicalPath, FileMode.Open, FileAccess.Read, FileShare.Read))
                    {
                        sendit(stream, context);
                        stream.Close();
                    }
                }
            }
            else
            {
                var parts = vpath.Split(new string[] { "nls/" }, StringSplitOptions.RemoveEmptyEntries);
                var scriptPath = string.Format("JDash.WebForms.resources.nls.{0}", parts[1].Replace('/', '.'));

                var info = Assembly.GetExecutingAssembly().GetManifestResourceInfo(scriptPath);

                if (info == null)
                {
                    context.Response.StatusCode = 404;
                    context.Response.StatusDescription = "not found";
                }
                else
                {                    
                    var page = new Page();
                    redirectPath = page.ClientScript.GetWebResourceUrl(typeof(ResourceManager), scriptPath);
                    context.Response.Redirect(redirectPath);
                }
            }
        }
    }
}
