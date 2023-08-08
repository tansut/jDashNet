using System;
using System.Collections.Generic;
using System.Linq;
using System.Runtime.Serialization;
using System.ServiceModel;
using System.Text;

namespace JDash.ProductRegistration
{
    // NOTE: You can use the "Rename" command on the "Refactor" menu to change the interface name "IJDashRegistration" in both code and config file together.
    [ServiceContract]
    public interface IJDashRegistrationService
    {
        [OperationContract]
        ProductRegistrationInfoRet RegisterProduct(ProductRegistrationInfo info);

        [OperationContract]
        bool Test();
    }
}
