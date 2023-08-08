using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using JDash.Helpers;
using Newtonsoft.Json;

namespace JDash.Models
{
    public class Config: Dictionary<string, dynamic>
    {
        public Dictionary<string, dynamic> Serialized()
        {
            var serialized = Serialization.JsonStringify(this);
            var obj = JsonConvert.DeserializeObject<Dictionary<string, dynamic>>(serialized);

            var res = new Dictionary<string, dynamic>();
            foreach (var item in obj)
            {
                res.Add(item.Key, item.Value);
            }
            return res;
            
        }

        public string Serialized(string key)
        {
            var val = this[key];
            var serialized = Serialization.JsonStringify(val);
            //return Serialization.JsonParse(serialized);
            return serialized;
        }

        public T JsonParsed<T>(string key)
        {
            var val = this[key];
            var serialized = Serialization.JsonStringify(val);
            return Serialization.JsonParse<T>(serialized);
        }

        public T JsonParsed<T>(string key, T defaultVal)
        {
            dynamic val;
            if (this.TryGetValue(key, out val))
                return JsonParsed<T>(key);
            else return defaultVal;
        }

        public T Get<T>(string key, T defaultValue)
        {
            dynamic val;
            if (this.TryGetValue(key, out val))
                return (T)val;
            else return defaultValue;
        }

        public T Get<T>(string key)
        {
            dynamic val = this[key];
            return Convert.ChangeType(val, typeof(T));
        }

        public T GetObject<T>(string key)
        {
            dynamic val = this[key];
            return Serialization.JsonParse<T>((string)val);
        }

        public T GetObject<T>(string key, T defaultValue)
        {
            dynamic val;
            if (this.TryGetValue(key, out val))
            {
                return Serialization.JsonParse<T>((string)val);
            }
            else return defaultValue;
        }

        public void SetObject(string key, object obj)
        {
            var ser = Serialization.JsonStringify(obj);
            this[key] = ser;
        }

    }
}
