using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Text;
using JDash.Helpers;

namespace JDash.WebForms.Utils
{
    public static class SerializationUtils
    {
        public static string Serialize(object obj)
        {
            return Serialization.JsonStringify(obj);

        }

        public static T Deserialize<T>(string value)
        {
            return Serialization.JsonParse<T>(value);
        }
    }
}
