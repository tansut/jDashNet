using System;
using System.Collections;
using System.Collections.Generic;
using System.ComponentModel;
using System.Globalization;
using System.Security.Cryptography;
using System.Text;
using System.Text.RegularExpressions;
using System.Web;
using System.Web.UI;
using System.Linq;
using System.Linq.Expressions;

namespace JDash.Helpers
{

    internal static class StringHelper
    {
        public static string FormatWith(this string format, params object[] args)
        {
            if (args == null)
            {
                throw new ArgumentNullException(string.Format("The args parameter can not be null when calling {0}.FormatWith().", format));
            }

            return string.Format(format, args);
        }

        public static string FormatWith(this string format, IFormatProvider provider, params object[] args)
        {
            return string.Format(provider, format, args);
        }

        public static string FormatWith(this string format, object source)
        {
            return format.FormatWith(null, source);
        }

        [Description("")]
        public static string FormatWith(this string format, IFormatProvider provider, object source)
        {
            if (format == null)
            {
                throw new ArgumentNullException("format");
            }

            List<object> values = new List<object>();

            string rewrittenFormat = Regex.Replace(format,
                @"(?<start>\{)+(?<property>[\w\.\[\]]+)(?<format>:[^}]+)?(?<end>\})+",
                delegate(Match m)
                {
                    Group startGroup = m.Groups["start"];
                    Group propertyGroup = m.Groups["property"];
                    Group formatGroup = m.Groups["format"];
                    Group endGroup = m.Groups["end"];

                    values.Add((propertyGroup.Value == "0")
                      ? source
                      : Eval(source, propertyGroup.Value));

                    int openings = startGroup.Captures.Count;
                    int closings = endGroup.Captures.Count;

                    return openings > closings || openings % 2 == 0
                         ? m.Value
                         : new string('{', openings) + (values.Count - 1) + formatGroup.Value + new string('}', closings);
                },
                RegexOptions.Compiled | RegexOptions.CultureInvariant | RegexOptions.IgnoreCase);

            return string.Format(provider, rewrittenFormat, values.ToArray());
        }

        private static object Eval(object source, string expression)
        {
            try
            {
                return DataBinder.Eval(source, expression);
            }
            catch (HttpException e)
            {
                throw new FormatException(null, e);
            }
        }


        public static string ConcatWith(this string instance, string text)
        {
            return string.Concat(instance, text);
        }

        public static string ConcatWith(this string instance, params object[] args)
        {
            if (args == null)
            {
                throw new ArgumentNullException(string.Format("The args parameter can not be null when calling {0}.Format().", instance));
            }

            return string.Concat(instance, string.Concat(args));
        }

        public static bool Contains(this string instance, params string[] args)
        {
            foreach (string s in args)
            {
                if (instance.Contains(s))
                {
                    return true;
                }
            }

            return false;
        }

        public static bool IsEmpty(this string text)
        {
            return string.IsNullOrEmpty(text);
        }

        public static bool IsNotEmpty(this string text)
        {
            return !text.IsEmpty();
        }


        public static string LeftOfRightmostOf(this string text, char c)
        {
            if (text.IsEmpty())
            {
                return text;
            }

            int i = text.LastIndexOf(c);

            if (i == -1)
            {
                return text;
            }

            return text.Substring(0, i);
        }

        public static string LeftOfRightmostOf(this string text, string value)
        {
            if (text.IsEmpty())
            {
                return text;
            }

            int i = text.LastIndexOf(value);

            if (i == -1)
            {
                return text;
            }

            return text.Substring(0, i);
        }

        public static string RightOfRightmostOf(this string text, char c)
        {
            if (text.IsEmpty())
            {
                return text;
            }

            int i = text.LastIndexOf(c);

            if (i == -1)
            {
                return text;
            }

            return text.Substring(i + 1);
        }

        public static string RightOfRightmostOf(this string text, string value)
        {
            if (text.IsEmpty())
            {
                return text;
            }

            int i = text.LastIndexOf(value);

            if (i == -1)
            {
                return text;
            }

            return text.Substring(i + value.Length);
        }

        public static string LeftOf(this string text, char c)
        {
            if (text.IsEmpty())
            {
                return text;
            }

            int i = text.IndexOf(c);

            if (i == -1)
            {
                return text;
            }

            return text.Substring(0, i);
        }
    }
}