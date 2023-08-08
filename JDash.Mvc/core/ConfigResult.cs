using JDash.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace JDash.Mvc
{
    public class ConfigResult: JsonNetResult
    {
        public ConfigResult(Config config)
            : base(new { config = config })
        {

        }
    }
}
