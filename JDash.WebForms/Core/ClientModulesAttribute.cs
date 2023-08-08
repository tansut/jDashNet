using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace JDash.WebForms
{
    [AttributeUsage(AttributeTargets.Class, Inherited = false, AllowMultiple = false)]
    sealed class ClientModulesAttribute : Attribute
    {
        readonly string [] modules;

        public ClientModulesAttribute(params string [] modules)
        {
            this.modules = modules;
        }

        public string [] Modules
        {
            get { return modules; }
        }
    }
}
