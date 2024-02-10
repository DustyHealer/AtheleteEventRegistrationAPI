using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace AthleteEventAPI.Exceptions
{
    public class AthleteEventAlreadyExistsException : Exception
    {
        public AthleteEventAlreadyExistsException(string message) : base(message)
        {

        }
    }
}
