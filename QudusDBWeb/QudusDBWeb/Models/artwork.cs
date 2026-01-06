using System;
using System.Collections.Generic;

namespace QudusDBWeb.Models
{
    public class artwork
    {
        public int id { get; set; }
        public string title { get; set; } = null!;
        public string? description { get; set; }
        public string? artwork_type { get; set; }
        public int? creation_year { get; set; }    
        public string? location { get; set; }
        public string? image_url { get; set; }

        // Foreign Key
        public int? artist_id { get; set; }
        public artist? Artist { get; set; }

        // Navigation prop.s
        
        public ICollection<exhibition_artwork>? exhibitions_artworks { get; set; } = new List<exhibition_artwork>();
        public ICollection<request_artwork>? requests_artworks { get; set; } = new List<request_artwork>();
        

    }
}
