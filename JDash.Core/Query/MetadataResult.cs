using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace JDash.Query
{
    public class MetadataResult
    {
        public int count { get; set; }
        public MetadataResult()
        {

        }

        public MetadataResult(int count)
        {
            this.count = count;
        }
    }
}
