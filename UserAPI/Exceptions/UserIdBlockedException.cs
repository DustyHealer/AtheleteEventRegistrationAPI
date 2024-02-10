using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace UserAPI.Exceptions
{
    public class UserIdBlockedException : Exception
    {
        public UserIdBlockedException(string message) : base(message)
        {

        }
    }
}
