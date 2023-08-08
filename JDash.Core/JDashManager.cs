using System;
using System.Collections.Generic;
using System.Collections.Specialized;
using System.Configuration;
using System.Linq;
using System.Text;
using System.Threading;
using JDash.Configuration;
using JDash.Provider;

namespace JDash
{
    /// <summary>
    /// Contains core JDash.Net classes.
    /// </summary>
    [System.Runtime.CompilerServices.CompilerGeneratedAttribute()]
    class NamespaceDoc
    {
    }


    /// <summary>
    /// Use to set a custom username for JDash.Net. See <seealso cref="JDash.JDashManager.CurrentUserCallback"/> event
    /// for more information.
    /// </summary>
    public class UserInfoEventArgs : EventArgs
    {
        /// <summary>
        /// Represents the username. Set a value to change username value.
        /// </summary>
        public string Username { get; set; }

        public UserInfoEventArgs(string username)
        {
            this.Username = username;
        }
    }


    /// <summary>
    /// Static class to manage providers and JDash.Net wide settings.
    /// </summary>
    public static class JDashManager
    {
        /// <summary>
        /// By default JDash.Net uses username value retreived using current thread. To change this
        /// behaviour set an event handler and use <see cref="JDash.UserInfoEventArgs"/> to change username value.
        /// </summary>
        public static event EventHandler<UserInfoEventArgs> CurrentUserCallback;



        private static JDashProvider activeProvider = null;
        private static JDashProviderCollection providers;

        /// <summary>
        /// Returns a list of providers registered using web.config.
        /// </summary>
        public static JDashProviderCollection Providers
        {
            get
            {
                return providers;
            }
        }



        /// <summary>
        /// Returns a reference to the current provider.
        /// </summary>
        public static JDashProvider Provider
        {
            get
            {
                return activeProvider;
            }
        }

        /// <summary>
        /// Changes current provider. Use JDash.JDashManager.Provider property
        /// to get a reference to the current provider.
        /// </summary>
        /// <param name="providerName">Name of provider.</param>
        public static void ChangeProvider(string providerName)
        {
            JDashProvider newProvider = null;
            try
            {
                 newProvider = Providers[providerName];
                 activeProvider = newProvider;
            }
            catch (Exception)
            {
                throw new ArgumentException(string.Format("{0} is not found in provider list. Check web.config JDash/Providers section"));
            }            
        }


        static JDashManager()
        {
            DashboardSettingsSection section =
            ConfigurationManager.GetSection("JDash") as DashboardSettingsSection;
            var authEnabled = section.AuthorizationEnabled;
            var adminRoles = section.PrivilegedRoles;
            providers = new JDashProviderCollection();
            foreach (ProviderSettings settings in section.Providers)
            {
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
                config["authorizationEnabled"] = Convert.ToString(authEnabled);
                if (string.IsNullOrEmpty(config["privilegedRoles"]))
                    config["privilegedRoles"] = adminRoles;
                p.Initialize(settings.Name, config);
                providers.Add(p);
            }            
            activeProvider = providers[section.DefaultProvider];
            
        }

        /// <summary>
        /// Returns id of current user. By default Thread.CurrentPrincipal.Identity.Name property is used to get current user name.
        /// This can be changed by setting a handler using <seealso cref="JDash.JDashManager.CurrentUserCallback"/>.
        /// </summary>
        public static string CurrentUser
        {
            get
            {
                string userName = Thread.CurrentPrincipal.Identity.Name;

                if (CurrentUserCallback != null)
                {
                    var args = new UserInfoEventArgs(userName);
                    CurrentUserCallback(JDashManager.Provider, args);
                    userName = args.Username;
                }
                return userName;
            }
        }
    }
}
