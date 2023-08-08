using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web;

namespace JDash.MvcDemo.Areas.Dashlets.Models
{
    public class WeatherBoardModel
    {
        [JsonIgnore]
        public string DashletProperties { get; set; }

        [Display(Name = "City")]
        public string City { get; set; }

        [Display(Name = "Use current city")]
        public bool IsCurrentCity { get; set; }
    }
}