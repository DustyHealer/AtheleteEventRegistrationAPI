using System;

namespace UserAPI.Exceptions
{
    public class UserNotFoundException : Exception
    {
        public UserNotFoundException(string message) : base(message)
        {

        }
    }
}
