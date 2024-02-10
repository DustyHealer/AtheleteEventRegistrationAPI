using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace AthleteAPI.Exceptions
{
    public class AthleteAlreadyExistsException : Exception
    {
        public AthleteAlreadyExistsException(string message) : base(message)
        {

        }
    }
}
