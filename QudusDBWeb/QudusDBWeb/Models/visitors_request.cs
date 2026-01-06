using System;
using System.Collections.Generic;

namespace QudusDBWeb.Models
{
    public class visitors_request
    {
        public int visitor_id { get; set; }
        public int request_id { get; set; }
        public decimal price { get; set; }
        public string payment_method { get; set; } = null!;
        public string currency { get; set; } = "ILS";
        public string status { get; set; } = "Pending";
        public DateTime payment_date { get; set; } = DateTime.Now;
        public visitor visitor { get; set; } = null!;
        public printer_request request { get; set; } = null!;
    }
}
