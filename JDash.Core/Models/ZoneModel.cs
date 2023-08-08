using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Linq;
using System.Web;

namespace JDash.Models
{
    public class ZoneModel : IDomModel
    {
        public string title { get; set; }
        public Dictionary<string, string> style { get; set; }
        public string cls { get; set; }
        public int? flex { get; set; }
    }
}