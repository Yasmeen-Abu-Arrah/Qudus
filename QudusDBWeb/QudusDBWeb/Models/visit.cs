using System;
using System.Collections.Generic;

namespace QudusDBWeb.Models
{
    public class visit
    {
        public int id { get; set; }
        public int visitor_id { get; set; }
        public DateTime visit_date { get; set; } = DateTime.Now;
        public string? feedback { get; set; }
        public int exhibition_id { get; set; }
        public int? rating { get; set; } //check


        public visitor visitor { get; set; } = null!;
        public exhibition exhibition { get; set; } = null!;
    }
}
