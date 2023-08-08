using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Runtime.Serialization;
using System.Text;
using System.Xml;
using Newtonsoft.Json;

namespace JDash.Helpers
{
    public static class Serialization
    {
        
        public static object JsonParse(string value, Type type)
        {            
            return JsonConvert.DeserializeObject(value, type);
        }

        public static object JsonParse(string value)
        {
            try
            {
                return JsonConvert.DeserializeObject(value);
                
            }
            catch(Exception ee)
            {
                return null;
            }
        }

        public static T JsonParse<T>(string value)
        {
            
            return JsonConvert.DeserializeObject<T>(value);
        }

        public static string JsonStringify(object val) {
            return JsonConvert.SerializeObject(val, Newtonsoft.Json.Formatting.None);            
        }

        public static string JsonStringifyIgnoreNullValues(object val)
        {
            return JsonConvert.SerializeObject(val, Newtonsoft.Json.Formatting.None, new JsonSerializerSettings() { NullValueHandling = NullValueHandling.Ignore });
        }

        public static object DeserializeFromXmlDataContract(string xml, Type typeToDeserializeInto)
        {
            using (StringReader reader = new StringReader(xml))
            {
                return DeserializeFromXmlDataContract(XmlReader.Create(reader, GetXmlReaderSettingsForDeserializeFromXmlDataContruct()), typeToDeserializeInto);
            }
        }

        internal static object DeserializeFromXmlDataContract(XmlReader reader, Type typeToDeserializeInto)
        {
            return GetDataContractSerializer(typeToDeserializeInto).ReadObject(reader);
        }

        private static DataContractSerializer GetDataContractSerializer(Type type)
        {
            return new DataContractSerializer(type);
        }



        private static XmlReaderSettings GetXmlReaderSettingsForDeserializeFromXmlDataContruct()
        {
            XmlReaderSettings settings = new XmlReaderSettings();
            settings.CheckCharacters = false;
            return settings;
        }

        public static string SerializeToXmlDataContract(object obj)
        {
            if (obj == null)
            {
                throw new ArgumentNullException("obj");
            }
            return SerializeToXmlDataContract(obj, false);
        }

        public static string SerializeToXmlDataContract(object obj, bool omitHeader)
        {
            if (obj == null)
            {
                throw new ArgumentNullException("obj");
            }
            return SerializeToXmlDataContract(obj, obj.GetType(), omitHeader, false);
        }



        public static string SerializeToXmlDataContract(object obj, Type type, bool omitHeader)
        {
            return SerializeToXmlDataContract(obj, type, omitHeader, false);
        }

        public static string SerializeToXmlDataContract(object obj, Type type, bool omitHeader, bool makeXmlReadable)
        {
            StringBuilder output = new StringBuilder();
            XmlWriterSettings settings = new XmlWriterSettings();
            settings.CheckCharacters = false;
            settings.OmitXmlDeclaration = omitHeader;
            if (makeXmlReadable)
            {
                settings.Indent = true;
                settings.IndentChars = "\t";
            }
            XmlWriter writer = XmlWriter.Create(output, settings);
            GetDataContractSerializer(type).WriteObject(writer, obj);
            writer.Close();
            return output.ToString();
        }
    }
}
