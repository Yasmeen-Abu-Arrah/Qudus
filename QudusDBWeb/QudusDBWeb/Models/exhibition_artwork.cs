using System;
using System.Collections.Generic; 

namespace QudusDBWeb.Models
{
    public class exhibition_artwork
    {
        public int exhibition_id { get; set; }
        public int artwork_id { get; set; }
        public DateTime date_added { get; set; } = DateTime.Now;
        public exhibition exhibition { get; set; } = null!;
        public artwork artwork { get; set; } = null!;
    }
}
