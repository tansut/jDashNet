using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web;

namespace JDash.MvcDemo.Areas.Dashlets.Models
{
    public class RssEditModel
    {
        [JsonIgnore]
        public string DashletProperties { get; set; }

        [Display(Name = "Url")]
        [Required]
        public string Url { get; set; }
        
        [Display(Name = "Limit Feeds")]
        [Required]        
        public int Limit { get; set; }

        public bool ShowBody { get; set; }
    }

    public class RssViewModel
    {
        public string Link { get; set; }

        public string Title { get; set; }

        public string Description { get; set; }

        public string Image { get; set; }

    }
}