using JDash;
using JDash.Configuration;
using JDash.Exceptions;
using JDash.Provider;
using System;
using System.Collections.Generic;
using System.Collections.Specialized;
using System.Configuration;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.Configuration;

namespace JDash.Mvc.Management
{
    public static class ProviderManager
    {
        public static System.Configuration.Configuration OpenConfigFile(string configPath)
        {
            var configFile = new FileInfo(configPath);
            var vdm = new VirtualDirectoryMapping(configFile.DirectoryName, true, configFile.Name);
            var wcfm = new WebConfigurationFileMap();
            wcfm.VirtualDirectories.Add("/", vdm);
            return WebConfigurationManager.OpenMappedWebConfiguration(wcfm, "/", "JDashMngr");
        }

        private static JDashProvider currentProvider = null;

        public static JDashProvider CurrentProvider
        {

            get
            {

                lock (typeof(ProviderManager))
                
                {
                    if (HttpContext.Current != null && HttpContext.Current.Application["appPath"] != null)
                    {
                        var path = Path.Combine((string)HttpContext.Current.Application["appPath"], "Web.Config");
                        if (File.Exists(path))
                        {
                            var cfg = OpenConfigFile(path);
                            DashboardSettingsSection section = cfg.GetSection("JDash") as DashboardSettingsSection;
                            var authEnabled = section.AuthorizationEnabled;
                            var adminRoles = section.PrivilegedRoles;
                            var knownRole = section.KnownRoleProvider;
                            var customRole = section.CustomRoleProvider;
                            foreach (ProviderSettings settings in section.Providers)
                            {
                                if (settings.Name != section.DefaultProvider) continue;
                                Type c = Type.GetType(settings.Type, true, true);
                                if (!typeof(JDashProvider).IsAssignableFrom(c))
                                {
                                    throw new ArgumentException("Type should be of DashboardProvider");
                                }
                                JDashProvider p = (JDashProvider)Activator.CreateInstance(c);
                                NameValueCollection parameters = settings.Parameters;
                                NameValueCollection config = new NameValueCollection(parameters.Count, StringComparer.Ordinal);
                                foreach (string key in parameters)
                                {
                                    config[key] = parameters[key];
                                }
                                config["authorizationEnabled"] = Convert.ToString(false);
                                config["privilegedRoles"] = null;
                                config["knownRoleProvider"] = null;
                                config["roleProvider"] = null;
                                if (parameters["connectionString"] != null)
                                {
                                    var connection = cfg.ConnectionStrings.ConnectionStrings[parameters["connectionString"]];
                                    if (connection != null)
                                        config["preparedConnectionString"] = connection.ConnectionString;
                                }
                                p.Initialize(settings.Name, config);
                                currentProvider = p;
                                return currentProvider;
                            }
                        }
                    }
                }
                currentProvider = JDashManager.Provider;
                return currentProvider;
            }
        }

    }
}