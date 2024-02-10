using Microsoft.EntityFrameworkCore;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace AthleteAPI.Models
{
    public class AthleteDbContext : DbContext
    {
        public AthleteDbContext(DbContextOptions options) : base(options)
        {
            Database.EnsureCreated();
        }
        public DbSet<Athlete> Athletes { get; set; }
    }
}
