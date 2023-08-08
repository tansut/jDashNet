using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Web.Mvc;

namespace JDash.Mvc
{
    public class ThemeChangeLink: DomElement<ThemeChangeLink>
    {
        private string theme = "";
        private string style = "";
        private bool persist = true;


        public ThemeChangeLink Theme(string theme)
        {
            this.theme = theme;
            return this;
        }

        public ThemeChangeLink Style(string style)
        {
            this.style = style;
            return this;
        }


        public ThemeChangeLink Persist(bool persist)
        {
            this.persist = persist;
            return this;
        }



        protected override void RenderAttributes(TagBuilder tb)
        {
            base.RenderAttributes(tb);
            tb.Attributes["onclick"] = string.Format("jdash.ui.ThemeManager.select('{0}', '{1}', null, {2});", theme, style, persist.ToString().ToLowerInvariant());
        }

        public ThemeChangeLink(HtmlHelper helper)
            : base(helper)
        {
            this.tag = "a";
        }
    }
}
