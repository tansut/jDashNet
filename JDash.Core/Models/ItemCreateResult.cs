using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace JDash.Models
{
    [Serializable]
    public class ItemCreateResult
    {
        public string id;
        public object Custom;

        public ItemCreateResult()
        {
        }

        public ItemCreateResult(string id): this(id, null)
        {
            
        }

        public ItemCreateResult(string id, object custom)
        {
            this.id = id;
            this.Custom = custom;
        }

    }
}
