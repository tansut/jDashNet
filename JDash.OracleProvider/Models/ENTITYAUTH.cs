using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using JDash.Models;
using JDash.Extensions;

namespace JDash.OracleProvider.Models
{
    public partial class ENTITYAUTH
    {

        public KeyValuePair<string, PermissionModel> ToAuthModel()
        {
            return new KeyValuePair<string, PermissionModel>(this.ROLEORUSER, new PermissionModel() { authTarget = this.AUTHTYPE.ToEnum<AuthTarget>(), permission =this.PERMISSION.ToEnum<Permission>() });
        }
    }
}
