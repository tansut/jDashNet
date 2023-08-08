using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Web.Mvc;

namespace JDash.Mvc
{
    public class DashletModulesContainer: DomElement<DashletModulesContainer>
    {

        protected override void RenderCss(TagBuilder tb)
        {
            base.RenderCss(tb);
            tb.AddCssClass("dndArea");
        }

        public DashletModulesContainer(HtmlHelper helper)
            : base(helper)
        {

        }
    }
}
