using System;
using System.Collections.Generic;
using System.Linq;
using System.Reflection;
using System.Text;
using System.Web.Handlers;

namespace JDash.Mvc
{
    public static class Utils
    {
        public static string GetResourceUrl(Type type, string resourcePath)
        {
            string resourceUrl = null;

            List<MemberInfo> methodCandidates =
                        typeof(AssemblyResourceLoader).GetMember(
                        "GetWebResourceUrlInternal",
                        BindingFlags.NonPublic | BindingFlags.Static).ToList();

            foreach (var methodCandidate in methodCandidates)
            {
                var method = methodCandidate as MethodInfo;
                if (method == null || method.GetParameters().Length != 5) continue;

                resourceUrl = string.Format("{0}", method.Invoke
                (
                    null,
                    new object[] { 
                        Assembly.GetAssembly(type), resourcePath, false, false, null 
                    })
                );
                break;
            }

            return resourceUrl;
        }

        private static long controlNumber = 0;

        private static long ControlNumber
        {
            get
            {
                return System.Threading.Interlocked.Increment(ref controlNumber);
            }
        }

        public static string UniqueID {
            get
            {
                return string.Format("jdash{0}", ControlNumber);
            }
        }

    }
}
