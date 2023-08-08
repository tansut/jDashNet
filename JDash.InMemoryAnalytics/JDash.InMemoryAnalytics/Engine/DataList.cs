﻿

using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Linq;
using System.Text;
using JDash.InMemoryAnalytics.Extensions;
using JDash.InMemoryAnalytics.Modeling;

namespace JDash.InMemoryAnalytics.Engine
{
    public class DataList : List<DataItem>, ITypedList
    {
        #region ITypedList Members

        public PropertyDescriptorCollection GetItemProperties(PropertyDescriptor[] listAccessors)
        {
            PropertyDescriptorCollection list = null;
            foreach (var e in this)
            {
                PropertyDescriptorCollection col = TypeDescriptor.GetProperties(e);
                list = col;
                break;
            }
            return list;
        }

        public string GetListName(PropertyDescriptor[] listAccessors)
        {
            return "DataList";
        }

        #endregion

        public List<DataHeader> Headers { get; private set; }

        public DataList(List<DataHeader> headers)
        {
            this.Headers = headers;
        }

        public DataItem AddData(object[] data)
        {
            var item = new DataItem(this, data);
            Add(item); 
            return item;
        }



        public static DataList FromDataTable(DataTable table)
        {

            var modelList = new List<DataHeader>(table.Columns.Count);
            foreach (DataColumn col in table.Columns)
            {
                modelList.Add(new DataHeader(col.ColumnName, Helper.ToDataType(col.DataType)));
            }

            var result = new DataList(modelList);

            foreach (DataRow row in table.Rows)
            {
                result.AddData(row.ItemArray);
            }

            return result;
        }

        //public static DataList FromDataTable(DataTable table)
        //{

        //    var modelList = new List<DataHeader>(table.Columns.Count);
        //    foreach (DataColumn col in table.Columns)
        //    {
        //        modelList.Add(new DataHeader(col.ColumnName, Helper.ToDataType(col.DataType)));
        //    }

        //    var result = new DataList(modelList);

        //    foreach (DataRow row in table.Rows)
        //    {
        //        result.AddData(row.ItemArray);
        //    }

        //    return result;
        //}
    }
}
