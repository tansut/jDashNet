﻿using System.Web;
using System.Web.Mvc;

namespace JDash.Mvc.Demo
{
    public class FilterConfig
    {
        public static void RegisterGlobalFilters(GlobalFilterCollection filters)
        {
            filters.Add(new HandleErrorAttribute());
        }
    }
}