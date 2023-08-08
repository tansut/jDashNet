using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using JDash.Query;

namespace JDash.Webform.Management.Core.Controls.UI
{

    public enum PagerPosition
    {
        left,
        centered,
        right
    }

    public enum PagerSize
    {
        standart,
        mini,
        small,
        large
    }

    public class JDashPagerChangeEventArgs : EventArgs
    {
        public Paging ListingArgs { get; set; }
        public JDashPagerChangeEventArgs(Paging args)
        {
            this.ListingArgs = args;
        }
    }
    public class JDashPager : Panel
    {

        public delegate void JDashPagerChangeEventHandler(object sender, JDashPagerChangeEventArgs e);

        public event JDashPagerChangeEventHandler Change = null;

        private string backButtonText = "«";
        public string BackButtonText
        {
            get { return backButtonText; }
            set { backButtonText = value; }
        }

        private string forwardButtonText = "»";
        public string ForwardButtonText
        {
            get { return forwardButtonText; }
            set { forwardButtonText = value; }
        }

        public int Current
        {
            get
            {
                if (ViewState[string.Format("{0}_Current", this.ID)] != null)
                    return (int)ViewState[string.Format("{0}_Current", this.ID)];
                else return 1;
            }
            set { ViewState[string.Format("{0}_Current", this.ID)] = value; }
        }


        public int DisplayCount { get; set; }


        public int ItemCount
        {
            get
            {
                if (ViewState[string.Format("{0}_ItemCount", this.ID)] != null)
                    return (int)ViewState[string.Format("{0}_ItemCount", this.ID)];
                else return 0;
            }
            set { ViewState[string.Format("{0}_ItemCount", this.ID)] = value; }
        }


        public int PagerCount { get; set; }
        public PagerPosition Position { get; set; }
        public PagerSize Size { get; set; }

        private Button postBackButton = null;

        protected override void OnInit(EventArgs e)
        {
            base.OnInit(e);
            this.Attributes.Add("class", GetPagerCssClass());
            Controls.Add(GetPostBackButton());
        }

        private HtmlGenericControl GetPagerControl()
        {
            HtmlGenericControl list = new HtmlGenericControl("ul");
            var pageCount = Math.Ceiling((double)ItemCount / (double)DisplayCount);
            var defaultPagerCount = PagerCount == 0 ? (pageCount < 5 ? pageCount : 5) : (pageCount < PagerCount ? pageCount : PagerCount);
            var pageIndex = Math.Ceiling((double)Current / (double)defaultPagerCount);
            if (pageIndex == 0) pageIndex = 1;
            var start = 1 + (int)((pageIndex - 1) * defaultPagerCount);
            var end = pageIndex * defaultPagerCount;
            if (end > pageCount) end = pageCount;
            list.Controls.Add(GetListItem(BackButtonText, Current == 1));
            for (int i = start; i <= end; i++)
            {
                list.Controls.Add(GetListItem(i.ToString(), Current == i));
            }
            list.Controls.Add(GetListItem(ForwardButtonText, Current == pageCount));
            return list;
        }

        private string GetPagerCssClass()
        {
            StringBuilder sb = new StringBuilder();
            sb.Append("pagination");
            switch (Size)
            {
                case PagerSize.mini:
                    sb.Append(" pagination-mini");
                    break;
                case PagerSize.small:
                    sb.Append(" pagination-small");
                    break;
                case PagerSize.large:
                    sb.Append(" pagination-large");
                    break;
                default:
                    break;
            }
            switch (Position)
            {
                case PagerPosition.centered:
                    sb.Append(" pagination-centered");
                    break;
                case PagerPosition.right:
                    sb.Append(" pagination-right");
                    break;
                default:
                    break;
            }
            return sb.ToString();
        }

        private HtmlGenericControl GetListItem(string value, bool disabled = false)
        {
            HtmlGenericControl li = new HtmlGenericControl("li");
            if (disabled)
            {
                li.Attributes.Add("class", "disabled");
            }
            else
            {
                li.Attributes.Add("onclick", string.Format("__doPostBack('{0}', '{1}')", postBackButton.ClientID, value));
                li.Attributes.Add("style", "cursor:pointer;");
            }
            HtmlGenericControl a = new HtmlGenericControl("a");
            a.InnerText = value;
            li.Controls.Add(a);
            return li;
        }

        private Button GetPostBackButton()
        {
            postBackButton = new Button();
            postBackButton.Attributes.Add("style", "display:none");
            postBackButton.Click += PostBackButton_Click;
            Page.RegisterRequiresRaiseEvent(postBackButton);
            return postBackButton;
        }
        private void ReDraw()
        {
            ClearControls();
            Controls.Add(GetPagerControl());
        }

        private void ClearControls()
        {
            int i = 0, count = this.Controls.Count;

            while (i < count)
            {
                if (this.Controls[i].GetType() != typeof(Button)) this.Controls.RemoveAt(i);
                i++;
            }
        }
        protected override void CreateChildControls()
        {
            base.CreateChildControls();
            ReDraw();

        }

        public Paging GetCurrentListingArgs()
        {
            var paging = new Paging()
             {
                 skip = (Current - 1) * DisplayCount,
                 take = DisplayCount
             };
            return paging;
        }

        public void PostBackButton_Click(object sender, EventArgs e)
        {
            string parameter = Page.Request["__EVENTARGUMENT"];
            int value;
            if (int.TryParse(parameter, out value))
            {
                Current = value;
            }
            else
            {
                if (parameter == BackButtonText)
                {
                    Current--;
                }
                else if (parameter == ForwardButtonText)
                {
                    Current++;
                }
                ReDraw();
            }
            if (Change != null) Change(this, new JDashPagerChangeEventArgs(GetCurrentListingArgs()));
        }
    }
}
