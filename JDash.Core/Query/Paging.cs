using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace JDash.Query
{
    
    public class Paging
    {
        public int? take { get; set; }
        public int? skip { get; set; }
        public Paging()
        {

        }
    }
}
