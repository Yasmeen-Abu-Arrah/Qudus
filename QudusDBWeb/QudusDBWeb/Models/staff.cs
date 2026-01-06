using System;
using System.Collections.Generic;

namespace QudusDBWeb.Models
{
    public class staff
    {
        public int id { get; set; }
        public string first_name { get; set; } = null!;
        public string last_name { get; set; } = null!;
        public string email { get; set; } = null!;
        public string role { get; set; } = null!; //enum
        public string? phone { get; set; }
        public DateTime? hire_date { get; set; }

        // Navigation prop.s
        
        public ICollection<exhibition>? exhibitions { get; set; } = new List<exhibition>();
        public ICollection<exhibition_staff>? exhibitions_staffs { get; set; } = new List<exhibition_staff>();
        public ICollection<printer_request>? printer_requests { get; set; } = new List<printer_request>();
        
    }

}
