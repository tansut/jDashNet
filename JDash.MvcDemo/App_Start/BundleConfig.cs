using System.Web;
using System.Web.Optimization;

namespace JDash.MvcDemo
{
    public class BundleConfig
    {
        // For more information on Bundling, visit http://go.microsoft.com/fwlink/?LinkId=254725
        public static void RegisterBundles(BundleCollection bundles)
        {

            bundles.Add(new ScriptBundle("~/bundles/jquery").Include(
            "~/Scripts/jquery-{version}.js"));




            bundles.Add(new ScriptBundle("~/bundles/jqueryval").Include(
                        "~/Scripts/jquery.unobtrusive*",
                        "~/Scripts/jquery.validate*"));


            bundles.Add(new ScriptBundle("~/bundles/bootstrap").Include(
            "~/Scripts/bootstrap.js", "~/Scripts/bootstrap-switch.js", "~/Scripts/bootstrap-colorselector.js"));


            bundles.Add(new ScriptBundle("~/bundles/sly").Include(
                "~/Scripts/sly.js"));
            bundles.Add(new ScriptBundle("~/bundles/swatch").Include(
                 "~/Scripts/modernizr.custom.79639.js",
                 "~/Scripts/jquery.swatchbook.js"));


            bundles.Add(new ScriptBundle("~/bundles/app").Include(
                "~/Scripts/app/DashboardModule.js",
                "~/Scripts/app/DashboardsMenu.js"));


            bundles.Add(new ScriptBundle("~/bundles/history").Include(
                "~/Scripts/history.js"));


            bundles.Add(new StyleBundle("~/bundles/css").Include(
                      "~/Content/css/bootstrap.css",
                      "~/Content/css/bootstrap-switch.css",
                      "~/Content/css/site.css",
                      "~/Content/css/bootstrap-colorselector.css"));

        }
    }
}