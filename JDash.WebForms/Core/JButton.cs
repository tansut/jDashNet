using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Linq;
using System.Reflection;
using System.Text;
using System.Web.UI;
using JDash.WebForms.Utils;

namespace JDash.WebForms
{
    [ToolboxItem(false)]
    internal class JButton : JControl, IPostBackEventHandler
    {
        private static readonly object EventClick;

        [ClientProperty("label")]
        public string Text
        {
            get
            {
                return ViewState["Text"] as string;
            }

            set
            {
                ViewState["Text"] = value;
            }
        }

        protected internal override string GetClientConstructor()
        {
            getClientProperties(this.ClientProperties);
            return string.Format(InstanceFuncTemplate, SerializationUtils.Serialize(ClientProperties), this.ClientID);       
        }

        protected override string InstanceFuncTemplate
        {
            get
            {
                return "jdash.createButton({0}, '{1}');"; 
            }
        }

        public event EventHandler Click
        {
            add
            {
                base.Events.AddHandler(EventClick, value);
            }
            remove
            {
                base.Events.RemoveHandler(EventClick, value);
            }
        }



        protected virtual void OnClick(EventArgs e)
        {
            EventHandler handler = (EventHandler)base.Events[EventClick];
            if (handler != null)
            {
                handler(this, e);
            }
        }


        static JButton()
        {
            EventClick = new object();
        }


        public void RaisePostBackEvent(string eventArgument)
        {
            this.OnClick(EventArgs.Empty);
        }


    }
}
