﻿using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Linq;
using System.Reflection;
using System.Text;
using System.Threading.Tasks;
using System.Web.UI;

namespace JDash.WebForms.Utils
{
    internal class ReflectionUtils
    {
        /// <summary>
        /// 
        /// </summary>
        /// <param name="property"></param>
        /// <returns></returns>
        public static object GetDefaultValue(PropertyDescriptor property)
        {
            DefaultValueAttribute attr = property.Attributes[typeof(DefaultValueAttribute)] as DefaultValueAttribute;
            return attr != null ? attr.Value : null;
        }

        /// <summary>
        /// 
        /// </summary>
        /// <param name="property"></param>
        /// <returns></returns>
        public static object GetDefaultValue(PropertyInfo property)
        {
            object[] att = property.GetCustomAttributes(typeof(DefaultValueAttribute), false);
            return att.Length > 0 ? ((DefaultValueAttribute)att[0]).Value : null;
        }

        /// <summary>
        /// 
        /// </summary>
        /// <param name="obj"></param>
        /// <param name="type"></param>
        /// <returns></returns>
        public static bool IsTypeOf(Object obj, Type type)
        {
            return IsTypeOf(obj, type.FullName, false);
        }

        /// <summary>
        /// 
        /// </summary>
        /// <param name="obj"></param>
        /// <param name="type"></param>
        /// <param name="shallow"></param>
        /// <returns></returns>
        public static bool IsTypeOf(Object obj, Type type, bool shallow)
        {
            return IsTypeOf(obj, type.FullName, shallow);
        }

        /// <summary>
        /// 
        /// </summary>
        /// <param name="obj"></param>
        /// <param name="typeFullName"></param>
        /// <returns></returns>
        public static bool IsTypeOf(Object obj, string typeFullName)
        {
            return IsTypeOf(obj, typeFullName, false);
        }

        /// <summary>
        /// 
        /// </summary>
        /// <param name="obj"></param>
        /// <param name="typeFullName"></param>
        /// <param name="shallow"></param>
        /// <returns></returns>
        public static bool IsTypeOf(Object obj, string typeFullName, bool shallow)
        {
            if (obj != null)
            {
                if (shallow)
                {
                    return obj.GetType().FullName.Equals(typeFullName);
                }
                else
                {
                    Type type = obj.GetType();
                    string fullName = type.FullName;

                    while (!fullName.Equals("System.Object"))
                    {
                        if (fullName.Equals(typeFullName))
                        {
                            return true;
                        }
                        type = type.BaseType;
                        fullName = type.FullName;
                    }
                }
            }

            return false;
        }

        /// <summary>
        /// 
        /// </summary>
        /// <param name="control"></param>
        /// <param name="type"></param>
        /// <returns></returns>
        public static bool IsInTypeOf(Control control, Type type)
        {
            return IsInTypeOf(control, type.FullName);
        }

        /// <summary>
        /// 
        /// </summary>
        /// <param name="control"></param>
        /// <param name="typeFullName"></param>
        /// <returns></returns>
        public static bool IsInTypeOf(Control control, string typeFullName)
        {
            Control temp = GetTypeOfParent(control, typeFullName);

            return (temp != null);
        }

        /// <summary>
        /// 
        /// </summary>
        /// <param name="control"></param>
        /// <param name="type"></param>
        /// <returns></returns>
        public static Control GetTypeOfParent(Control control, Type type)
        {
            return GetTypeOfParent(control, type.FullName);
        }

        /// <summary>
        /// 
        /// </summary>
        /// <param name="control"></param>
        /// <param name="typeFullName"></param>
        /// <returns></returns>
        public static Control GetTypeOfParent(Control control, string typeFullName)
        {
            for (Control parent = control.Parent; parent != null; parent = parent.Parent)
            {
                if (ReflectionUtils.IsTypeOf(parent, typeFullName))
                {
                    return parent;
                }
            }

            return null;
        }
    }
}
