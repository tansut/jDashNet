using System;
using System.Collections.Generic;
using System.Data;
using System.IO;
using System.Linq;
using System.Web;
using System.Xml.Serialization;
using JDash.InMemoryAnalytics.Engine;
using JDash.InMemoryAnalytics.Modeling;

namespace JDash.WebForms.Demo.JDash.Dashlets.DataAnalysis
{
    public static class DemoAnalysisProvider
    {
        public static List<CubeModel> GetCubes()
        {
            List<CubeModel> result;
            var filePath = HttpContext.Current.Server.MapPath("~/App_Data/CubeDefinitions.xml");
            using (FileStream fs = new FileStream(filePath, FileMode.Open, FileAccess.Read, FileShare.Read))
            {
                XmlSerializer serializer = new XmlSerializer(typeof(List<CubeModel>));
                result = (List<CubeModel>)serializer.Deserialize(fs);
                fs.Close();
            }
            return result;
        }

        public static DataList GetSourceData(string cubeName)
        {
            var filePath = HttpContext.Current.Server.MapPath("~/App_Data/" + cubeName + "-DataSet" + ".xml");
            DataSet set = new DataSet();            
            set.ReadXml(filePath);
            DataTable table = set.Tables[0];
            return DataList.FromDataTable(table);
        }
    }
}