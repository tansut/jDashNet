using System;
using System.Collections.Generic;
using System.Collections.ObjectModel;
using System.Linq;
using System.Text;

namespace JDash.Mvc.Util
{
    internal class InsertOrderedDictionary<TKey, TValue> : Dictionary<TKey, TValue>
    {
        public new void Add(TKey key, TValue value)
        {
            base.Add(key, value);
            this.insertList.Add(new KeyValuePair<TKey, TValue>(key, value));
        }

        public new void Clear()
        {
            base.Clear();
            this.insertList.Clear();
        }

        public new bool Remove(TKey key)
        {
            bool result = base.Remove(key);

            if (result)
            {
                foreach (KeyValuePair<TKey, TValue> pair in this.insertList)
                {
                    if (pair.Key.Equals(key))
                    {
                        this.insertList.Remove(pair);
                        break;
                    }
                }
            }

            return result;
        }

        public new List<KeyValuePair<TKey, TValue>>.Enumerator GetEnumerator()
        {
            return this.insertList.GetEnumerator();
        }

        private readonly List<KeyValuePair<TKey, TValue>> insertList = new List<KeyValuePair<TKey, TValue>>();

        public ReadOnlyCollection<KeyValuePair<TKey, TValue>> InsertList
        {
            get
            {
                return this.insertList.AsReadOnly();
            }
        }
    }
}
