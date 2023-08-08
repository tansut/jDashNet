using System;
using System.Collections.Generic;
using System.IdentityModel.Selectors;
using System.IdentityModel.Tokens;
using System.Linq;
using System.ServiceModel;
using System.Web;

namespace JDash.ProductRegistration.Validators
{
    public class JDashUserValidator : UserNamePasswordValidator
    {
        public override void Validate(string userName, string password)
        {
            if (string.IsNullOrEmpty(userName) || string.IsNullOrEmpty(password))
                throw new SecurityTokenException("Username and password required");

            if (userName != "JDashClientRegistration" || password != "JDashCert2013Klt")
            {
                throw new FaultException(string.Format("Wrong username {0} or password ", userName));
            }
        }
    }
}