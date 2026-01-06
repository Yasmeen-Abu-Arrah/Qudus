using System;
using System.Collections.Generic;

namespace QudusDBWeb.Models
{
    public class artifact
    {
        public int id { get; set; }
        public string name { get; set; } = null!;
        public string? description { get; set; }
        public string? origin { get; set; }
        public string? period { get; set; }
        public string? material { get; set; }
        public string? image_url { get; set; }
        public string? location { get; set; }
        public string? condition_status { get; set; } //enum?
        public DateTime? acquisitionDate { get; set; }

        
        // Navigation prop.s
        public ICollection<exhibition_artifact>? exhibitions_artifacts { get; set; } = new List<exhibition_artifact>();
        public ICollection<request_artifact>? requests_artifacts { get; set; } = new List<request_artifact>();
        
    }
}
