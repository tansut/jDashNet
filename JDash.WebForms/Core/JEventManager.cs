using System;
using System.Collections.Generic;
using System.Linq;
using System.Reflection;
using System.Text;

namespace JDash.WebForms
{
    internal static class JEventManager
    {
        private static Dictionary<Type, MethodInfo[]> cache = new Dictionary<Type,MethodInfo[]>();

        internal static MethodInfo GetHandlerMethod(object objectInstance, string eventName)
        {
            MethodInfo[] methods;
            lock (typeof(JEventManager))
            {
                var type = objectInstance.GetType().Namespace == "ASP" ? objectInstance.GetType().BaseType : objectInstance.GetType();
                if (cache.ContainsKey(type))
                    methods = cache[type];
                else {                    
                    var allMethods = type.GetMethods(BindingFlags.Instance | BindingFlags.Public | BindingFlags.NonPublic);
                    var tempList = new List<MethodInfo>(allMethods.Length);
                    foreach (var method in allMethods)
                    {
                        object[] attributes = method.GetCustomAttributes(typeof(JEventHandlerAttribute), true);
                        if (attributes.Length > 0)
                        {
                            tempList.Add(method);
                        }
                    }
                    methods = cache[type] = tempList.ToArray();
                }                                
            }
            MethodInfo methodToCall = null;

            foreach (var method in methods)
            {
                object[] attributes = method.GetCustomAttributes(typeof(JEventHandlerAttribute), true);
                JEventHandlerAttribute attribute = attributes[0] as JEventHandlerAttribute;

                if (eventName.Equals(attribute.Name, StringComparison.InvariantCultureIgnoreCase))
                {
                    methodToCall = method;
                    break;
                }
            }

            return methodToCall;
        }

        private static void broadcast(object sender, object objectInstance, JEventArgs args)
        {
            var methodToCall = GetHandlerMethod(objectInstance, args.Event.BroadcastName);
            if (methodToCall != null)
            {
                var result = methodToCall.Invoke(objectInstance, new object[] { sender, args });
            }
        }

        internal static void BroadcastEvent(object sender, JEventArgs eventArgs, params object[] targets)
        {
            foreach (var obj in targets)
            {
                broadcast(sender, obj, eventArgs);
                if (eventArgs.Handled || eventArgs.Rejected)
                    break;
            }
        }
    }
}
