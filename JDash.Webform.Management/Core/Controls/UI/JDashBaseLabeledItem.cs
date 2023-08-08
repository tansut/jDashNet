using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;

namespace JDash.Webform.Management.Core.Controls.UI
{
    public partial class JDashBaseLabeledItem: System.Web.UI.UserControl
    {

        public virtual string  Value { get; set; }
        
        private string title;

        public string Title
        {
            get { return string.IsNullOrEmpty(title)?string.Empty:title; }
            set { title = value; }
        }
        private string info;

        public string Info
        {
            get { return string.IsNullOrEmpty(info) ? string.Empty : info; }
            set { info = value; }
        }

        public JDashBaseLabeledItem()
        {
            ClientIDMode = ClientIDMode.Static;
        }

        private string containerID;

        public virtual string ContainerID
        {
            get { return containerID; }
            set {
                containerID = value; 
            }
        }
        private bool hide;

        public bool Hide
        {
            get { return hide; }
            set { hide = value; }
        }
    }
}