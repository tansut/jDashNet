using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web;

namespace JDash.MvcDemo.Models
{
    public class DashboardCreationModel
    {
        public string id { get; set; }

        [Required]
        [Display(Name = "Title")]
        public string title { get; set; }

        [Display(Name = "Select a layout")]
        public string layoutId { get; set; }

        [Display(Name = "Assign dashboard to an existing logical group (optional)")]
        public string group { get; set; }

        [Display(Name = "or create a new group")]
        public bool customGroupChecked { get; set; }

        [Display(Name = "or create a new group")]
        public string customGroupName { get; set; }

        [Display(Name = "Description")]
        public string description { get; set; }

        [Display(Name = "Color")]
        public string color { get; set; }
    }
}