using System.Collections.Generic;
using UserAPI.Models;

namespace UserAPI.Service
{
    public interface IUserService
    {
        User Register(User user);
        User Login(User user);
        List<User> GetAllUsers();
        User GetUserById(int id);
        bool UpdateUserPassword(User user);
        bool UpdateUser(int id, User user);
        bool BlockUserById(int id, string status);
    }
}
