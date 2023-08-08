using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace JDash.Query
{
    public class DynamicQuery
    {
        public FilterParam filter { get; set; }
        public List<Sort> sort { get; set; }
        public Paging paging { get; set; }

        public DynamicQuery()
        {

        }
        
    }
}
