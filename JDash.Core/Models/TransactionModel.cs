using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace JDash.Models
{
    public class TransactionModel
    {
        public string id { get; set; }
        public string Method { get; set; }
        public object [] Args { get; set; }
    }
}
