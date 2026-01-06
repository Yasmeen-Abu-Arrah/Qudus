using System;
using System.Collections.Generic;

namespace QudusDBWeb.Models
{
    public class visitor
    {
        public int id { get; set; }
        public string first_name { get; set; } = null!;
        public string last_name { get; set; } = null!;
        public string email { get; set; } = null!;
        public string? phone { get; set; }

        // Navigation prop.s
        
        public ICollection<visit>? visits { get; set; } = new List<visit>();
        public ICollection<visitors_request>? visitors_requests { get; set; } = new List<visitors_request>();
        
    }
}
