using System;
using System.Collections.Generic;
using System.Linq;
using System.ServiceModel;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;
using JDash.JDashRegistrationService;
using JDash.Service.ProductRegistration;

namespace JDash.Service.ProductRegistration
{
    public class JDashRegistrationProxy : IJDashRegistrationProxy
    {
        public ProductRegistrationInfoRet RegisterProduct(ProductRegistrationInfo info, AuthencticationInfo authInfo)
        {
            var endPoint = new EndpointAddress(new Uri("https://secure.kalitte.com.tr/Jdash/RegistrationService.svc"));
            var binding = new WSHttpBinding();
            binding.Security.Mode = SecurityMode.TransportWithMessageCredential;
            binding.Security.Transport.ClientCredentialType = HttpClientCredentialType.Basic;
            binding.Security.Message.ClientCredentialType = MessageCredentialType.UserName;
            using (var client = new JDashRegistrationServiceClient(binding, endPoint))
            {
                client.ClientCredentials.UserName.UserName = authInfo.UserName;
                client.ClientCredentials.UserName.Password = authInfo.Password;
                ProductRegistrationInfoRet result = null;
                try
                {
                    result = client.RegisterProduct(info);

                }
                catch (Exception exc)
                {
                    MessageBox.Show(exc.Message + " " + exc.StackTrace);
                    while (exc.InnerException != null)
                    {
                        exc = exc.InnerException;
                        MessageBox.Show(exc.Message + " " + exc.StackTrace);
                    }                    
                }

                return result;
            }
        }
    }

}
