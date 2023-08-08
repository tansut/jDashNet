using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using JDash.Models;
using JDash.Extensions;

namespace JDash.SqlProvider.Models
{
    public partial class EntityAuth
    {

        public KeyValuePair<string, PermissionModel> ToAuthModel()
        {
            return new KeyValuePair<string, PermissionModel>(this.roleOrUser, new PermissionModel() { authTarget = this.authType.ToEnum<AuthTarget>(), permission =this.permission.ToEnum<Permission>() });
        }
    }
}
