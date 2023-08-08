using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Runtime.Serialization;
using System.Security.Cryptography;
using System.Security.Cryptography.Xml;
using System.ServiceModel;
using System.Text;
using System.Xml;


namespace JDash.ProductRegistration
{
    public class RegistrationService : IJDashRegistrationService
    {

        private JDashRegistrationEntities dbContext = null;

        internal JDashRegistrationEntities Db
        {
            get
            {
                if (dbContext == null)
                    dbContext = new JDashRegistrationEntities();
                return dbContext;
            }
        }

        #region PrivateMethods


        private static void SignXmlDocument(RSA key, XmlDocument doc)
        {
            SignedXml sxml = new SignedXml(doc);
            sxml.SigningKey = key;
            sxml.SignedInfo.CanonicalizationMethod = SignedXml.XmlDsigCanonicalizationUrl;

            Reference r = new Reference("");
            r.AddTransform(new XmlDsigEnvelopedSignatureTransform(false));
            sxml.AddReference(r);

            sxml.ComputeSignature();

            XmlElement sig = sxml.GetXml();

            doc.DocumentElement.AppendChild(doc.ImportNode(sig, true));
        }

        private static bool VerifyXmlDocument(RSA key, XmlDocument doc)
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
            return sxml.CheckSignature(key);
        }

        private void VerifyRuntimeLicense(string key)
        {
            string publicXml = "<RSAKeyValue><Modulus>sbo3mgJECWS8zFsErbi3XlP5Q74xU+VH1h54ntuZpGDqKln7ZGEEOswWm8nWkbQT7JXtQc5ew9CUhUns5FOu/wEtBCGv5lnTv4HP7FwPVEDrJ6cvlGIhf1B43NYYcyOaLb4SRuNGsnmZ8CGdu/xcvHiVvfBOaOaiIBbDpn+SNok=</Modulus><Exponent>AQAB</Exponent></RSAKeyValue>";

            RSACryptoServiceProvider rsa = new RSACryptoServiceProvider(512);
            rsa.FromXmlString(publicXml);

            XmlDocument doc = new XmlDocument();
            doc.PreserveWhitespace = true;
            if (!key.EndsWith(">"))
                key = key + ">";
            doc.LoadXml(key);

            bool signatureValid = VerifyXmlDocument(rsa, doc);

            if (!signatureValid)
                throw new Exception("Your license file does not seem valid");
        }

        private void VerifyRegistrationValidity(string key, string existingRuntimeLicense, string workstationID)
        {
            XmlDocument runTimedoc = new XmlDocument();
            runTimedoc.PreserveWhitespace = true;
            runTimedoc.LoadXml(key);

            DateTime purchaseDate = DateTime.Parse(runTimedoc.SelectSingleNode("LicenseData/PurchaseDate").InnerText, System.Globalization.CultureInfo.InvariantCulture);
            string ProductID = runTimedoc.SelectSingleNode("LicenseData/ProductID").InnerText;
            string registrationName = runTimedoc.SelectSingleNode("LicenseData/RegistrationName").InnerText;

            Registration reg = Db.Registration.SingleOrDefault(p => p.PurchaseDate == purchaseDate &&
                p.RegistrationName == registrationName);
            if (reg == null)
                reg = Db.Registration.SingleOrDefault(p => p.CorrectedPurchaseDate == purchaseDate &&
                p.RegistrationName == registrationName);

            if (reg != null)
            {
                if (!string.IsNullOrEmpty(existingRuntimeLicense))
                {
                    if (reg.RuntimeLicenseKey == existingRuntimeLicense ||
                        reg.PreviousRuntimeLicenseKey == existingRuntimeLicense)
                    {

                        if (reg.SubscriptionCount >= reg.SubscriptionLimit)
                            throw new Exception("Subscription limit exception. You cannot register on more computers");
                    }
                    else throw new Exception("Invalid existingRuntimeLicense");
                }
                else if (reg.RegistrationCount >= reg.RegistrationLimit)
                {
                      var ws = reg.Workstation.ToList();
                      if (!ws.Any(a => a.WorkstationID == workstationID))
                      {
                          throw new Exception("Registration limit exception. You cannot register on more computers");
                      }
                    
                }
            }
        }

        private int PersistRegistration(string key, string designTimeLicense, string existingLicenseKey, string workstationID)
        {
            XmlDocument runTimedoc = new XmlDocument();
            runTimedoc.PreserveWhitespace = true;
            runTimedoc.LoadXml(key);

            DateTime purchaseDate = DateTime.Parse(runTimedoc.SelectSingleNode("LicenseData/PurchaseDate").InnerText, System.Globalization.CultureInfo.InvariantCulture);
            DateTime subscriptionDate = DateTime.Parse(runTimedoc.SelectSingleNode("LicenseData/SubscriptionEndDate").InnerText, System.Globalization.CultureInfo.InvariantCulture);
            string ProductID = runTimedoc.SelectSingleNode("LicenseData/ProductID").InnerText;
            string registrationName = runTimedoc.SelectSingleNode("LicenseData/RegistrationName").InnerText;
            string runTimeLicense = runTimedoc.GetElementsByTagName("Signature", SignedXml.XmlDsigNamespaceUrl)[0].InnerText;
            int quantity = int.Parse(runTimedoc.SelectSingleNode("LicenseData/Quantity").InnerText);
            string version = runTimedoc.SelectSingleNode("LicenseData/Version").InnerText;

            Registration reg = Db.Registration.SingleOrDefault(p => p.PurchaseDate == purchaseDate &&
               p.RegistrationName == registrationName);
            if (reg == null)
                reg = Db.Registration.SingleOrDefault(p => p.CorrectedPurchaseDate == purchaseDate &&
                p.RegistrationName == registrationName);

            if (reg == null)
            {
                reg = new Registration();
                reg.PurchaseDate = purchaseDate;
                reg.RuntimeLicenseKey = runTimeLicense;
                reg.FirstRegistration = DateTime.Now;
                reg.RegistrationCount = 1;
                reg.RegistrationLimit = quantity * 2;
                reg.RegistrationName = registrationName;
                reg.Version = version;
                reg.ProductID = ProductID;
                reg.SubscriptionDate = subscriptionDate;
                reg.PreviousRuntimeLicenseKey = existingLicenseKey;
                reg.Workstation.Add(new Workstation() { WorkstationID = workstationID });
                Db.Registration.AddObject(reg);
            }
            else
            {
                if (string.IsNullOrEmpty(existingLicenseKey))
                {
                    var ws = reg.Workstation.ToList();
                    if (!ws.Any(a => a.WorkstationID == workstationID))
                    {
                        reg.Workstation.Add(new Workstation() { WorkstationID = workstationID });
                        reg.RegistrationCount = reg.RegistrationCount + 1;
                    }
                }
                else
                {
                    reg.PreviousRuntimeLicenseKey = existingLicenseKey;
                    reg.RuntimeLicenseKey = runTimeLicense;
                    reg.SubscriptionCount = reg.SubscriptionCount + 1;
                    var ws = reg.Workstation.ToList();
                    if (!ws.Any(a => a.WorkstationID == workstationID))
                    {
                        reg.Workstation.Add(new Workstation() { WorkstationID = workstationID });
                    }
                }
            }
            Db.SaveChanges();

            return reg.RegistrationLimit - reg.RegistrationCount;
        }

        private string GetControlResult(string cdata)
        {
            string xml = "<RSAKeyValue><Modulus>1xb7KiH7wXWwXwfUzoEudgAemQ/HHlAYLtdB8k0cpCfjo1NBUAUcEK1R1Ag4WDW2N7WIXMBCAEWzBKuYkXA2GxsIPLYwVqtLZThFLyXUjFiq3GgB6rv+7CtMUYaOn7WrkZZrP75NlA2SKKPlW31yINsKesk7lJA72RhypNgLIN0=</Modulus><Exponent>AQAB</Exponent><P>7elpPzCPmgzRvFPEWchQ2aC1Ar41Z0bozUbVwxIlGf3QVegDNksC/3jrM9EzqdlxePLI3Sr0ii81tL/XIslyXQ==</P><Q>53Ff8iZGG9U3r5Bdu/+nWe0EmNcfnNlleKQGNep0lSyigiAnDSVDZQEbP58nf6VFFqW8aXVHI4fy6hNnkyKAgQ==</Q><DP>lISxfxEBlFmMVNS2LpYuYq1AUoYLMH3DtuIRb8VUA/W+qOI9nxcUuAb0TVS7u7xSaf6mBeta3Si7jip0UvMOwQ==</DP><DQ>MpXBFrfu0t6DUUgIdLKn7Su0uYMrUajiWL/g65/W41PiIPbOEj12wXjAb+NlSqzgsNaAm7waVFW+bhLXrHz6AQ==</DQ><InverseQ>ar+h3ida9LPCDHJ1OE8GbcIDagtcxpZ/3FB4J9On2z8kQOUToLKwUt1OIGTkYvZGnPYTkHEGrAYrMhaae1n24Q==</InverseQ><D>G3T1jwVTi/ioERmA0vOuqKWPQl6/PmFfFOupoXKyi0oERx8joUFlucNGRNjfyHLi1e24gI6SXlKHbbsx+K7oWQWKBMsasNmjH3LRmMdJs8ehFoYd/mbAZkuXy1fNIjPGW9RV9bH/eiBx0jt5VBdjZVhILd0EU65m3dhIvtLwRAE=</D></RSAKeyValue>";
            RSACryptoServiceProvider rsa = new RSACryptoServiceProvider(512);
            rsa.FromXmlString(xml);
            //XmlDocument doc = new XmlDocument();
            //doc.PreserveWhitespace = true;

            XmlDocument runTimedoc = new XmlDocument();
            runTimedoc.PreserveWhitespace = true;

            string key = string.Format("<ControlData xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\">" +
                                         "<Data>{0}</Data></ControlData>", cdata);

            runTimedoc.LoadXml(key);

            SignXmlDocument(rsa, runTimedoc);
            StringBuilder sbx = new StringBuilder();
            StringWriter writerx = new StringWriter(sbx);
            runTimedoc.Save(writerx);
            writerx.Close();
            if (!VerifyXmlDocument(rsa, runTimedoc))
                throw new Exception("Invalid control data produced. Cannot verify.");
            return sbx.ToString();
        }



        private string CreateRegistrationData(string key)
        {
            string xml = "<RSAKeyValue><Modulus>1xb7KiH7wXWwXwfUzoEudgAemQ/HHlAYLtdB8k0cpCfjo1NBUAUcEK1R1Ag4WDW2N7WIXMBCAEWzBKuYkXA2GxsIPLYwVqtLZThFLyXUjFiq3GgB6rv+7CtMUYaOn7WrkZZrP75NlA2SKKPlW31yINsKesk7lJA72RhypNgLIN0=</Modulus><Exponent>AQAB</Exponent><P>7elpPzCPmgzRvFPEWchQ2aC1Ar41Z0bozUbVwxIlGf3QVegDNksC/3jrM9EzqdlxePLI3Sr0ii81tL/XIslyXQ==</P><Q>53Ff8iZGG9U3r5Bdu/+nWe0EmNcfnNlleKQGNep0lSyigiAnDSVDZQEbP58nf6VFFqW8aXVHI4fy6hNnkyKAgQ==</Q><DP>lISxfxEBlFmMVNS2LpYuYq1AUoYLMH3DtuIRb8VUA/W+qOI9nxcUuAb0TVS7u7xSaf6mBeta3Si7jip0UvMOwQ==</DP><DQ>MpXBFrfu0t6DUUgIdLKn7Su0uYMrUajiWL/g65/W41PiIPbOEj12wXjAb+NlSqzgsNaAm7waVFW+bhLXrHz6AQ==</DQ><InverseQ>ar+h3ida9LPCDHJ1OE8GbcIDagtcxpZ/3FB4J9On2z8kQOUToLKwUt1OIGTkYvZGnPYTkHEGrAYrMhaae1n24Q==</InverseQ><D>G3T1jwVTi/ioERmA0vOuqKWPQl6/PmFfFOupoXKyi0oERx8joUFlucNGRNjfyHLi1e24gI6SXlKHbbsx+K7oWQWKBMsasNmjH3LRmMdJs8ehFoYd/mbAZkuXy1fNIjPGW9RV9bH/eiBx0jt5VBdjZVhILd0EU65m3dhIvtLwRAE=</D></RSAKeyValue>";
            RSACryptoServiceProvider rsa = new RSACryptoServiceProvider(512);
            rsa.FromXmlString(xml);
            XmlDocument doc = new XmlDocument();
            doc.PreserveWhitespace = true;

            XmlDocument runTimedoc = new XmlDocument();
            runTimedoc.PreserveWhitespace = true;
            runTimedoc.LoadXml(key);

            string licenseKey = runTimedoc.GetElementsByTagName("Signature", SignedXml.XmlDsigNamespaceUrl)[0].InnerText;
            doc.InnerXml = string.Format("<DesignLicenseData xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\">" +
                                         "<RegistrationDate>{0}</RegistrationDate>" +
                                         "<LicenseKey>{1}</LicenseKey></DesignLicenseData>", DateTime.Now.ToBinary(),
                                         licenseKey);
            SignXmlDocument(rsa, doc);
            StringBuilder sbx = new StringBuilder();
            StringWriter writerx = new StringWriter(sbx);
            doc.Save(writerx);
            writerx.Close();
            if (!VerifyXmlDocument(rsa, doc))
                throw new Exception("Invalid license produced. Cannot verify.");
            return sbx.ToString();
        }



        private void ValidateControlData(string controlData, string controlResult)
        {
            string publicDesignXml = "<RSAKeyValue><Modulus>1xb7KiH7wXWwXwfUzoEudgAemQ/HHlAYLtdB8k0cpCfjo1NBUAUcEK1R1Ag4WDW2N7WIXMBCAEWzBKuYkXA2GxsIPLYwVqtLZThFLyXUjFiq3GgB6rv+7CtMUYaOn7WrkZZrP75NlA2SKKPlW31yINsKesk7lJA72RhypNgLIN0=</Modulus><Exponent>AQAB</Exponent></RSAKeyValue>";

            RSACryptoServiceProvider rsa = new RSACryptoServiceProvider(512);
            rsa.FromXmlString(publicDesignXml);

            XmlDocument doc = new XmlDocument();
            doc.PreserveWhitespace = true;
            doc.LoadXml(controlResult);

            bool signatureValid = VerifyXmlDocument(rsa, doc);

            if (!signatureValid)
                throw new InvalidOperationException("Invalid control data");

            if (doc.SelectSingleNode("ControlData/Data").InnerText != controlData)
                throw new InvalidOperationException("Invalid control data result");
        }

        #endregion


        public ProductRegistrationInfoRet RegisterProduct(ProductRegistrationInfo info)
        {
            VerifyRuntimeLicense(info.Key);
            VerifyRegistrationValidity(info.Key, info.CurrentRegistryLicenseKey, info.WorkstationID);
            ProductRegistrationInfoRet result = new ProductRegistrationInfoRet();
            result.ControlResult = GetControlResult(info.ControlData);
            result.LicenceKey = CreateRegistrationData(info.Key);
            result.RegistrationCount = PersistRegistration(info.Key, result.LicenceKey, info.CurrentRegistryLicenseKey, info.WorkstationID);
            return result;
        }




        public bool Test()
        {
            return true;
        }
    }
}
