using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Web.UI;

namespace JDash.WebForms
{
    internal interface IJPostBackDataHandler : IPostBackDataHandler
    {
        bool HasLoadPostData { get; set; }
    }
}
