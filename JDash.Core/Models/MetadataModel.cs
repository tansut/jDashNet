using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading;

namespace JDash.Models
{
    public class MetadataModel
    {
        public string description { get; set; }
        public string group { get; set; }        
        public List<string> tags { get; set; }
        public string createdBy { get; set; }
        public string modifiedBy { get; set; }
        public string sharedBy { get; set; }
        public DateTime created { get; set; }
        public DateTime? modified { get; set; }
        public DateTime? shared { get; set; }
        public string userData { get; set; }

        public MetadataModel()
        {
            this.created = DateTime.Now;
            //this.createdBy = JDashManager.Provider != null ? JDashManager.Provider.CurrentUser : Thread.CurrentPrincipal.Identity.Name;
            this.createdBy = Thread.CurrentPrincipal.Identity.Name;

            description = "";
            group = "";
            tags = new List<string>();
        }
    }
}
