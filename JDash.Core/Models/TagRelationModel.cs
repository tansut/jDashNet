using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace JDash.Models
{
    public class TagRelationModel
    {
        public string id { get; set; }
        public string tagId { get; set; }
        public string controllerId { get; set; }
        public string controller { get; set; }
    }
}
