using System;
using System.Collections.Generic;
using System.Linq;
using System.Runtime.Serialization;
using System.ServiceModel;
using System.Text;
using JDash.JDashRegistrationService;


namespace JDash.Service.ProductRegistration
{

    public class AuthencticationInfo
    {
        public string UserName { get; set; }
        public string Password { get; set; }
        public AuthencticationInfo(string user, string pass)
        {
            UserName = user;
            Password = pass;
        }
    }
    public interface IJDashRegistrationProxy
    {
        ProductRegistrationInfoRet RegisterProduct(ProductRegistrationInfo info, AuthencticationInfo authInfo);
    }
}
