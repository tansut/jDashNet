using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace JDash.Query
{
    
    public class FilterParam
    {        
        public List<Filter> filters { get; set; }
        public FilterOperator op { get; set; }
        public FilterParam()
        {
            filters = new List<Filter>();
        }
    }
}
