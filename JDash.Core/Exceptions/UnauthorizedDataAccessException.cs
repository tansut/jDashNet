using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace JDash.Exceptions
{
    [Serializable]
    public class UnauthorizedDataAccessException : Exception
    {

        public string username { get; set; }
        public string entityType { get; set; }
        public string permission { get; set; }

        public UnauthorizedDataAccessException() { }
        public UnauthorizedDataAccessException(string message) : base(message) { }
        public UnauthorizedDataAccessException(string message, Exception inner) : base(message, inner) { }
        protected UnauthorizedDataAccessException(
          System.Runtime.Serialization.SerializationInfo info,
          System.Runtime.Serialization.StreamingContext context)
            : base(info, context) { }

        public UnauthorizedDataAccessException(string username, string entityType, string permission)
            : this(string.Empty, username, entityType, permission) { }     

        public UnauthorizedDataAccessException(string message,string username, string entityType, string permission)
            : base(message)
        {
            this.username = username;
            this.entityType = entityType;
            this.permission = permission;
        }
    }
}
