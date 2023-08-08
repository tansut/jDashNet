using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using JDash.Models;
using JDash.Extensions;

namespace JDash.MySqlProvider.Models
{
    public partial class tag
    {
        public tag AssignFrom(TagModel model)
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
