using BookingAPI.Exceptions;
using BookingAPI.Models;
using BookingAPI.Repository;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace BookingAPI.Service
{
    public class BookingService : IBookingService
    {
        private readonly IBookingRepository repo;
        public BookingService(IBookingRepository _repo)
        {
            repo = _repo;
        }

        public int AddBooking(Booking booking)
        {
            var res = repo.GetBookingById(booking.Id);
            if (res != null)
            {
                throw new BookingAlreadyExistsException($"Booking with booking Id: {booking.Id} already exists");
            }
            return repo.AddBooking(booking);
        }

        public int Cancel(int id, Booking booking)
        {
            var res = repo.GetBookingById(booking.Id);
            if (res == null)
            {
                throw new BookingNotFoundException($"Booking with booking Id: {booking.Id} does not exists");
            }
            return repo.Cancel(id, booking);
        }

        public List<Booking> GetAllBookings()
        {
            return repo.GetAllBookings();
        }

        public List<Booking> History(string email)
        {
            return repo.History(email);
        }
    }
}
