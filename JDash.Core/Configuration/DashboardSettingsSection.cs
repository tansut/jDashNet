using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Configuration;

namespace JDash.Configuration
{
    public sealed class DashboardSettingsSection : ConfigurationSection
    {
        private static readonly ConfigurationProperty _propDefaultProvider;


        private static ConfigurationPropertyCollection _properties;
        private static readonly ConfigurationProperty _propProviders;
        private static readonly ConfigurationProperty _authEnabled;
        private static readonly ConfigurationProperty _adminRoles;
        private static readonly ConfigurationProperty _knownRoleProvider;
        private static readonly ConfigurationProperty _customRoleProvider;
        private static readonly ConfigurationProperty _apiPath;
        private static readonly ConfigurationProperty _autoCreateMetadata;
        private static readonly ConfigurationProperty _jdashController;

        


        static DashboardSettingsSection()
        {
            _propProviders = new ConfigurationProperty("providers", typeof(ProviderSettingsCollection), null, ConfigurationPropertyOptions.None);
            _propDefaultProvider = new ConfigurationProperty("defaultProvider", typeof(string), "SQLDashboardProvider");
            _properties = new ConfigurationPropertyCollection();
            _authEnabled = new ConfigurationProperty("authorizationEnabled", typeof(bool), false);
            _adminRoles = new ConfigurationProperty("privilegedRoles", typeof(string), null);
            _knownRoleProvider = new ConfigurationProperty("knownRoleProvider", typeof(string), null);
            _customRoleProvider = new ConfigurationProperty("roleProvider", typeof(string), null);
            _apiPath = new ConfigurationProperty("apiPath", typeof(string), "jdash/api/");
            _autoCreateMetadata = new ConfigurationProperty("autoCreateMetadata", typeof(bool), true);
            _jdashController = new ConfigurationProperty("jDashController", typeof(bool), true);

            
            _properties.Add(_propProviders);
            _properties.Add(_propDefaultProvider);
            _properties.Add(_authEnabled);
            _properties.Add(_adminRoles);
            _properties.Add(_knownRoleProvider);
            _properties.Add(_customRoleProvider);
            _properties.Add(_apiPath);
            _properties.Add(_autoCreateMetadata);
            _properties.Add(_jdashController);
        }

        public DashboardSettingsSection()
        {
        }

        [StringValidator(MinLength = 1), ConfigurationProperty("defaultProvider", DefaultValue = "SQLDashboardProvider")]
        public string DefaultProvider
        {
            get
            {
                return (string)base[_propDefaultProvider];
            }
            set
            {
                base[_propDefaultProvider] = value;
            }
        }

        [ConfigurationProperty("authorizationEnabled", DefaultValue = false)]
        public bool AuthorizationEnabled
        {
            get
            {
                return (bool)base[_authEnabled];
            }
            set
            {
                base[_authEnabled] = value;
            }
        }

        [ConfigurationProperty("autoCreateMetadata", DefaultValue = true)]
        public bool AutoCreateMetadata
        {
            get
            {
                return (bool)base[_autoCreateMetadata];
            }
            set
            {
                base[_autoCreateMetadata] = value;
            }
        }

        [ConfigurationProperty("jDashController", DefaultValue = true)]
        public bool JDashController
        {
            get
            {
                return (bool)base[_jdashController];
            }
            set
            {
                base[_jdashController] = value;
            }
        }


        [ConfigurationProperty("apiPath", DefaultValue = "jdash/api/")]
        public string ApiPath
        {
            get
            {
                return base[_apiPath] == null ? null : base[_apiPath].ToString();
            }
            set
            {
                base[_apiPath] = value;
            }
        }

        [ConfigurationProperty("privilegedRoles", DefaultValue = null)]
        public string PrivilegedRoles
        {
            get
            {
                return base[_adminRoles] == null ? null : base[_adminRoles].ToString();
            }
            set
            {
                base[_adminRoles] = value;
            }
        }


        [ConfigurationProperty("knownRoleProvider", DefaultValue = null)]
        public string KnownRoleProvider
        {
            get
            {
                return base[_knownRoleProvider] == null ? null : base[_knownRoleProvider].ToString();
            }
            set
            {
                base[_knownRoleProvider] = value;
            }
        }

        [ConfigurationProperty("roleProvider", DefaultValue = null)]
        public string CustomRoleProvider
        {
            get
            {
                return base[_customRoleProvider] == null ? null : base[_customRoleProvider].ToString();
            }
            set
            {
                base[_customRoleProvider] = value;
            }
        }


        protected override ConfigurationPropertyCollection Properties
        {
            get
            {
                return _properties;
            }
        }

        [ConfigurationProperty("providers")]
        public ProviderSettingsCollection Providers
        {
            get
            {
                return (ProviderSettingsCollection)base[_propProviders];
            }
        }
    }


}

