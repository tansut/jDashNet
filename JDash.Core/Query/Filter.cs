using System;
using System.Collections;
using System.Collections.Generic;
using System.Linq;
using System.Linq.Expressions;
using System.Reflection;
using System.Text;
using JDash.Extensions;

namespace JDash.Query
{
    
    public class Filter
    {
        public string field { get; set; }
        public object value { get; set; }
        public IEnumerable values { get; set; }
        public CompareOperator op { get; set; }

        public Filter()
        {

        }

        public System.Linq.Expressions.Expression BuildExpression(MemberExpression propertyAccess, ParameterExpression param)
        {
            PropertyInfo property = propertyAccess.Member as PropertyInfo;
            Type type = property.PropertyType;
            LambdaExpression left = Expression.Lambda(propertyAccess, param);
            ConstantExpression right = Expression.Constant(value);
            Expression boolExp = null;
            TypeDelegator dlg = new TypeDelegator(type);
            if (values != null)
            {
                Expression temp = null;
                if (op != CompareOperator.notEq)
                {
                    foreach (var item in values)
                    {
                        right = Expression.Constant(item);
                        temp = Expression.Equal(left.Body, right);

                        if (boolExp == null)
                            boolExp = temp;
                        else boolExp = Expression.Or(boolExp, temp);

                    }
                }
                else
                {
                    foreach (var item in values)
                    {
                        right = Expression.Constant(item);
                        temp = Expression.NotEqual(left.Body, right);
                        if (boolExp == null)
                            boolExp = temp;
                        else boolExp = Expression.And(boolExp, temp);
                    }
                }
            }
            else if (dlg.Equals(typeof(bool)) || dlg.Equals(typeof(bool?)))
            {
                bool? result = null;
                if (value != null)
                    result=bool.Parse(value.ToString());
                if (dlg.Equals(typeof(bool)))
                    right = Expression.Constant(result.Value);
                else if (dlg.Equals(typeof(bool?)))
                    right = Expression.Constant(result);
                if (op != CompareOperator.notEq)
                    boolExp = Expression.Equal(left.Body, right);
                else boolExp = Expression.NotEqual(left.Body, right);
            }
            else if (dlg.Equals(typeof(DateTime)) || dlg.Equals(typeof(DateTime?)))
            {
                DateTime? result = null;
                if (value != null)
                {
                   
                    result = DateTime.Parse(value.ToString());
                    if (op == CompareOperator.lt || op == CompareOperator.eqLt)
                    {
                        result = result.Value.GetMaxDate();
                    }

                }
                if (dlg.Equals(typeof(DateTime)))
                    right = Expression.Constant(result.Value);
                else if (dlg.Equals(typeof(DateTime?)))
                    right = Expression.Constant(result, typeof(DateTime?));

                switch (op)
                {
                    case CompareOperator.gt:
                        boolExp = Expression.GreaterThan(left.Body, right);
                        break;
                    case CompareOperator.lt:
                        result = result.Value.GetMaxDate();
                        boolExp = Expression.LessThan(left.Body, right);
                        break;
                    case CompareOperator.notEq:
                        boolExp = Expression.NotEqual(left.Body, right);
                        break;
                    case CompareOperator.eqGt:
                        boolExp = Expression.GreaterThanOrEqual(left.Body, right);
                        break;
                    case CompareOperator.eqLt:

                        boolExp = Expression.LessThanOrEqual(left.Body, right);
                        break;
                    default:
                        boolExp = Expression.Equal(left.Body, right);
                        break;
                }
            }
            else if (dlg.Equals(typeof(string)))
            {
                string methodName = null;
                switch (op)
                {
                    case CompareOperator.contains:
                        methodName = "Contains";
                        break;
                    case CompareOperator.sw:
                        methodName = "StartsWith";
                        break;
                    case CompareOperator.ew:
                        methodName = "EndsWith";
                        break;
                    default:
                        break;
                }
                if (!string.IsNullOrEmpty(methodName))
                {
                    right = Expression.Constant(value);
                    boolExp = Expression.Call(left.Body, methodName, null, right);
                }
                else
                {
                    if (op == CompareOperator.notEq)
                    {
                        boolExp = Expression.NotEqual(left.Body, right);
                    }else
                    boolExp = Expression.Equal(left.Body, right);
                }
            }
            else
                if (
                dlg.Equals(typeof(byte)) ||
                dlg.Equals(typeof(byte?)) ||
                dlg.Equals(typeof(int)) ||
                dlg.Equals(typeof(int?)) ||
                dlg.Equals(typeof(double)) ||
                dlg.Equals(typeof(double?)) ||
                dlg.Equals(typeof(long)) ||
                dlg.Equals(typeof(long?)) ||
                dlg.Equals(typeof(decimal)) ||
                dlg.Equals(typeof(decimal?)) ||
                dlg.Equals(typeof(float)) ||
                dlg.Equals(typeof(float?))
                )
                {
                    if (dlg.Equals(typeof(byte)) || dlg.Equals(typeof(byte?)))
                    {
                        byte? result = null;
                        if (value != null)
                        {
                            result = byte.Parse(value.ToString());
                            right = Expression.Constant(result.Value);
                        }
                        else right = Expression.Constant(result, typeof(byte?));

                    }
                    else
                        if (dlg.Equals(typeof(int)) || dlg.Equals(typeof(int?)))
                        {
                            int? result = null;
                            if (value != null)
                            {
                                result = int.Parse(value.ToString());
                                right = Expression.Constant(result.Value);
                            }
                            else right = Expression.Constant(result, typeof(int?));

                        }
                        else
                            if (dlg.Equals(typeof(double)) || dlg.Equals(typeof(double?)))
                            {
                                double? result = null;
                                if (value != null)
                                {
                                    result = double.Parse(value.ToString());
                                    right = Expression.Constant(result.Value);
                                }
                                else right = Expression.Constant(result, typeof(double?));
                            }
                            else
                                if (dlg.Equals(typeof(long)) || dlg.Equals(typeof(long?)))
                                {
                                    long? result = null;
                                    if (value != null)
                                    {
                                        result = long.Parse(value.ToString());
                                        right = Expression.Constant(result.Value);
                                    }
                                    else right = Expression.Constant(result, typeof(long?));

                                }
                                else
                                    if (dlg.Equals(typeof(decimal)) || dlg.Equals(typeof(decimal?)))
                                    {
                                        decimal? result = null;
                                        if (value != null)
                                        {
                                            result = decimal.Parse(value.ToString());
                                            right = Expression.Constant(result.Value);
                                        }
                                        else right = Expression.Constant(result, typeof(decimal?));

                                    }
                                    else
                                        if (dlg.Equals(typeof(float)) || dlg.Equals(typeof(float?)))
                                        {
                                            float? result = null;
                                            if (value != null)
                                            {
                                                result = float.Parse(value.ToString());
                                                right = Expression.Constant(result.Value);
                                            }
                                            else right = Expression.Constant(result, typeof(float?));
                                        }
                    switch (op)
                    {
                        case CompareOperator.gt:
                            boolExp = Expression.GreaterThan(left.Body, right);
                            break;
                        case CompareOperator.lt:
                            boolExp = Expression.LessThan(left.Body, right);
                            break;
                        case CompareOperator.notEq:
                            boolExp = Expression.NotEqual(left.Body, right);
                            break;
                        case CompareOperator.eqGt:
                            boolExp = Expression.GreaterThanOrEqual(left.Body, right);
                            break;
                        case CompareOperator.eqLt:
                            boolExp = Expression.LessThanOrEqual(left.Body, right);
                            break;
                        default:
                            boolExp = Expression.Equal(left.Body, right);
                            break;
                    }
                }
            return boolExp;
        }
    }
}
