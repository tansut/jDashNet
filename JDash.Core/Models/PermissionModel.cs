using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace JDash.Models
{
    public enum Permission
    {
        view,
        edit,
        delete
    }

    public enum AuthTarget
    {
        roleName,
        userName,
        everyOne

    }


    public class PermissionModel
    {
        public Permission permission { get; set; }
        public AuthTarget authTarget { get; set; }
    }
}