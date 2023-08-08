using JDash.Helpers;
using JDash.Mvc.Core;
using JDash.Mvc.Util;
using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Linq;
using System.Reflection;
using System.Security;
using System.Text;
using System.Web;
using System.Web.Handlers;
using System.Web.Mvc;
using System.Web.UI;

namespace JDash.Mvc
{

    public class ThemeStyleInfo
    {

        public string title { get; private set; }
        public string color { get; private set; }

        public ThemeStyleInfo(string title, string color)
        {
            this.title = title;
            this.color = color;
        }
    }

    public class ThemeInfo
    {
        public string Name { get; private set; }
        public string CssPath { get; private set; }
        public string DefaultStyle { get; set; }
        public Dictionary<string, ThemeStyleInfo> Styles { get; internal set; }

        public ThemeInfo(string name, string cssPath)
        {
            this.Name = name;
            this.CssPath = cssPath;
            Styles = new Dictionary<string, ThemeStyleInfo>();
            DefaultStyle = null;
        }
    }


    public class ResourceManager : Widget<ResourceManager>
    {

        //private DashboardLicenseManager licenseManager = null;
        private static readonly string configClientBlock = "<script type='text/javascript'>var dojoConfig = {0};</script>\n";

        private static readonly string initClientBlock = "<script type='text/javascript'>require(['jdash/mvc/mvc'], function(mvc) {{ {0} }});</script>\n";
        private string clientInitHandler;
        private bool scriptModeDebug = false;
        private readonly SortedList<long, string> scriptOnReadyBag = new SortedList<long, string>();
        private InsertOrderedDictionary<string, string> scriptClientInitBag = new InsertOrderedDictionary<string, string>();
        private List<ThemeInfo> customThemes;
        private string _virtualPath = string.Empty;
        public Dictionary<string, dynamic> DojoConfig { get; private set; }

        public ResourceManager RegisterTheme(ThemeInfo theme)
        {
            if (this.customThemes == null)
                this.customThemes = new List<ThemeInfo>();
            this.customThemes.Add(theme);
            return this;
        }


        internal bool IsClientInitScriptRegistered(string key)
        {
            return this.scriptClientInitBag.ContainsKey(key);
        }

        internal InsertOrderedDictionary<string, string> ScriptClientInitBag
        {
            get
            {
                return this.scriptClientInitBag;
            }
        }

        internal void RegisterClientInitScript(string key, string script)
        {
            if (!this.IsClientInitScriptRegistered(key))
            {
                this.scriptClientInitBag.Add(key, script);
            }
        }

        public IEnumerable<ThemeInfo> Themes
        {
            get
            {
                var list = new List<ThemeInfo>();
                var defaultTheme = new ThemeInfo("default", "");
                var styles = new Dictionary<string, ThemeStyleInfo>()
                {
                    {"a", new ThemeStyleInfo("Black", "#242424") },
                    {"b", new ThemeStyleInfo("Blue", "#5B92C1") },
                    {"c", new ThemeStyleInfo("Default", "#E3E3E3") },
                   
                    {"d", new ThemeStyleInfo("LightGray", "#E3E3E3") },
                    {"e", new ThemeStyleInfo("Gray", "#b5bdc8") },
                    {"f", new ThemeStyleInfo("Yellow", "#8fc400")},
                };
                defaultTheme.Styles = styles;

                var flatTheme = new ThemeInfo("flat", "");
                flatTheme.Styles = new Dictionary<string, ThemeStyleInfo>()
                {
                    {"a", new ThemeStyleInfo("White", "#fff")},
                    {"b", new ThemeStyleInfo("Black", "#000")}
                };
                list.Add(defaultTheme);
                list.Add(flatTheme);
                return list;
            }
        }

        public static ResourceManager GetInstance()
        {
            return ResourceManager.GetInstance(HttpContext.Current);
        }


        public static ResourceManager GetInstance(HttpContext context)
        {
            if (context == null)
            {
                throw new ArgumentNullException("HttpContext is empty");
            }

            return context.Items[typeof(ResourceManager)] as ResourceManager;
        }




        public ResourceManager(HtmlHelper helper)
            : base(helper)
        {
            //var licenseManager = new DashboardLicenseManager(typeof(ResourceManager), this);
            //licenseManager.ValidateLicenseExistence();

            this.DojoConfig = new Dictionary<string, dynamic>(3);
            this.DojoConfig["isDebug"] = scriptModeDebug;
            this.DojoConfig["baseUrl"] = "/";
            var scripts = "/scripts";
            try
            {
                scripts = UrlHelper.GenerateContentUrl("~/Scripts", helper.ViewContext.HttpContext);
            }
            catch
            {
            }

            this.DojoConfig["packages"] = new dynamic[2] { new { name = "jdash", location = scripts + "/jdash" },
                                                           new { name = "dashlets", location = scripts + "/dashlets" } };
            this.WidgetConfig.Add("loadFromCookie", true);
            if (HttpContext.Current != null)
                HttpContext.Current.Items[typeof(ResourceManager)] = this;

        }

        public ResourceManager ClientBaseUrl(string baseUrl)
        {
            DojoConfig["baseUrl"] = baseUrl;
            return this;
        }

        public ResourceManager Package(string name, string location)
        {
            var foundIndex = -1;

            var itemCount = 0;
            foreach (var item in DojoConfig["packages"])
            {
                itemCount++;
            }

            for (int i = 0; i < itemCount; i++)
            {
                var item = DojoConfig["packages"][i];

                if (item.name == name)
                {
                    foundIndex = i;
                    break;
                }
            }


            if (foundIndex < 0)
            {
                var newItems = new dynamic[itemCount + 1];
                for (int i = 0; i < DojoConfig["packages"].length; i++)
                {
                    newItems[i] = DojoConfig["packages"][i];
                }
                newItems[itemCount] = new { name = name, location = location };
                DojoConfig["packages"] = newItems;
            }
            else
            {
                DojoConfig["packages"][foundIndex] = new { name = name, location = location };
            }

            return this;
        }


        internal SortedList<long, string> ScriptOnReadyBag
        {
            get
            {
                return this.scriptOnReadyBag;
            }
        }

        private static long proxyScriptNumber;
        internal static long ScriptOrderNumber
        {
            get
            {
                return System.Threading.Interlocked.Increment(ref proxyScriptNumber);
            }
        }

        internal void RegisterOnReadyScript(long orderNumber, string script)
        {
            if (!string.IsNullOrEmpty(script))
            {
                this.scriptOnReadyBag.Add(orderNumber, script);
            }
        }

        protected override string WidgetType
        {
            get { throw new NotImplementedException(); }
        }


        public override MvcHtmlString Render()
        {
            StringBuilder initScripts = new StringBuilder();
            StringBuilder preInitScripts = new StringBuilder();

            var resourceOverrides = new Dictionary<string, string>();
            resourceOverrides.Add("/resources/themes/default/main.css", Utils.GetResourceUrl(typeof(ResourceManager), "JDash.Mvc.resources.themes.default.main-embedded.css"));
            resourceOverrides.Add("/resources/themes/flat/main.css", Utils.GetResourceUrl(typeof(ResourceManager), "JDash.Mvc.resources.themes.flat.main-embedded.css"));
            resourceOverrides.Add("/resources/css/layout/builtin.css", Utils.GetResourceUrl(typeof(ResourceManager), "JDash.Mvc.resources.css.layout.builtin-embedded.css"));


            var initParams = new Dictionary<string, dynamic>();
            initParams.Add("themeManager", WidgetConfig);
            initParams.Add("resourceOverrides", resourceOverrides);
            initParams.Add("provider", new { virtualPath = (string.IsNullOrEmpty(_virtualPath) ? "" : "/" + _virtualPath), apiPath = "/" + App.ApiPath(true) });



            if (this.customThemes != null && customThemes.Count > 0)
            {
                var list = customThemes.Select(p => new KeyValuePair<string, dynamic>(p.Name, new { defaultStyle = p.DefaultStyle, css = p.CssPath, styles = p.Styles }));
                initParams.Add("customThemes", list);
            }

            preInitScripts.AppendFormat("mvc.initClient({0});\n", Serialization.JsonStringify(initParams));


            foreach (var item in this.ScriptClientInitBag)
            {
                initScripts.Append(item.Value + "\n");
            }

            initScripts.Append("mvc.Linker.link();\n");

            foreach (var item in this.ScriptOnReadyBag)
            {
                initScripts.Append(item.Value + "\n");
            }

            if (!string.IsNullOrEmpty(this.clientInitHandler))
            {
                if (!clientInitHandler.EndsWith(";"))
                    clientInitHandler += ";";
                initScripts.Append(clientInitHandler);
            }



            var initThemeManager = string.Format("mvc.when(mvc.clientInitDone(), \nfunction() {{\n {0}\n }},\n function(err) {{\n alert (err.message);\n }} );\n", initScripts.ToString());

            var configScript = string.Format(ResourceManager.configClientBlock, Serialization.JsonStringify(this.DojoConfig));
            var initScript = string.Format(ResourceManager.initClientBlock, preInitScripts.ToString() + initThemeManager);

            string scriptFile;
            if (!scriptModeDebug)
                scriptFile = "JDash.Mvc.resources.jdash_compressed.js";
            else
                scriptFile = "JDash.Mvc.resources.jdash.js";

            return new MvcHtmlString(configScript + Environment.NewLine + string.Format("<script type='text/javascript' src='{0}'></script>", Utils.GetResourceUrl(typeof(ResourceManager), scriptFile)) + Environment.NewLine + initScript);
        }

        protected override void RenderClientInitScript()
        {

        }

        public ResourceManager ClientInitHandler(string handler)
        {
            this.clientInitHandler = handler;
            return this;
        }

        public ResourceManager CookieForTheme(bool use)
        {
            this.WidgetConfig["loadFromCookie"] = use;
            return this;
        }

        public ResourceManager Theme(string id)
        {
            this.WidgetConfig["theme"] = id;
            return this;
        }

        public ResourceManager Style(string id)
        {
            this.WidgetConfig["style"] = id;
            return this;
        }

        public ResourceManager VirtualPath(string path)
        {
            _virtualPath = path;
            return this;
        }

        public ResourceManager ScriptMode(bool isDebug = false)
        {
            this.scriptModeDebug = isDebug;
            return this;
        }

    }
}
