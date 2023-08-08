using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.ComponentModel;
using System.IO;
using System.Web;
using System.Collections;
using System.Globalization;
using System.Collections.Specialized;
using System.ComponentModel.Design;
using System.Security.Cryptography;
using System.Xml;
using System.Xml.Serialization;
using System.Security;
using Microsoft.Win32;
using System.Windows.Forms;
using System.Security.Cryptography.Xml;
using JDash.Helpers;
using System.Reflection;
using JDash.Service.ProductRegistration;
using JDash.WebForms.Design;
using System.Management;
using JDash.JDashRegistrationService;

namespace JDash.WebForms
{


    public class LicenseData
    {
        public string RegistrationName { get; set; }
        public string ProductID { get; set; }
        public DateTime PurchaseDate { get; set; }
        public string Domain { get; set; }
        public string Version { get; set; }
        public DateTime SubscriptionEndDate { get; set; }
        internal LicenseData()
        {
        }
    }

    internal enum LicenseTypeInfo
    {
        Full = 0,
        Domain = 1,
    }

    internal class DemoLicense : License
    {
        internal Type _type;
        private DashboardLicenseProvider _owner;

        public DemoLicense(DashboardLicenseProvider owner, Type type)
        {
            _type = type;
            _owner = owner;
        }

        public override string LicenseKey
        {
            get
            {
                return "Unlicensed";
            }
        }

        public Type LicensedType
        {
            get
            {
                return _type;
            }
        }

        public override void Dispose()
        {
        }
    }

    internal class DashboardLicense : License
    {
        internal Type _type;
        internal XmlDocument xmlDoc = new XmlDocument();
        private DashboardLicenseProvider _owner;
        private string file;

        public DashboardLicense(DashboardLicenseProvider owner, Type type, string key)
        {
            _type = type;
            _owner = owner;
            if (!key.EndsWith(">"))
                key = key + ">";
            file = key;

            xmlDoc.LoadXml(key);


        }

        internal string LicenceFileContents
        {
            get
            {
                return file;
            }
        }

        public LicenseTypeInfo LicenseType
        {
            get
            {
                return string.IsNullOrEmpty(Domain) ? LicenseTypeInfo.Full : LicenseTypeInfo.Domain;
            }
        }

        public string Version
        {
            get
            {
                return xmlDoc.SelectSingleNode("LicenseData/Version").InnerText;
            }
        }



        public DateTime PurchaseDate
        {
            get
            {
                string data = xmlDoc.SelectSingleNode("LicenseData/PurchaseDate").InnerText;
                try
                {
                    return DateTime.Parse(data, System.Globalization.CultureInfo.InvariantCulture);
                }
                catch
                {
                    return DateTime.MinValue;
                }
            }
        }

        public DateTime SubscriptionEndDate
        {
            get
            {

                try
                {
                    string data = xmlDoc.SelectSingleNode("LicenseData/SubscriptionEndDate").InnerText;
                    return DateTime.Parse(data, System.Globalization.CultureInfo.InvariantCulture);
                }
                catch
                {
                    return DateTime.MinValue;
                }
            }
        }


        public string ProductID
        {
            get
            {
                return xmlDoc.SelectSingleNode("LicenseData/ProductID").InnerText;
            }
        }


        public string Domain
        {
            get
            {
                return xmlDoc.SelectSingleNode("LicenseData/ExtraData").InnerText;
            }
        }

        public string RegistrationName
        {
            get
            {
                return xmlDoc.SelectSingleNode("LicenseData/RegistrationName").InnerText;
            }
        }

        public override string LicenseKey
        {
            get
            {
                return (xmlDoc.GetElementsByTagName("Signature", SignedXml.XmlDsigNamespaceUrl)[0]).InnerText;
            }
        }



        public Type LicensedType
        {
            get
            {
                return _type;
            }
        }

        public override void Dispose()
        {
        }
    }

    internal class DashboardLicenseProvider : LicenseProvider
    {

        internal static bool VerifyXmlDocument(RSA key, XmlDocument doc)
        {
            SignedXml sxml = new SignedXml(doc);
            try
            {
                XmlNode sig = doc.GetElementsByTagName("Signature", SignedXml.XmlDsigNamespaceUrl)[0];

                sxml.LoadXml((XmlElement)sig);
            }
            catch
            {
                return false;
            }

            bool result = sxml.CheckSignature(key);

            return result;
        }


        private bool IsKeyValid(string key, Type type)
        {
            //DateTime finish = new DateTime(2011, 7, 15);

            //if (DateTime.Now > finish)
            //    throw new InvalidDataException("Product expired");

            string publicXml = "<RSAKeyValue><Modulus>sbo3mgJECWS8zFsErbi3XlP5Q74xU+VH1h54ntuZpGDqKln7ZGEEOswWm8nWkbQT7JXtQc5ew9CUhUns5FOu/wEtBCGv5lnTv4HP7FwPVEDrJ6cvlGIhf1B43NYYcyOaLb4SRuNGsnmZ8CGdu/xcvHiVvfBOaOaiIBbDpn+SNok=</Modulus><Exponent>AQAB</Exponent></RSAKeyValue>";

            RSACryptoServiceProvider rsa = new RSACryptoServiceProvider(512);
            rsa.FromXmlString(publicXml);

            XmlDocument doc = new XmlDocument();
            doc.PreserveWhitespace = true;
            if (!key.EndsWith(">"))
                key = key + ">";
            doc.LoadXml(key);

            bool signatureValid = VerifyXmlDocument(rsa, doc);
            if (signatureValid)
            {
                if (HttpContext.Current != null)
                {
                    string domain = (doc.SelectSingleNode("LicenseData/ExtraData")).InnerText;
                    if (!string.IsNullOrEmpty(domain))
                    {
                        try
                        {
                            domain = domain.Trim();
                            if (!domain.StartsWith("http://") || !domain.StartsWith("https://"))
                                domain = "http://" + domain;
                            string licenseHost = new Uri(domain).Host.ToLowerInvariant();
                            string current = HttpContext.Current.Request.Url.Host.ToLowerInvariant();

                            if (current == "localhost" || current == "127.0.0.1")
                                return true;
                            else
                                //return (string.Compare(licenseHost, current, true) == 0);
                                return current.EndsWith(licenseHost, StringComparison.InvariantCultureIgnoreCase);
                        }
                        catch
                        {
                            return false;
                        }
                    }
                    else
                    {
                        var product = "";
                        try
                        {
                            product = (doc.SelectSingleNode("LicenseData/Product")).InnerText;
                        }
                        catch
                        {

                        }
                        return product == "" || product.Contains("Asp.Net WebForms");
                    }
                }
                else return true;
            }
            else return false;
        }

        private string GetKey(string key, Type type)
        {
            return key;
        }

        protected String GetBinAssemblyLocation(Type t)
        {
            Uri uri = new Uri(Path.GetDirectoryName(t.Module.Assembly.CodeBase));
            return uri.LocalPath;
        }



        public override License GetLicense(LicenseContext context, Type type, object instance, bool allowExceptions)
        {

            License license = new DemoLicense(this, type);

#if REGISTERED_VERSION
            string path = GetLicenseFilePath(context, type);

            if (File.Exists(path))
            {
                Stream stream = new FileStream(path, FileMode.Open, FileAccess.Read, FileShare.Read);
                StreamReader reader = new StreamReader(stream, Encoding.UTF8);
                string key = reader.ReadToEnd();
                stream.Close();
                if (this.IsKeyValid(key, type))
                {
                    license = new DashboardLicense(this, type, this.GetKey(key, type));

                    if (LicenseManager.CurrentContext.UsageMode == LicenseUsageMode.Designtime)
                    {
                        DashboardLicenseManager manager = new DashboardLicenseManager(type, instance, license);
                    }
                }
                else if (allowExceptions) throw new LicenseException(type, instance, "Invalid license");
            }
            else
            {

                if (LicenseManager.CurrentContext.UsageMode == LicenseUsageMode.Designtime)
                {
                    if (path != @"\JDash.lic")
                        MessageBox.Show("Please copy your license file to the directory in which JDash.WebForms.dll is located." + Environment.NewLine +
                            "Also add your license file to your project and set it's Copy To Output property Always." + Environment.NewLine +
                            "Path:" + path);
                }
                throw new LicenseException(type, instance, "Cannot locate license file at " + path);
            }


#else
             if (LicenseManager.CurrentContext.UsageMode == LicenseUsageMode.Designtime)
             {
                 DashboardLicenseManager manager = new DashboardLicenseManager(type, instance, license);
             }
#endif


            return license;
        }


        private string GetLicenseFileFromDialog()
        {
            OpenFileDialog ofd = new OpenFileDialog();
            ofd.Title = "Please select JDash.lic license file";
            ofd.Filter = "(*.lic)|*.lic";
            if (ofd.ShowDialog() == DialogResult.OK)
            {
                var file = ofd.FileName.Trim();
                if (File.Exists(file))
                {
                    return file;
                }
            }
            return null;
        }

        private string GetLicenseFilePath(LicenseContext context, Type type)
        {
            var path = GetBinAssemblyLocation(type) + @"\" + "JDash" + ".lic";
            if (context != null)
            {
                ITypeResolutionService service = (ITypeResolutionService)context.GetService(typeof(ITypeResolutionService));
                if (service != null)
                {
                    path = service.GetPathOfAssembly(type.Assembly.GetName());
                    path = Path.GetDirectoryName(path) + @"\" + "JDash" + ".lic";
                }
            }
            if (HttpContext.Current != null)
            {
                return path;
            }
            if (!File.Exists(path))
            {
                path = Registry.GetValue(@"HKEY_CURRENT_USER\SOFTWARE\Kalitte\JDash", "LicensePath", null) as string;
                if (string.IsNullOrEmpty(path))
                {
                    var file = GetLicenseFileFromDialog();
                    if (!string.IsNullOrEmpty(file))
                    {
                        var key = Registry.CurrentUser.CreateSubKey(@"SOFTWARE\Kalitte\JDash");
                        key.SetValue("LicensePath", file);
                        path = file;
                    }
                }
            }


            return path;




        }
    }



    internal class DashboardLicenseManager
    {
        private License license;
        private Type type;
        private object instance;

        public DashboardLicenseManager(Type type, object instance, License licenseGot)
        {

            this.type = type;
            this.instance = instance;
            this.license = licenseGot;

            if (LicenseManager.CurrentContext.UsageMode == LicenseUsageMode.Designtime)
            {
                if (licenseGot == null)
                {
                    try
                    {
                        license = LicenseManager.Validate(type, instance);
                    }
                    catch (LicenseException)
                    {
                        throw;
                    }
                }


                ValidateDesignTimeLicense();
            }
            else if (licenseGot == null)
            {
                license = LicenseManager.Validate(type, instance);
            }
            ValidateSubscriptionLicense();
        }

        internal void ValidateSubscriptionLicense()
        {
            if (license is DashboardLicense)
            {
                DashboardLicense dLicense = (DashboardLicense)license;
                if (!DashboardLicenseManager.ValidateSubscription(dLicense, type, instance))
                {
                    if (dLicense.SubscriptionEndDate == DateTime.MinValue)
                    {
                        MessageBox.Show("This version of JDash requires a new license file. Please send an e-mail to support@jdash.net **including your current license file** to get a new license file.");
                    }

                    throw new LicenseException(type, instance, "Subscription ended! You are not allowed to use this version with your license key");
                }
            }
        }

        public DashboardLicenseManager(Type type, object instance)
            : this(type, instance, null)
        {

        }



        internal static bool ValidateSubscription(DashboardLicense license, Type type, object instance)
        {
            DateTime purchaseDate = license.PurchaseDate;
            //MessageBox.Show(license.PurchaseDate.Month.ToString());
            //DateTime subscriptionEndDate = purchaseDate.AddYears(1);
            if (SettingUtils.GetBuildDate().Date > license.SubscriptionEndDate.Date)
            {
                return false;
            }
            return true;
        }


        private void ValidateDesignTimeLicense()
        {
#if REGISTERED_VERSION
            if (!IsDesignTimeLicenseValid())
            {
                throw new LicenseException(type, instance, "Please register your product for this computer. You should purchase a license for each vs.net.");
            }
#else
            if (!IsDesignTimeLicenseValid())
                {
                    throw new LicenseException(type, instance, "Trial period has ellapsed. Visit www.jdash.net to have a license.");                     
                }
#endif


        }

        internal bool IsTrial()
        {
            return license == null || (license is DemoLicense);
        }


        internal string GetUniqueWorkstationID()
        {
            string result = null;
            try
            {
                ManagementObjectSearcher searcher = new ManagementObjectSearcher("select * from Win32_BIOS");
                var mos = searcher.Get();
                foreach (ManagementObject mo in mos)
                {
                    var sn = mo["SerialNumber"];
                    if (sn != null && !string.IsNullOrEmpty(sn.ToString())) result = sn.ToString();
                }
            }
            catch (Exception)
            {
                result = "UnknownNumber";
            }
            finally
            {
                if (result == null) result = "UnknownNumber";
                using (System.Security.Cryptography.MD5 md5 = System.Security.Cryptography.MD5.Create())
                {
                    result = BitConverter.ToString(md5.ComputeHash(Encoding.UTF8.GetBytes(result))).Replace("-", String.Empty);
                }
            }
            return result;
        }

        internal int RegisterProduct()
        {
            var client = new JDashRegistrationProxy();
            ProductRegistrationInfo info = new ProductRegistrationInfo();
            info.Key = (license as DashboardLicense).LicenceFileContents;
            info.ControlData = DateTime.Now.ToString("dd/MM/yyyy hh:mm:ss:ms");
            info.CurrentRegistryLicenseKey = GetRegistryLicenseKey();
            info.WorkstationID = GetUniqueWorkstationID();
            ProductRegistrationInfoRet retVal;
            string registrationKey = "";
            int res = -1;
            try
            {
                retVal = client.RegisterProduct(info, new AuthencticationInfo("JDashClientRegistration", "JDashCert2013Klt"));
                registrationKey = retVal.LicenceKey;
                ValidateControlData(info.ControlData, retVal.ControlResult);
                res = retVal.RegistrationCount;
            }
            catch (Exception exc)
            {
                MessageBox.Show(exc.Message + " " + exc.StackTrace);
                while (exc.InnerException != null)
                {
                    exc = exc.InnerException;
                    MessageBox.Show(exc.Message + " " + exc.StackTrace);
                }
                //System.Diagnostics.Process.Start("http://www.jdash.net/Pages/Registration/");
                return -1;
                //MessageBox.Show(exc.StackTrace + "." + exc.InnerException.Message);
                //MessageBox.Show(exc.InnerException.StackTrace + "." + exc.InnerException.GetType().Name);

            }
            if (!string.IsNullOrEmpty(registrationKey))
            {
                try
                {
                    string publicDesignXml = "<RSAKeyValue><Modulus>1xb7KiH7wXWwXwfUzoEudgAemQ/HHlAYLtdB8k0cpCfjo1NBUAUcEK1R1Ag4WDW2N7WIXMBCAEWzBKuYkXA2GxsIPLYwVqtLZThFLyXUjFiq3GgB6rv+7CtMUYaOn7WrkZZrP75NlA2SKKPlW31yINsKesk7lJA72RhypNgLIN0=</Modulus><Exponent>AQAB</Exponent></RSAKeyValue>";

                    RSACryptoServiceProvider rsa = new RSACryptoServiceProvider(512);
                    rsa.FromXmlString(publicDesignXml);

                    XmlDocument doc = new XmlDocument();
                    doc.PreserveWhitespace = true;
                    doc.LoadXml(registrationKey);

                    bool signatureValid = DashboardLicenseProvider.VerifyXmlDocument(rsa, doc);

                    if (!signatureValid)
                        throw new ArgumentException("Err in reg: Code 1");

                    long regDateBin = long.Parse(doc.SelectSingleNode("DesignLicenseData/RegistrationDate").InnerText);


                    DateTime regDate = DateTime.FromBinary(regDateBin);

                    if (regDate < DateTime.Now.AddDays(-1) || regDate > DateTime.Now.AddDays(1))
                        throw new ArgumentException("Err in reg: Code 2");


                    byte[] value = Encoding.UTF8.GetBytes(registrationKey);
                    byte[] entrophy = Encoding.UTF8.GetBytes("pEncere-.**-+,32qaqqq>£#$,}=$$$$");
                    byte[] enc = ProtectedData.Protect(value, entrophy, DataProtectionScope.LocalMachine);
                    Registry.SetValue(@"HKEY_CURRENT_USER\SOFTWARE\Kalitte\JDash", "LicenseInfo", enc);
                    if (res == 0)
                        MessageBox.Show("Product registration successfull. Please re-start visual studio.net");
                    else MessageBox.Show("Product registration successfull. Please re-start visual studio.net.");
                }
                catch (Exception exc)
                {
                    MessageBox.Show(exc.Message + " " + exc.StackTrace);
                }
            }
            else
            {
                MessageBox.Show("Product registration unsuccessfull.");
            }
            return res;
        }

        private void ValidateControlData(string controlData, string controlResult)
        {
            string publicDesignXml = "<RSAKeyValue><Modulus>1xb7KiH7wXWwXwfUzoEudgAemQ/HHlAYLtdB8k0cpCfjo1NBUAUcEK1R1Ag4WDW2N7WIXMBCAEWzBKuYkXA2GxsIPLYwVqtLZThFLyXUjFiq3GgB6rv+7CtMUYaOn7WrkZZrP75NlA2SKKPlW31yINsKesk7lJA72RhypNgLIN0=</Modulus><Exponent>AQAB</Exponent></RSAKeyValue>";

            RSACryptoServiceProvider rsa = new RSACryptoServiceProvider(512);
            rsa.FromXmlString(publicDesignXml);

            XmlDocument doc = new XmlDocument();
            doc.PreserveWhitespace = true;
            doc.LoadXml(controlResult);

            bool signatureValid = DashboardLicenseProvider.VerifyXmlDocument(rsa, doc);

            if (!signatureValid)
                throw new InvalidOperationException("Invalid control data");

            if (doc.SelectSingleNode("ControlData/Data").InnerText != controlData)
                throw new InvalidOperationException("Invalid control data result");
        }

        internal string GetRegistryLicenseKey()
        {
            byte[] existingValue = Registry.GetValue(@"HKEY_CURRENT_USER\SOFTWARE\Kalitte\JDash", "LicenseInfo", null) as byte[];
            if (existingValue == null)
                return "";
            else
            {
                byte[] entrophy = Encoding.UTF8.GetBytes("pEncere-.**-+,32qaqqq>£#$,}=$$$$");
                byte[] value = ProtectedData.Unprotect(existingValue, entrophy, DataProtectionScope.LocalMachine);
                string key = Encoding.UTF8.GetString(value);

                string publicDesignXml = "<RSAKeyValue><Modulus>1xb7KiH7wXWwXwfUzoEudgAemQ/HHlAYLtdB8k0cpCfjo1NBUAUcEK1R1Ag4WDW2N7WIXMBCAEWzBKuYkXA2GxsIPLYwVqtLZThFLyXUjFiq3GgB6rv+7CtMUYaOn7WrkZZrP75NlA2SKKPlW31yINsKesk7lJA72RhypNgLIN0=</Modulus><Exponent>AQAB</Exponent></RSAKeyValue>";

                RSACryptoServiceProvider rsa = new RSACryptoServiceProvider(512);
                rsa.FromXmlString(publicDesignXml);

                XmlDocument doc = new XmlDocument();
                doc.PreserveWhitespace = true;
                if (!key.EndsWith(">"))
                    key = key + ">";
                doc.LoadXml(key);

                string licenseKeyInRegistry = doc.SelectSingleNode("DesignLicenseData/LicenseKey").InnerText;

                bool signatureValid = DashboardLicenseProvider.VerifyXmlDocument(rsa, doc);
                if (signatureValid)
                    return licenseKeyInRegistry;
                else return "";
            }
        }


        internal bool RegistrationDone()
        {

            byte[] existingValue = Registry.GetValue(@"HKEY_CURRENT_USER\SOFTWARE\Kalitte\JDash", "LicenseInfo", null) as byte[];
            if (existingValue == null)
                return false;
            else
            {
                byte[] entrophy = Encoding.UTF8.GetBytes("pEncere-.**-+,32qaqqq>£#$,}=$$$$");
                byte[] value = ProtectedData.Unprotect(existingValue, entrophy, DataProtectionScope.LocalMachine);
                string key = Encoding.UTF8.GetString(value);

                string publicDesignXml = "<RSAKeyValue><Modulus>1xb7KiH7wXWwXwfUzoEudgAemQ/HHlAYLtdB8k0cpCfjo1NBUAUcEK1R1Ag4WDW2N7WIXMBCAEWzBKuYkXA2GxsIPLYwVqtLZThFLyXUjFiq3GgB6rv+7CtMUYaOn7WrkZZrP75NlA2SKKPlW31yINsKesk7lJA72RhypNgLIN0=</Modulus><Exponent>AQAB</Exponent></RSAKeyValue>";

                RSACryptoServiceProvider rsa = new RSACryptoServiceProvider(512);
                rsa.FromXmlString(publicDesignXml);

                XmlDocument doc = new XmlDocument();
                doc.PreserveWhitespace = true;
                if (!key.EndsWith(">"))
                    key = key + ">";
                doc.LoadXml(key);

                string licenseKeyInRegistry = doc.SelectSingleNode("DesignLicenseData/LicenseKey").InnerText;

                bool signatureValid = DashboardLicenseProvider.VerifyXmlDocument(rsa, doc);

                if (license is DashboardLicense)
                {
                    DashboardLicense dLic = (DashboardLicense)license;
                    if (dLic.LicenseKey != licenseKeyInRegistry)
                    {
                        //MessageBox.Show(licenseKeyInRegistry);
                        //MessageBox.Show(dLic.LicenseKey);
                        MessageBox.Show("It seems you have replaced your license file but current registration data on your computer seems wrong. Please register again.");
                        return false;
                    }

                }


                return signatureValid;
            }
        }



        internal bool IsDesignTimeLicenseValid()
        {
#if REGISTERED_VERSION
            if (RegistrationDone())
                return true;
#endif
            byte[] existingValue = Registry.GetValue(@"HKEY_CURRENT_USER\SOFTWARE\Kalitte\JDash", "SetupDate", null) as byte[];

            if (existingValue == null)
            {
                byte[] value = Encoding.UTF8.GetBytes(DateTime.Now.AddDays(0).ToBinary().ToString());
                byte[] entrophy = Encoding.UTF8.GetBytes("pEncere-.**-+,32qaqqq>£#$,}=$$$$");
                byte[] enc = ProtectedData.Protect(value, entrophy, DataProtectionScope.CurrentUser);

                Registry.SetValue(@"HKEY_CURRENT_USER\SOFTWARE\Kalitte\JDash", "SetupDate", enc);
                Registry.CurrentUser.Flush();
                existingValue = Registry.GetValue(@"HKEY_CURRENT_USER\SOFTWARE\Kalitte\JDash", "SetupDate", null) as byte[];
            }
            if (existingValue == null)
            {
                throw new LicenseException(type, instance, "install date");
            }
            else
            {
                byte[] entrophy = Encoding.UTF8.GetBytes("pEncere-.**-+,32qaqqq>£#$,}=$$$$");
                byte[] value = ProtectedData.Unprotect(existingValue, entrophy, DataProtectionScope.CurrentUser);
                string valueAsStr = Encoding.UTF8.GetString(value);
                DateTime date = DateTime.FromBinary(long.Parse(valueAsStr));
                int days = (DateTime.Now.Date - date.Date).Days;

#if REGISTERED_VERSION

                if (!RegistrationDone())
                {
                    new FmAbout().Execute(this);
                    return false;
                    //if (days > 5 && days <= 10)
                    //{
                    //    if (!registrationWarningDisplayed)
                    //    {
                    //        registrationWarningDisplayed = true;
                    //        MessageBox.Show("You should register your product in a couple of days. Please select DashboardSurface control, click it's smart tag and open AboutBox to register it online.");
                    //    }
                    //    return true;
                    //}
                    //else if (days > 10)
                    //{
                    //    new FmAbout().Execute(this);
                    //    return false;
                    //}
                    //else return true;
                }
                else return true;
#else
                    if (days > 90)
                    {
                        new FmAbout().Execute(this);
                        return false;
                    }
                    else return true;

#endif


            }
        }

        internal void Dispose()
        {
            if (license != null)
            {
                license.Dispose();
                license = null;
            }
        }




        internal bool IsLicenseExistsNoLocal
        {
            get
            {
                bool flag = license is DashboardLicense;
                return flag;
            }
        }

        internal void ValidateLicenseExistence()
        {
            if (!IsLicenseExists)
            {
                throw new LicenseException(type, instance, "Product is not registered.");
            }
        }

        internal bool IsLicenseExists
        {
            get
            {
                bool flag = license is DashboardLicense;
                if (!flag)
                    return IsLocal;
                else return flag;
            }
        }

        internal bool IsLocal
        {
            get
            {
                //return false;
                if (HttpContext.Current == null || HttpContext.Current.Request == null)
                    return true;
                else
                    return (HttpContext.Current.Request.Url.Host.ToLowerInvariant() == "localhost" ||
                        HttpContext.Current.Request.Url.Host.ToLowerInvariant() == "127.0.0.1");
            }
        }

        internal LicenseData GetLicenseData()
        {
            if (license is DashboardLicense)
            {
                LicenseData data = new LicenseData();
                DashboardLicense dlic = (DashboardLicense)license;
                data.Domain = dlic.Domain;
                data.ProductID = dlic.ProductID;
                data.PurchaseDate = dlic.PurchaseDate;
                data.RegistrationName = dlic.RegistrationName;
                data.Version = dlic.Version;
                data.SubscriptionEndDate = dlic.SubscriptionEndDate;
                return data;
            }
            else return null;
        }

        internal License GetLicense()
        {
            return license;
        }
    }

}
