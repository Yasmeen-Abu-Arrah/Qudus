using System;
using System.Collections.Generic;

namespace QudusDBWeb.Models
{
    public class exhibition
    {
        public int id { get; set; } 
        public string title { get; set; } = null!;
        public string? description { get; set; }
        public DateTime start_date { get; set; }
        public DateTime end_date { get; set; }
        public string? status { get; set; } = " Upcoming"; //enum

        // Foreign Key
        public int manager_id { get; set; }
        public staff Manager { get; set; } = null!;

        // Navigation prop.s
        public ICollection<exhibition_artifact>? exhibitions_artifacts { get; set; } = new List<exhibition_artifact>();
        public ICollection<exhibition_artwork>? exhibitions_artworks { get; set; } = new List<exhibition_artwork>();
        public ICollection<exhibition_staff>? exhibitions_staffs { get; set; } = new List<exhibition_staff>();
        public ICollection<visit>? visits { get; set; } = new List<visit>();

    }
}
