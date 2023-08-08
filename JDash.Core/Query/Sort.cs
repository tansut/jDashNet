using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace JDash.Query
{

    public class Sort
    {
        public string field { get; set; }
        public SortDirection op { get; set; }
        public Sort()
        {

        }
    }
}
