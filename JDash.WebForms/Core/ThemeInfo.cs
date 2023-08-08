using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace JDash.WebForms
{
    /// <summary>
    /// Represents a theme style.
    /// </summary>
    public class ThemeStyleInfo
    {
        
        public string title { get; private set; }
        public string color { get; private set; }

        public ThemeStyleInfo(string title, string color)
        {
            this.title = title;
            this.color = color;
        }
    }

    /// <summary>
    /// Represents a JDash.Net theme.
    /// </summary>
    public class ThemeInfo
    {
        public string Name { get; private set; }
        public string CssPath { get; private set; }
        public string DefaultStyle { get; set; }
        public Dictionary<string, ThemeStyleInfo> Styles { get; internal set; }

        public ThemeInfo(string name, string cssPath)
        {
            this.Name = name;
            this.CssPath = cssPath;
            Styles = new Dictionary<string, ThemeStyleInfo>();
            DefaultStyle = null;
        }
    }
}
