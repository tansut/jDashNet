using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace JDash.MvcDemo.Areas.Dashlets.Models
{
    [Serializable]
    public class ChartJSModel
    {
        [JsonIgnore]
        public string DashletProperties { get; set; }

        [Required]
        [Display(Name="Chart Type")]
        public string ChartType { get; set; }

        [Required]
        [Display(Name = "Chart Data")]
        public string ChartData { get; set; }

        [JsonIgnore]
        public IEnumerable<SelectListItem> ChartTypes
        {
            get
            {
                var dict = new List<SelectListItem>(5);
                dict.Add(new SelectListItem() { Value = "Line", Text = "Line Chart" });
                dict.Add(new SelectListItem() { Value = "Bar", Text = "Bar Chart" });
                dict.Add(new SelectListItem() { Value = "Pie", Text = "Pie Chart" });
                dict.Add(new SelectListItem() { Value = "Radar", Text = "Radar Chart" });
                dict.Add(new SelectListItem() { Value = "PolarArea", Text = "PolarArea Chart" });
                dict.Add(new SelectListItem() { Value = "Doughnut", Text = "Doughnut Chart" });
                return dict;
            }
        }
    }
}