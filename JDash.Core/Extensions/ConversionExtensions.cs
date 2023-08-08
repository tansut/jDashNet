using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using JDash.Query;

namespace JDash.Extensions
{
    public static class ConversionExtensions
    {
        public static T ToEnum<T>(this string obj) where T : struct
        {
            T outObj;
            if (Enum.TryParse<T>(obj, out outObj))
            {
                return outObj;
            }
            else throw new ArgumentException(obj.ToString() + " is not enum item");
        }

        public static int ToInt(this string obj)
        {
            int outObj;
            if (int.TryParse(obj, out outObj))
            {
                return outObj;
            }
            else throw new ArgumentException(obj.ToString() + " is not an integer");
        }

        public static int? ToNullableInt(this string obj)
        {
            int outObj;
            if (int.TryParse(obj, out outObj))
            {
                return outObj;
            }
            else return null;
        }

        public static IEnumerable<T> Add<T>(this IEnumerable<T> obj, T item)
        {
            return obj.Concat(new[] { item });
        }

        public static IEnumerable<T> Replace<T>(this IEnumerable<T> source, T item, T newItem)
        {
            var sourceList = source.ToList();

            int ind = 0;
            foreach (T _item in sourceList)
            {
                if (_item.Equals(item))
                {
                    sourceList[ind] = newItem;
                    break;
                }
                ind++;
            }

            return sourceList.AsEnumerable();
        }

        public static DateTime GetMaxDate(this DateTime dt)
        {
            DateTime maxdate = dt.Date;
            maxdate = maxdate.AddHours(23);
            maxdate = maxdate.AddMinutes(59);
            maxdate = maxdate.AddSeconds(59);
            maxdate = maxdate.AddMilliseconds(999);
            return maxdate;
        }
       


    }
}
