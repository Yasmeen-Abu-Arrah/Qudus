using System;
using System.Collections.Generic;   

namespace QudusDBWeb.Models
{
    public class printer_request
    {
        public int id { get; set; }
        public string request_type { get; set; } = null!; 
        public DateTime request_date { get; set; } = DateTime.Now;
        public string status { get; set; } = "Pending"; //enum
        public string? file_path { get; set; }

        public int designer_id { get; set; }
        public staff designer { get; set; } = null!;


        // Navigation prop.s
        
        public ICollection<request_artifact>? requests_artifacts { get; set; } = new List<request_artifact>();
        public ICollection<request_artwork>? requests_artworks { get; set; } = new List<request_artwork>();
        public ICollection<visitors_request>? visitors_requests { get; set; } = new List<visitors_request>();

    }
}
