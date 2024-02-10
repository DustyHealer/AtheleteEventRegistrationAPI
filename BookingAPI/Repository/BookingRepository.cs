using BookingAPI.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace BookingAPI.Repository
{
    public class BookingRepository : IBookingRepository
    {
        private readonly BookingDbContext dbContext;
        public BookingRepository(BookingDbContext _dbContext)
        {
            dbContext = _dbContext;
        }
        public int AddBooking(Booking booking)
        {
            var topBooking = dbContext.Bookings.OrderByDescending(x => x.Id).FirstOrDefault();
            if (topBooking == null)
            {
                booking.Id = 4001;
            }
            else
            {
                booking.Id = topBooking.Id + 1;
            }
            dbContext.Bookings.Add(booking);
            return dbContext.SaveChanges();
        }

        public int Cancel(int id, Booking booking)
        {
            var res = dbContext.Bookings.Where(x => x.Id.Equals(id)).FirstOrDefault();
            dbContext.Bookings.Remove(res);
            return dbContext.SaveChanges();
        }

        public List<Booking> GetAllBookings()
        {
            return dbContext.Bookings.ToList();
        }

        public Booking GetBookingById(int id)
        {
            return dbContext.Bookings.Where(x => x.Id.Equals(id)).FirstOrDefault();
        }

        public List<Booking> History(string email)
        {
            return dbContext.Bookings.Where(x => x.EmailId.Equals(email)).ToList();
        }
    }
}
