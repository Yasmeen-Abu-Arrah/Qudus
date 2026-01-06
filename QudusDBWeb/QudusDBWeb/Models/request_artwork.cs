using System;
using System.Collections.Generic;

namespace QudusDBWeb.Models
{
    public class request_artwork
    {
        public int request_id { get; set; }
        public int artwork_id { get; set; }
        public decimal scale { get; set; } = 1.0m;
        public string? material_used { get; set; }
        public printer_request request { get; set; } = null!;
        public artwork artwork { get; set; } = null!;
    }
}
