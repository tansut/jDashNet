using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using JDash.Helpers;
using Newtonsoft.Json.Linq;

namespace JDash.Models
{
    public class LayoutModel : IDomModel
    {
        public string type { get; set; }
        public Dictionary<string, SectionModel> sections { get; set; }
        public string dragOpacity { get; set; }
        //public string style { get; set; }
        //public string cls { get; set; }
        //public string attr { get; set; }
        public Boolean addFirst { get; set; }

        public static LayoutModel DefaultGrid
        {
            get
            {
                var instance = new LayoutModel()
                {
                    type = Grid,
                    addFirst = true,
                    sections = GetDefaultSections()
                };
                return instance;
            }
        }

        public static LayoutModel DefaultAbsolute
        {
            get
            {
                var instance = new LayoutModel()
                {
                    type = Absolute
                };
                return instance;
            }
        }

        public static readonly string Grid = "grid";
        public static readonly string Absolute = "absolute";

        public static LayoutModel GetPredefinedGridLayout(string id)
        {
            var instance = new LayoutModel()
            {
                type = "grid",
                addFirst = true,
                sections = PredefinedLayouts[id].sections
            };
            return instance;
        }

        public static Dictionary<string, LayoutModel> PredefinedLayouts
        {
            get
            {
                // tüm hepsinin tipini grid'e çektim yoksa çalışmıyorlardı. 
                var s = "{\"1\":{\"type\":\"grid\",\"sections\":{\"section1\":{\"zones\":{\"zone1\":{\"title\":null,\"style\":null,\"cls\":null,\"flex\":null}},\"title\":null,\"style\":null,\"cls\":null}},\"dragOpacity\":null,\"addFirst\":false},\"2\":{\"type\":\"grid\",\"sections\":{\"section1\":{\"zones\":{\"zone1\":{\"title\":null,\"style\":null,\"cls\":null,\"flex\":null},\"zone2\":{\"title\":null,\"style\":null,\"cls\":null,\"flex\":null}},\"title\":null,\"style\":null,\"cls\":null}},\"dragOpacity\":null,\"addFirst\":false},\"3\":{\"type\":\"grid\",\"sections\":{\"section1\":{\"zones\":{\"zone1\":{\"title\":null,\"style\":null,\"cls\":null,\"flex\":null},\"zone2\":{\"title\":null,\"style\":null,\"cls\":null,\"flex\":null},\"zone3\":{\"title\":null,\"style\":null,\"cls\":null,\"flex\":null}},\"title\":null,\"style\":null,\"cls\":null}},\"dragOpacity\":null,\"addFirst\":false},\"4\":{\"type\":\"grid\",\"sections\":{\"section1\":{\"zones\":{\"zone1\":{\"title\":null,\"style\":null,\"cls\":null,\"flex\":2},\"zone2\":{\"title\":null,\"style\":null,\"cls\":null,\"flex\":null}},\"title\":null,\"style\":null,\"cls\":null}},\"dragOpacity\":null,\"addFirst\":false},\"5\":{\"type\":\"grid\",\"sections\":{\"section1\":{\"zones\":{\"zone1\":{\"title\":null,\"style\":null,\"cls\":null,\"flex\":null},\"zone2\":{\"title\":null,\"style\":null,\"cls\":null,\"flex\":2}},\"title\":null,\"style\":null,\"cls\":null}},\"dragOpacity\":null,\"addFirst\":false},\"6\":{\"type\":\"grid\",\"sections\":{\"section1\":{\"zones\":{\"zone1\":{\"title\":null,\"style\":null,\"cls\":null,\"flex\":null},\"zone2\":{\"title\":null,\"style\":null,\"cls\":null,\"flex\":null},\"zone3\":{\"title\":null,\"style\":null,\"cls\":null,\"flex\":null},\"zone4\":{\"title\":null,\"style\":null,\"cls\":null,\"flex\":null}},\"title\":null,\"style\":null,\"cls\":null}},\"dragOpacity\":null,\"addFirst\":false},\"7\":{\"type\":\"grid\",\"sections\":{\"section1\":{\"zones\":{\"zone1\":{\"title\":null,\"style\":null,\"cls\":null,\"flex\":null}},\"title\":null,\"style\":null,\"cls\":null},\"section2\":{\"zones\":{\"zone1\":{\"title\":null,\"style\":null,\"cls\":null,\"flex\":null},\"zone2\":{\"title\":null,\"style\":null,\"cls\":null,\"flex\":null}},\"title\":null,\"style\":null,\"cls\":null}},\"dragOpacity\":null,\"addFirst\":false},\"8\":{\"type\":\"grid\",\"sections\":{\"section1\":{\"zones\":{\"zone1\":{\"title\":null,\"style\":null,\"cls\":null,\"flex\":null}},\"title\":null,\"style\":null,\"cls\":null},\"section2\":{\"zones\":{\"zone1\":{\"title\":null,\"style\":null,\"cls\":null,\"flex\":null},\"zone2\":{\"title\":null,\"style\":null,\"cls\":null,\"flex\":null},\"zone3\":{\"title\":null,\"style\":null,\"cls\":null,\"flex\":null}},\"title\":null,\"style\":null,\"cls\":null}},\"dragOpacity\":null,\"addFirst\":false},\"9\":{\"type\":\"grid\",\"sections\":{\"section1\":{\"zones\":{\"zone1\":{\"title\":null,\"style\":null,\"cls\":null,\"flex\":null}},\"title\":null,\"style\":null,\"cls\":null},\"section2\":{\"zones\":{\"zone1\":{\"title\":null,\"style\":null,\"cls\":null,\"flex\":2},\"zone2\":{\"title\":null,\"style\":null,\"cls\":null,\"flex\":null}},\"title\":null,\"style\":null,\"cls\":null}},\"dragOpacity\":null,\"addFirst\":false},\"10\":{\"type\":\"grid\",\"sections\":{\"section1\":{\"zones\":{\"zone1\":{\"title\":null,\"style\":null,\"cls\":null,\"flex\":null}},\"title\":null,\"style\":null,\"cls\":null},\"section2\":{\"zones\":{\"zone1\":{\"title\":null,\"style\":null,\"cls\":null,\"flex\":null},\"zone2\":{\"title\":null,\"style\":null,\"cls\":null,\"flex\":2}},\"title\":null,\"style\":null,\"cls\":null}},\"dragOpacity\":null,\"addFirst\":false},\"11\":{\"type\":\"grid\",\"sections\":{\"section1\":{\"zones\":{\"zone1\":{\"title\":null,\"style\":null,\"cls\":null,\"flex\":null}},\"title\":null,\"style\":null,\"cls\":null},\"section2\":{\"zones\":{\"zone1\":{\"title\":null,\"style\":null,\"cls\":null,\"flex\":null},\"zone2\":{\"title\":null,\"style\":null,\"cls\":null,\"flex\":null},\"zone3\":{\"title\":null,\"style\":null,\"cls\":null,\"flex\":null},\"zone4\":{\"title\":null,\"style\":null,\"cls\":null,\"flex\":null}},\"title\":null,\"style\":null,\"cls\":null}},\"dragOpacity\":null,\"addFirst\":false},\"12\":{\"type\":\"grid\",\"sections\":{\"section1\":{\"zones\":{\"zone1\":{\"title\":null,\"style\":null,\"cls\":null,\"flex\":null},\"zone2\":{\"title\":null,\"style\":null,\"cls\":null,\"flex\":null}},\"title\":null,\"style\":null,\"cls\":null},\"section2\":{\"zones\":{\"zone1\":{\"title\":null,\"style\":null,\"cls\":null,\"flex\":null}},\"title\":null,\"style\":null,\"cls\":null}},\"dragOpacity\":null,\"addFirst\":false},\"13\":{\"type\":\"grid\",\"sections\":{\"section1\":{\"zones\":{\"zone1\":{\"title\":null,\"style\":null,\"cls\":null,\"flex\":null},\"zone2\":{\"title\":null,\"style\":null,\"cls\":null,\"flex\":null},\"zone3\":{\"title\":null,\"style\":null,\"cls\":null,\"flex\":null}},\"title\":null,\"style\":null,\"cls\":null},\"section2\":{\"zones\":{\"zone1\":{\"title\":null,\"style\":null,\"cls\":null,\"flex\":null}},\"title\":null,\"style\":null,\"cls\":null}},\"dragOpacity\":null,\"addFirst\":false},\"14\":{\"type\":\"grid\",\"sections\":{\"section1\":{\"zones\":{\"zone1\":{\"title\":null,\"style\":null,\"cls\":null,\"flex\":2},\"zone2\":{\"title\":null,\"style\":null,\"cls\":null,\"flex\":null}},\"title\":null,\"style\":null,\"cls\":null},\"section2\":{\"zones\":{\"zone1\":{\"title\":null,\"style\":null,\"cls\":null,\"flex\":null}},\"title\":null,\"style\":null,\"cls\":null}},\"dragOpacity\":null,\"addFirst\":false},\"15\":{\"type\":\"grid\",\"sections\":{\"section1\":{\"zones\":{\"zone1\":{\"title\":null,\"style\":null,\"cls\":null,\"flex\":null},\"zone2\":{\"title\":null,\"style\":null,\"cls\":null,\"flex\":2}},\"title\":null,\"style\":null,\"cls\":null},\"section2\":{\"zones\":{\"zone1\":{\"title\":null,\"style\":null,\"cls\":null,\"flex\":null}},\"title\":null,\"style\":null,\"cls\":null}},\"dragOpacity\":null,\"addFirst\":false},\"16\":{\"type\":\"grid\",\"sections\":{\"section1\":{\"zones\":{\"zone1\":{\"title\":null,\"style\":null,\"cls\":null,\"flex\":null},\"zone2\":{\"title\":null,\"style\":null,\"cls\":null,\"flex\":null},\"zone3\":{\"title\":null,\"style\":null,\"cls\":null,\"flex\":null},\"zone4\":{\"title\":null,\"style\":null,\"cls\":null,\"flex\":null}},\"title\":null,\"style\":null,\"cls\":null},\"section2\":{\"zones\":{\"zone1\":{\"title\":null,\"style\":null,\"cls\":null,\"flex\":null}},\"title\":null,\"style\":null,\"cls\":null}},\"dragOpacity\":null,\"addFirst\":false},\"17\":{\"type\":\"grid\",\"sections\":{\"section1\":{\"zones\":{\"zone1\":{\"title\":null,\"style\":null,\"cls\":null,\"flex\":null}},\"title\":null,\"style\":null,\"cls\":null},\"section2\":{\"zones\":{\"zone1\":{\"title\":null,\"style\":null,\"cls\":null,\"flex\":null},\"zone2\":{\"title\":null,\"style\":null,\"cls\":null,\"flex\":null}},\"title\":null,\"style\":null,\"cls\":null},\"section3\":{\"zones\":{\"zone1\":{\"title\":null,\"style\":null,\"cls\":null,\"flex\":null}},\"title\":null,\"style\":null,\"cls\":null}},\"dragOpacity\":null,\"addFirst\":false},\"18\":{\"type\":\"grid\",\"sections\":{\"section1\":{\"zones\":{\"zone1\":{\"title\":null,\"style\":null,\"cls\":null,\"flex\":null}},\"title\":null,\"style\":null,\"cls\":null},\"section2\":{\"zones\":{\"zone1\":{\"title\":null,\"style\":null,\"cls\":null,\"flex\":null},\"zone2\":{\"title\":null,\"style\":null,\"cls\":null,\"flex\":null},\"zone3\":{\"title\":null,\"style\":null,\"cls\":null,\"flex\":null}},\"title\":null,\"style\":null,\"cls\":null},\"section3\":{\"zones\":{\"zone1\":{\"title\":null,\"style\":null,\"cls\":null,\"flex\":null}},\"title\":null,\"style\":null,\"cls\":null}},\"dragOpacity\":null,\"addFirst\":false},\"19\":{\"type\":\"grid\",\"sections\":{\"section1\":{\"zones\":{\"zone1\":{\"title\":null,\"style\":null,\"cls\":null,\"flex\":null}},\"title\":null,\"style\":null,\"cls\":null},\"section2\":{\"zones\":{\"zone1\":{\"title\":null,\"style\":null,\"cls\":null,\"flex\":2},\"zone2\":{\"title\":null,\"style\":null,\"cls\":null,\"flex\":null}},\"title\":null,\"style\":null,\"cls\":null},\"section3\":{\"zones\":{\"zone1\":{\"title\":null,\"style\":null,\"cls\":null,\"flex\":null}},\"title\":null,\"style\":null,\"cls\":null}},\"dragOpacity\":null,\"addFirst\":false},\"20\":{\"type\":\"grid\",\"sections\":{\"section1\":{\"zones\":{\"zone1\":{\"title\":null,\"style\":null,\"cls\":null,\"flex\":null}},\"title\":null,\"style\":null,\"cls\":null},\"section2\":{\"zones\":{\"zone1\":{\"title\":null,\"style\":null,\"cls\":null,\"flex\":null},\"zone2\":{\"title\":null,\"style\":null,\"cls\":null,\"flex\":2}},\"title\":null,\"style\":null,\"cls\":null},\"section3\":{\"zones\":{\"zone1\":{\"title\":null,\"style\":null,\"cls\":null,\"flex\":null}},\"title\":null,\"style\":null,\"cls\":null}},\"dragOpacity\":null,\"addFirst\":false},\"21\":{\"type\":\"grid\",\"sections\":{\"section1\":{\"zones\":{\"zone1\":{\"title\":null,\"style\":null,\"cls\":null,\"flex\":null}},\"title\":null,\"style\":null,\"cls\":null},\"section2\":{\"zones\":{\"zone1\":{\"title\":null,\"style\":null,\"cls\":null,\"flex\":null},\"zone2\":{\"title\":null,\"style\":null,\"cls\":null,\"flex\":null},\"zone3\":{\"title\":null,\"style\":null,\"cls\":null,\"flex\":null},\"zone4\":{\"title\":null,\"style\":null,\"cls\":null,\"flex\":null}},\"title\":null,\"style\":null,\"cls\":null},\"section3\":{\"zones\":{\"zone1\":{\"title\":null,\"style\":null,\"cls\":null,\"flex\":null}},\"title\":null,\"style\":null,\"cls\":null}},\"dragOpacity\":null,\"addFirst\":false}}";
                var result = Serialization.JsonParse<Dictionary<string, LayoutModel>>(s);
                return result;
            }
        }

        private static Dictionary<string, SectionModel> GetDefaultSections()
        {
            var sections = new Dictionary<string, SectionModel>();
            var zones = new Dictionary<string, ZoneModel>();
            zones.Add("zone1", new ZoneModel());
            zones.Add("zone2", new ZoneModel());
            zones.Add("zone3", new ZoneModel());
            sections.Add("section1", new SectionModel() { zones = zones });
            return sections;
        }

        //public static LayoutModel Parse(string value)
        //{
        //}
    }
}
