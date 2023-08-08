using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using JDash.Models;
using JDash.Extensions;

namespace JDash.OracleProvider.Models
{
    public partial class TAGRELATION
    {
        public TAGRELATION AssignFrom(TagRelationModel model)
        {
            this.ID = model.id.ToInt();
            this.TAGID = model.tagId.ToInt();
            this.CONTROLID = model.controllerId.ToInt();
            this.CONTROLLER = model.controller;
            return this;
        }

        public void AssignTo(TagRelationModel model)
        {
            model.id = this.ID.ToString(); ;
            model.tagId = this.TAGID.ToString();
            model.controllerId = this.CONTROLID.ToString();
            model.controller = this.CONTROLLER;
        }
    }
}
