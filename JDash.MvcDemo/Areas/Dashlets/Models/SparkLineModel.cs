using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web;

namespace JDash.MvcDemo.Areas.Dashlets.Models
{
    public class SparkLineModel
    {
        [JsonIgnore]
        public string DashletProperties { get; set; }

        [Display(Name="Type")]
        public string Type { get; set; }

        [Display(Name="Value")]
        public string Value { get; set; }
    }
}