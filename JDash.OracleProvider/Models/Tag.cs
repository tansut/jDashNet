using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using JDash.Models;
using JDash.Extensions;

namespace JDash.OracleProvider.Models
{
    public partial class TAG
    {
        public TAG AssignFrom(TagModel model)
        {
            
            this.ID = model.id.ToInt();
            this.TAGNAME = model.name;
            return this;
        }

        public void AssignTo(TagModel model)
        {
            model.id = this.ID.ToString();
            model.name = this.TAGNAME;
        }
    }
}
