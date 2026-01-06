using System;
using System.Collections.Generic;   

namespace QudusDBWeb.Models
{
    public class exhibition_artifact
    {
        public int exhibition_id { get; set; }
        public int artifact_id { get; set; }
        public DateTime date_added { get; set; } = DateTime.Now;
        public exhibition exhibition { get; set; } = null!;
        public artifact artifact { get; set; } = null!;
    }
}
