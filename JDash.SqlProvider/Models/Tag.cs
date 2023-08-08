using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using JDash.Models;
using JDash.Extensions;

namespace JDash.SqlProvider.Models
{
    public partial class Tag
    {
        public Tag AssignFrom(TagModel model)
        {

            this.id = model.id.ToInt();
            this.tagName = model.name;
            return this;
        }

        public void AssignTo(TagModel model)
        {
            model.id = this.id.ToString();
            model.name = this.tagName;
        }
    }
}
