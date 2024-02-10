using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace BookingAPI.Exceptions
{
    public class BookingNotFoundException : Exception
    {
        public BookingNotFoundException(string message) : base(message)
        {

        }
    }
}
