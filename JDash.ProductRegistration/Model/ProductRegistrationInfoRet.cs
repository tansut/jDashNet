using System;
using System.Collections.Generic;
using System.Linq;
using System.Runtime.Serialization;
using System.Text;

namespace JDash.ProductRegistration
{
    [DataContract]
    public class ProductRegistrationInfoRet
    {
        [DataMember]
        public string LicenceKey { get; set; }
        [DataMember]
        public int RegistrationCount { get; set; }
        [DataMember]
        public string ControlResult { get; set; }
    }
}
