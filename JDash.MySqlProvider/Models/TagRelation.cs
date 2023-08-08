using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using JDash.Models;
using JDash.Extensions;

namespace JDash.MySqlProvider.Models
{
    public partial class tagrelation
    {
        public tagrelation AssignFrom(TagRelationModel model)
        {
            this.id = model.id.ToInt();
            this.tagId = model.tagId.ToInt();
            this.controlId = model.controllerId.ToInt();
            this.controller = model.controller;
            return this;
        }

        public void AssignTo(TagRelationModel model)
        {
            model.id = this.id.ToString(); ;
            model.tagId = this.tagId.ToString();
            model.controllerId = this.controlId.ToString();
            model.controller = this.controller;
        }
    }
}
