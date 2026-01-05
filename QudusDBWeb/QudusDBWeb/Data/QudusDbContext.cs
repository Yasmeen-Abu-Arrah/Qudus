using Microsoft.EntityFrameworkCore;
using QudusDBWeb.Models; 

namespace QudusDBWeb.Data
{
    public class QudusDbContext : DbContext
    {
        public QudusDbContext(DbContextOptions<QudusDbContext> options)
            : base(options)
        {
        }
       /* public DbSet<artists> artists { get; set; } */
    }
}
