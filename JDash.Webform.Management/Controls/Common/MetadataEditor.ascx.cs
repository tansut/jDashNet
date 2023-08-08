using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using JDash.Models;
using JDash.Webform.Management.Core.Controls;

namespace JDash.Webform.Management.Controls.Common
{
    public partial class MetadataEditor : DataEditor<MetadataModel>
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        public override void Bind(MetadataModel entity)
        {
            ctlDescription.Text = entity.description;
            ctlGroup.Text = entity.group;

            TagEditor.Bind(entity.tags);
        }

        public override MetadataModel Retrieve(MetadataModel entity)
        {
            entity.description = ctlDescription.Text.Trim();
            entity.group = ctlGroup.Text.Trim();
            entity.tags = TagEditor.Retrieve(null);
            return entity;   
        }

        public override void Clear()
        {
            throw new NotImplementedException();
        }
    }
}