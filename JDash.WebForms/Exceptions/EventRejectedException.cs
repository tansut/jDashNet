using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace JDash.WebForms.Exceptions
{
    [Serializable]
    public class EventRejectedException : Exception
    {
        public EventRejectedException() { }
     
        public EventRejectedException(string message) : base(message) { }
        public EventRejectedException(string message, Exception inner) : base(message, inner) { }
        protected EventRejectedException(
          System.Runtime.Serialization.SerializationInfo info,
          System.Runtime.Serialization.StreamingContext context)
            : base(info, context) { }
    }
}
