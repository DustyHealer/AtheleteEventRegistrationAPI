using BookingAPI.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace BookingAPI.Repository
{
    public interface IBookingRepository
    {
        int AddBooking(Booking booking);
        List<Booking> History(string email);
        int Cancel(int id, Booking booking);
        List<Booking> GetAllBookings();
        Booking GetBookingById(int id);
    }
}
