using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web;

namespace JDash.MvcDemo.Areas.Dashlets.Models
{
    public class HtmlModel
    {

        [JsonIgnore]
        public string DashletProperties { get; set; }


        [Required]
        [Display(Name = "Html")]
        public string Html { get; set; }
    }
}