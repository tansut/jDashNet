using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace JDash.Mvc
{
    public class JDashBuilder
    {
        private System.Web.Mvc.HtmlHelper helper;

        public JDashBuilder(System.Web.Mvc.HtmlHelper helper)
        {
            this.helper = helper;
        }

        public DashboardView DashboardView()
        {
            return new DashboardView(this.helper);
        }


        public DashletCreateLink DashletCreateLink()
        {
            return new DashletCreateLink(this.helper);
        }

        public DashboardLoadLink DashboardLoadLink()
        {
            return new DashboardLoadLink(this.helper);
        }

        public DashletTitleEditor DashletTitleEditor()
        {
            return new DashletTitleEditor(this.helper);
        }

        public DashletStylesList DashletStylesList()
        {
            return new DashletStylesList(this.helper);
        }

        public DashletCssEditor DashletCssEditor()
        {
            return new DashletCssEditor(this.helper);
        }

        public DashboardTitle DashboardTitle()
        {
            return new DashboardTitle(this.helper);
        }

        public DashletModulesContainer DashletModulesContainer()
        {
            return new DashletModulesContainer(this.helper);
        }

        public ThemeStylesList ThemeStylesList()
        {
            return new ThemeStylesList(this.helper);
        }

        public ThemeChangeLink ThemeChangeLink()
        {
            return new ThemeChangeLink(this.helper);
        }

        public ResourceManager ResourceManager()
        {
            var instance = JDash.Mvc.ResourceManager.GetInstance();
            if (instance == null)
                instance = new ResourceManager(this.helper);
            return instance;
        }

    }
}
