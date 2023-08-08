using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace JDash.Models
{
    [Flags]
    public enum ActionModel
    {
        create = 0,
        share = 1,
        modify = 2
    }
}
