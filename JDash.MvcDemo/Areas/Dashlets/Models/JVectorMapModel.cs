using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace JDash.MvcDemo.Areas.Dashlets.Models
{
    public class JVectorMapModel
    {

        [Required]
        [Display(Name = "Map")]
        public string MapId { get; set; }

        [JsonIgnore]
        public IEnumerable<SelectListItem> MapTypes
        {
            get
            {
                var dict = new List<SelectListItem>(10);
                dict.Add(new SelectListItem() { Value = "world-mill-en", Text = "World" });
                dict.Add(new SelectListItem() { Value = "us-aea-en", Text = "USA" });
                dict.Add(new SelectListItem() { Value = "europe-mill-en", Text = "Europe" });
                dict.Add(new SelectListItem() { Value = "au_mill_en", Text = "Australia" });
                dict.Add(new SelectListItem() { Value = "ca_lcc_en", Text = "Canada" });
                dict.Add(new SelectListItem() { Value = "fr_mill_en", Text = "France" });
                dict.Add(new SelectListItem() { Value = "de_mill_en", Text = "Germany" });
                dict.Add(new SelectListItem() { Value = "tr_mill_en", Text = "Turkey" });
                dict.Add(new SelectListItem() { Value = "uk_mill_en", Text = "United Kingdom" });
                return dict;
            }
        }
    }
}