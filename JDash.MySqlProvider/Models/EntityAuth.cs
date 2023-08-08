using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using JDash.Models;
using JDash.Extensions;

namespace JDash.MySqlProvider.Models
{
    public partial class entityauth
    {

        public KeyValuePair<string, PermissionModel> ToAuthModel()
        {
            return new KeyValuePair<string, PermissionModel>(this.roleOrUser, new PermissionModel() { authTarget = this.authType.ToEnum<AuthTarget>(), permission =this.permission.ToEnum<Permission>() });
        }
    }
}
