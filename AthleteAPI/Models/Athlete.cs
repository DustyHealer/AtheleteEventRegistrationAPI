using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Threading.Tasks;

namespace AthleteAPI.Models
{
    public class Athlete
    {
        [Key]
        [DatabaseGenerated(DatabaseGeneratedOption.None)]
        public int AthleteId { get; set; }
        public string Name { get; set; }
        public string Height { get; set; }
        public string Weight { get; set; }
        public string City { get; set; }
        public string Country { get; set; }
        public string Category { get; set; }
        public string ImageURL { get; set; }
        public string Status { get; set; } = "Active";
        public DateTime Date { get; set; } = DateTime.Now;
    }
}
