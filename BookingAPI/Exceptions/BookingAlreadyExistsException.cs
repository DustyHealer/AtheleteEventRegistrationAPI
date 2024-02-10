using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace BookingAPI.Exceptions
{
    public class BookingAlreadyExistsException : Exception
    {
        public BookingAlreadyExistsException(string message) : base(message)
        {

        }
    }
}
