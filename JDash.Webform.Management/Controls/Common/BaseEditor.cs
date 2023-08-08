using JDash.Models;
using Newtonsoft.Json;
using Newtonsoft.Json.Converters;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Script.Serialization;

namespace JDash.Webform.Management.Controls.Common
{
    public partial class BaseEditor : System.Web.UI.UserControl
    {
        public virtual event onSaveDelgete onSave = null;
        public delegate void onSaveDelgete();
      

        private JavaScriptSerializer serializer;
        public JavaScriptSerializer Serializer
        {
            get
            {
                if (serializer == null)
                    serializer = new JavaScriptSerializer();
                return serializer;
            }
            set { serializer = value; }
        }

        public  virtual  void Show(){}

        public  virtual  void Hide(){}

        public virtual void Clear() { }      



        public string getPrettyJson(object input)
        {
            if (input == null) return null;


            if (input.GetType()==typeof(Config))
                return intend(JsonConvert.SerializeObject(input, new KeyValuePairConverter()));
            return intend(Serializer.Serialize(input));
        }

        private string intend(string input)
        {
            return input.Replace(",", "," + Environment.NewLine).Replace("{", "{" + Environment.NewLine).Replace("}", "}" + Environment.NewLine);
        }
    }
}