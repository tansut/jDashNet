using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace JDash.Models
{
    public class DashletCreateAndUpdateModel
    {
        public DashletModel model { get; set; }
        public IEnumerable<UpdatePositionModel> positions { get; set; }
    }
}
