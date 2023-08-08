using System;
using System.Collections.Generic;
using System.Linq;
using System.Reflection;
using System.Text;
using System.Web;
using System.Web.Mvc;

namespace JDash.Mvc
{
    

    public abstract class DomElement<T> where T : DomElement<T>
    {
        protected System.Web.Mvc.HtmlHelper helper;
        protected string css;
        protected string id;
        protected string tag = "div";
        protected string innerText = "";
        protected string innerHTML = "";
        protected Dictionary<string, object> attributes = null;


        protected virtual void RenderAttributes(TagBuilder tb)
        {

        }



        protected virtual void RenderContent(TagBuilder tb)
        {
            if (!string.IsNullOrEmpty(this.innerText))
                tb.SetInnerText(this.innerText);
            else if (!string.IsNullOrEmpty(innerHTML))
                tb.InnerHtml = innerHTML;
        }

        protected virtual void RenderCss(TagBuilder tb) {
            var cssVal = this.CssValue();
            if (!string.IsNullOrEmpty(cssVal))
                tb.AddCssClass(cssVal);
        }

        internal TagBuilder RenderBuilder()
        {
            var tb = new TagBuilder(this.tag);

            if (!string.IsNullOrEmpty(this.id))
                tb.MergeAttribute("id", this.id);

            tb.MergeAttributes<string, object>(this.attributes);

            RenderCss(tb);
            RenderAttributes(tb);
            RenderContent(tb);
            return tb;
        }

        public IDisposable Content()
        {
            var writer = this.helper.ViewContext.Writer;
            return new ContentFor(this.helper, this.RenderBuilder());
        }


        public virtual MvcHtmlString Render()
        {
            return new MvcHtmlString(this.RenderBuilder().ToString(TagRenderMode.Normal));
        }

        protected virtual string CssValue()
        {
            return this.css;
        }

        public virtual T Attr(string key, object value)
        {
            if (attributes == null)
                attributes = new Dictionary<string, object>();
            attributes.Add(key, value);
            return (T)this;
        }

        public virtual T InnerText(string value)
        {
            this.innerHTML = "";
            this.innerText = value;
            return (T)this;
        }

        public virtual T InnerHtml(string value)
        {
            this.innerHTML = value;
            this.innerText = "";
            return (T)this;
        }


        public virtual T Css(string css)
        {
            this.css = css;
            return (T)this;
        }

        public virtual T ID(string id)
        {
            this.id = id;
            return (T)this;
        }

        public T Tag(string css)
        {
            this.tag = css;
            return (T)this;
        }

        protected DomElement(System.Web.Mvc.HtmlHelper helper)
        {
            this.helper = helper;
        }
    }
}
