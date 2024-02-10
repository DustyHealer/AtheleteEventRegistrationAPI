using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Threading.Tasks;

namespace BookingAPI.Models
{
    public class Booking
    {
        [Key]
        [DatabaseGenerated(DatabaseGeneratedOption.None)]
        public int Id { get; set; }
        public string EmailId { get; set; }
        public int AthleteEventNo { get; set; }
        public string AthleteEventAttendees { get; set; }
        public string Status { get; set; } = "Not Started";

    }
}
