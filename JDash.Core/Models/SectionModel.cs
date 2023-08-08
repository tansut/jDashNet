using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace JDash.Models
{
    public class SectionModel : IDomModel
    {
        public SectionModel()
        {
            this.zones = new Dictionary<string, ZoneModel>();
        }

        public Dictionary<string, ZoneModel> zones { get; set; }
        public string title { get; set; }
        public Dictionary<string, string> style { get; set; }
        public string cls { get; set; }
    }
}