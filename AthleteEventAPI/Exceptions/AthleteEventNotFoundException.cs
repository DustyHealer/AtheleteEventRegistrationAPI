using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace AthleteEventAPI.Exceptions
{
    public class AthleteEventNotFoundException : Exception
    {
        public AthleteEventNotFoundException(string message) : base(message)
        {

        }
    }
}
