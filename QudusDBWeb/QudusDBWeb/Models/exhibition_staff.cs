using System;
using System.Collections.Generic;

namespace QudusDBWeb.Models
{
    public class exhibition_staff
    {
        public int exhibition_id { get; set; }
        public int staff_id { get; set; }
        public DateTime assigned_date { get; set; } = DateTime.Now;
        public exhibition exhibition { get; set; } = null!;
        public staff staff { get; set; } = null!;
    }
}
