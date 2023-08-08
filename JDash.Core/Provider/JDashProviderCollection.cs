using System;
using System.Collections.Generic;
using System.Configuration.Provider;
using System.Linq;
using System.Text;

namespace JDash.Provider
{
    public class JDashProviderCollection: ProviderCollection
    {
        public override void Add(ProviderBase provider)
        {
            if (provider == null)
            {
                throw new ArgumentNullException("provider");
            }
            if (!(provider is JDashProvider))
            {
                throw new ArgumentException("Provider must be a WidgetFrameworkProvider");
            }
            base.Add(provider);
        }

        public void CopyTo(JDashProvider[] array, int index)
        {
            base.CopyTo(array, index);
        }

        public JDashProvider this[string name]
        {
            get
            {
                return (JDashProvider)base[name];
            }
        }
    }
}
