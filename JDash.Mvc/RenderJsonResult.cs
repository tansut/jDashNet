﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Web.Mvc;
using Newtonsoft.Json;
using Newtonsoft.Json.Converters;
namespace JDash.Mvc
{
    public class JsonNetResult : ActionResult
    {
        public Encoding ContentEncoding { get; set; }
        public string ContentType { get; set; }
        public object Data { get; set; }

        public JsonSerializerSettings SerializerSettings { get; set; }
        public Formatting Formatting { get; set; }


        public JsonNetResult()
        {
            SerializerSettings = new JsonSerializerSettings();

            //SerializerSettings.Converters.Add(new JavaScriptDateTimeConverter());
            SerializerSettings.Converters.Add(new IsoDateTimeConverter());
            Formatting = Formatting.None;
        }

        public JsonNetResult(object data)
            : this()
        {
            Data = data;
        }

        public override void ExecuteResult(ControllerContext context)
        {
            if (context == null)
                throw new ArgumentNullException("context");

            var response = context.HttpContext.Response;
            response.ContentType = !string.IsNullOrEmpty(ContentType) ? ContentType : "application/json";

            if (ContentEncoding != null)
                response.ContentEncoding = ContentEncoding;

            if (Data == null) return;
            var writer = new JsonTextWriter(response.Output) { Formatting = Formatting };

            var serializer = JsonSerializer.Create(SerializerSettings);
            serializer.Serialize(writer, Data);
            writer.Flush();
        }
    }
}
