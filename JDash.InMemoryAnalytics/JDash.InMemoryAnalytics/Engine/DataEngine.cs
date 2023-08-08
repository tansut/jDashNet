﻿


using System;
using System.Collections;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using JDash.InMemoryAnalytics.Modeling;
using System.Data;
using System.Linq.Dynamic;
using System.Reflection;
using System.Linq.Expressions;
using System.Text.RegularExpressions;

namespace JDash.InMemoryAnalytics.Engine
{
    public class DataEngine
    {

        static DataEngine()
        {

        }

        public static string Identifier(string source)
        {
            return Regex.Replace(source, @"\s+", "");
        }

        protected CubeModel model;

        public DataEngine(CubeModel model)
        {
            this.model = model;
        }

        protected MdQueryResult CreateEmptyResult(MdQuery q)
        {
            var result = new MdQueryResult();
            foreach (var dim in q.Dimensions)
            {
                var dimModel = model.Dimensions.Single(p => p.Name == dim);
                result.Headers.Add(new HeaderCell(dim, dimModel.Caption, dimModel.Type, HeaderType.DimensionHeader));
            }
            foreach (var measure in q.Measures)
            {
                var measureModel = model.Measures.Single(p => p.Name == measure);
                result.Headers.Add(new HeaderCell(measure, measureModel.Caption, measureModel.Type, HeaderType.MeasureHeader));
            }


            return result;

        }

        protected string AggregateFunc(AggregationType type)
        {
            switch (type)
            {
                case AggregationType.Sum:
                    return "Sum";
                case AggregationType.Avg:
                    return "Average";
                case AggregationType.Count:
                    return "Count";
                case AggregationType.First:
                    return "First";
                case AggregationType.Last:
                    return "Last";
                case AggregationType.Min:
                    return "Min";
                case AggregationType.Max:
                    return "Max";
                default:
                    return "Sum";
            }
        }


        private object getDynamicValue(object result, string propertyName)
        {
            var t = result.GetType();
            var res = t.GetProperty(propertyName).GetValue(result, null);
            return res;
        }

        public virtual MdQueryResult Execute(MdQuery q)
        {
            var data = q.SourceData as IEnumerable;
            if (data != null)
            {
                var result = CreateEmptyResult(q);

                var groupSb = new StringBuilder();
                var measureSb = new StringBuilder();

                foreach (var dim in q.Dimensions)
                {
                    var dimModel = this.model.Dimensions.Single(p => p.Name == dim);
                    if (string.IsNullOrEmpty(dimModel.Expression))
                    {
                        groupSb.AppendFormat("{0} as {1},", dimModel.Source, dim);
                        measureSb.AppendFormat("Key.{0} as {0},", dim);
                    }
                    else
                    {
                        groupSb.AppendFormat("{0} as {1},", dimModel.Expression, dim);
                        measureSb.AppendFormat("Key.{0} as {0},", dim);
                    }
                }
                groupSb.Remove(groupSb.Length - 1, 1);
                var groupQueryString = string.Format("new ({0})", groupSb.ToString());
                var groupQuery = data.AsQueryable().GroupBy(groupQueryString, "it");


                foreach (var measure in q.Measures)
                {
                    var measureData = model.Measures.Single(p => p.Name == measure);
                    //var format = "{0}({1}) as {1},";
                    var formatExp = "{0}({1}) as {2},";

                    if (measureData.Aggregation == AggregationType.Count)
                    {
                        //format = "{0}() as {1},";
                        formatExp = "{0}() as {2},";
                    }
                    if (string.IsNullOrEmpty(measureData.Expression))
                    {

                        measureSb.AppendFormat(formatExp,
                            AggregateFunc(measureData.Aggregation), measureData.Source, measure);
                    }
                    else
                    {
                        measureSb.AppendFormat(formatExp,
                            AggregateFunc(measureData.Aggregation), measureData.Expression, measure);
                    }
                }
                measureSb.Remove(measureSb.Length - 1, 1);
                var measureQueryString = string.Format("new ({0})", measureSb.ToString());
                var measureQuery = groupQuery.Select(measureQueryString);
                var sortBuffer = new StringBuilder();

                for (int i = 0; i < q.Sort.Count; i++)
                {
                    var sort = q.Sort[i];
                    sortBuffer.AppendFormat("{0} {1},", sort.Column, sort.Direction.ToString());
                }

                if (sortBuffer.Length > 0)
                {
                    sortBuffer.Remove(sortBuffer.Length - 1, 1);
                    var sortExp = sortBuffer.ToString();
                    if (!string.IsNullOrEmpty(sortExp))
                        measureQuery = measureQuery.OrderBy(sortExp);
                }

                if (q.Skip > 0)
                    measureQuery = measureQuery.Skip(q.Skip);

                if (q.Take > 0)
                    measureQuery = measureQuery.Take(q.Take);

                foreach (var resultItem in measureQuery)
                {
                    var row = new List<DataCell>();
                    foreach (var dim in q.Dimensions)
                    {
                        var value = getDynamicValue(resultItem, dim);
                        var formatInfo = model.Dimensions.Single(p => p.Name == dim).DefaultFormat;
                        var cell = new DataCell(value, formatInfo == null ? null : formatInfo.FormatString);
                        row.Add(cell);
                    }

                    foreach (var measure in q.Measures)
                    {
                        var value = getDynamicValue(resultItem, measure);
                        var formatInfo = model.Measures.Single(p => p.Name == measure).DefaultFormat;
                        var cell = new DataCell(value, formatInfo == null ? null : formatInfo.FormatString);
                        row.Add(cell);
                    }
                    result.Items.Add(row);
                }

                return result;
            }
            else return null;
        }
    }
}
