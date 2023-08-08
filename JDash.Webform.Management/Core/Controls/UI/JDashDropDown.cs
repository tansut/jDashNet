using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Linq;
using System.Reflection;
using System.Text;
using System.Threading.Tasks;
using System.Web.UI.WebControls;


namespace JDash.Webform.Management.Core.Controls.UI
{
    public class JDashDropDown : DropDownList
    {

        public string EnumType { get; set; }

        protected override void OnLoad(EventArgs e)
        {
            base.OnLoad(e);
            if (!Page.IsPostBack)
            {
                if (!string.IsNullOrWhiteSpace(EnumType))
                {
                    var result = GetDescriptionalEnumInfo(Type.GetType(EnumType));
                    this.DataValueField = "key";
                    this.DataTextField = "value";
                    this.DataSource = result;
                    this.DataBind();
                }
            }
        }

        private string GetEnumDescription(Type enumType, string enumItem)
        {
            string result = string.Empty;
            MemberInfo[] member = enumType.GetMember(enumItem);
            if (member != null && member.Length > 0)
            {
                object[] att = member[0].GetCustomAttributes(typeof(DescriptionAttribute), false);
                if (att != null)
                {
                    DescriptionAttribute desc = att.Where(p => p.GetType() == (typeof(DescriptionAttribute))).Select(u => (DescriptionAttribute)u).SingleOrDefault();
                    if (desc != null) result = desc.Description;
                }
            }
            return result;

        }

        private Dictionary<string, string> GetDescriptionalEnumInfo(Type enumType, Func<KeyValuePair<string, string>, bool> filter = null)
        {
            Dictionary<string, string> result = new Dictionary<string, string>();
            string[] names = Enum.GetNames(enumType);
            foreach (string item in names)
            {
                string desc;
                desc = GetEnumDescription(enumType, item);
                if (desc != string.Empty)
                {
                    result.Add(item, desc);
                }
                else
                {
                    result.Add(item, item);
                }
            }
            if (filter != null)
                result = result.Where(filter).ToDictionary(p => p.Key, p => p.Value);
            return result;
        }
    }
}
