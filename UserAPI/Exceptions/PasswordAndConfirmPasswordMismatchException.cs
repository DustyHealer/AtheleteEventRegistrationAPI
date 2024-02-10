using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace UserAPI.Exceptions
{
    public class PasswordAndConfirmPasswordMismatchException : Exception
    {
        public PasswordAndConfirmPasswordMismatchException(string message) : base(message)
        {

        }
    }
}
