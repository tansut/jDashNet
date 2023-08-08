using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using JDash.Models;

namespace JDash.Query
{
    
    public class DynamicResult<T> where T : class
    {
        public IEnumerable<T> data { get; set; }
        public MetadataResult meta { get; set; }
        public DynamicResult()
        {

        }
        public DynamicResult(IEnumerable<T> data, MetadataResult meta)
        {
            this.data = data;
            this.meta = meta;
        }
    }
}
