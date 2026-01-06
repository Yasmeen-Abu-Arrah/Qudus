using System;
using System.Collections.Generic;

namespace QudusDBWeb.Models
{
    public class artist
    {
        public int id { get; set; }
        public string first_name { get; set; } = null!;
        public string last_name { get; set; } = null!;
        public string email { get; set; } = null!;
        public string? bio { get; set; }

        // Navigation prop.s
        public ICollection<artwork>? artworks { get; set; } = new List<artwork>();
    }
}
