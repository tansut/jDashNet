using JDash.MvcDemo.Areas.Dashlets.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text.RegularExpressions;
using System.Web;
using System.Web.Mvc;
using System.Xml.Linq;

namespace JDash.MvcDemo.Areas.Dashlets.Controllers
{
    public class RssController : Controller
    {
        public ActionResult Index(string id)
        {
            var dashlet = JDashManager.Provider.GetDashlet(id);
            var rssUrl=dashlet.config.Get<string>("url", "");
            var limit = dashlet.config.JsonParsed<int>("limit",10);
            var ShowBody = dashlet.config.JsonParsed<bool>("showBody",false);
            if (!String.IsNullOrEmpty(rssUrl))
            {
                ViewBag.RssItems = GetRssFeed(rssUrl, limit);
                ViewBag.ShowBody = ShowBody;
            }
            return View();
        }

        public ActionResult Editor(string id)
        {
            var dashlet = JDashManager.Provider.GetDashlet(id);
            var url = dashlet.config.Get<string>("url", "");
            var limit = dashlet.config.Get<int>("limit", 5);
            var detailedView = dashlet.config.JsonParsed<bool>("showBody",false);
            return View(new RssEditModel() { Url = url, Limit = limit, ShowBody = detailedView });
        }

        [HttpPost]
        [ValidateInput(true)]
        public ActionResult Save(string id, RssEditModel model)
        {
            var dashlet = JDashManager.Provider.GetDashlet(id);
            dashlet.LoadProperties(model.DashletProperties);
            dashlet.config["url"] = model.Url;
            dashlet.config["limit"] = model.Limit;
            dashlet.config["showBody"] = model.ShowBody;
            JDashManager.Provider.SaveDashlet(dashlet);
            return new EmptyResult();
        }

        public  List<RssViewModel> GetRssFeed(string rssUrl,int limit)
        {
            XDocument feedXml = XDocument.Load(rssUrl);
            var feeds = (from feed in feedXml.Descendants("item")
                        select new RssViewModel
                        {
                            Title = feed.Element("title").Value,
                            Link = feed.Element("link").Value,
                            Description = feed.Element("description").Value
                        }).Take(limit).ToList();
            return feeds;
        }

    }
}
