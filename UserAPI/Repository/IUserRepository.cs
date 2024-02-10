using System.Collections.Generic;
using UserAPI.Models;

namespace UserAPI.Repository
{
    public interface IUserRepository
    {
        User Register(User user);
        User Login(User user);
        List<User> GetAllUsers();
        User GetUserById(int id);
        User GetUserByUsername(string username);
        bool UpdateUserPassword(User user);
        bool UpdateUser(int id, User user);
        bool BlockUserById(int id, string status);
    }
}
