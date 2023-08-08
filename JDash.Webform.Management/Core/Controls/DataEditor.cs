using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Web.UI;

namespace JDash.Webform.Management.Core.Controls
{
    public abstract class DataEditor<T> : UserControl where T : class
    {
        public abstract void Bind(T entity);
        public abstract T Retrieve(T entity);
        public abstract void Clear();

    }
}
