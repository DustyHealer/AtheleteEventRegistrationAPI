using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace AthleteAPI.Exceptions
{
    public class AthleteNotFoundException : Exception
    {
        public AthleteNotFoundException(string message) : base(message)
        {

        }
    }
}
