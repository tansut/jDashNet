using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Text;
using System.Web.Mvc;

namespace JDash.Mvc
{
    public class ContentFor: IDisposable 
    {
        private HtmlHelper helper;
        private TextWriter writer;
        private TagBuilder source;

        public ContentFor(HtmlHelper helper, TagBuilder tb)
        {
            this.helper = helper;
            this.source = tb;
            var str = tb.ToString(TagRenderMode.SelfClosing);
            str.Remove(str.Length - 2, 1);
            helper.ViewContext.Writer.Write(str);
        }

        public void Dispose()
        {
            this.helper.ViewContext.Writer.Write(source.ToString(TagRenderMode.EndTag));
        }
    }
}
