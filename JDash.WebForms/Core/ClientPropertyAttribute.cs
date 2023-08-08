using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace JDash.WebForms
{
    [AttributeUsage(AttributeTargets.Property, Inherited = false, AllowMultiple = false)]
    sealed class ClientPropertyAttribute : Attribute
    {
        readonly string name;

        public ClientPropertyAttribute(string name)
        {
            this.name = name;
        }

        public string Name
        {
            get { return name; }
        }
    }
}
