using System;
using System.Collections.Generic;
using System.Linq;
using System.Runtime.Serialization;
using System.Text;

namespace JDash.ProductRegistration
{
    [DataContract]
    public class ProductRegistrationInfo
    {
        [DataMember]
        public string CurrentRegistryLicenseKey { get; set; }
        [DataMember]
        public string Key { get; set; }
        [DataMember]
        public string WorkstationID { get; set; }
        [DataMember]
        public string ControlData { get; set; }
    }
   
}
