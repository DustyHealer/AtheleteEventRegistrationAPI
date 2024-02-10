using MongoDB.Driver;
using System.Collections.Generic;
using System.Linq;
using UserAPI.Models;

namespace UserAPI.Repository
{
    public class UserRepository : IUserRepository
    {
        private readonly UserContext context;
        public UserRepository(UserContext _context)
        {
            context = _context;
        }

        public bool BlockUserById(int id, string status)
        {
            var user = GetUserById(id);
            if (user != null) 
            {
                var filter = Builders<User>.Filter.Where(x => x.Id.Equals(id));
                var update = Builders<User>.Update.Set(x => x.Status, status);
                context.Users.UpdateOne(filter, update);
                return true;
            }
            return false;
        }

        public List<User> GetAllUsers()
        {
            return context.Users.Find(x => true).ToList();
        }

        public User GetUserById(int id)
        {
            return context.Users.Find(x => x.Id.Equals(id)).FirstOrDefault();            
        }

        public User GetUserByUsername(string username)
        {
            return context.Users.Find(x => x.Username.Equals(username)).FirstOrDefault();
        }

        public User Login(User user)
        {
            return context.Users.Find(x => x.Username.Equals(user.Username) && x.Password.Equals(user.Password)).FirstOrDefault();
        }

        public User Register(User user)
        {
            var res = context.Users.Find(x => x.Id.Equals(user.Id)).FirstOrDefault();
            if (res == null)
            {
                var topUser = context.Users.Find(x => true).SortByDescending(x => x.Id).FirstOrDefault();
                if (topUser == null)
                {
                    user.Id = 1001;
                }
                else
                {
                    user.Id = topUser.Id + 1;
                }
                context.Users.InsertOne(user);
                return user;
            }
            return null;
        }

        public bool UpdateUser(int id, User user)
        {
            var usr = GetUserById(user.Id);
            if (usr != null)
            {
                var filter = Builders<User>.Filter.Where(x => x.Id.Equals(id));
                var update = Builders<User>.Update.Set(x => x.Username, user.Username)
                                .Set(x => x.EmailId, user.EmailId)
                                .Set(x => x.Role, user.Role)
                                .Set(x => x.CountryCode, user.CountryCode)
                                .Set(x => x.CountryName, user.CountryName)
                                .Set(x => x.DialCode, user.DialCode)
                                .Set(x => x.Phonenumber, user.Phonenumber);
                context.Users.UpdateOne(filter, update);
                return true;
            }
            return false;
        }

        public bool UpdateUserPassword(User user)
        {
            var usr = GetUserById(user.Id);
            if (usr != null)
            {
                var filter = Builders<User>.Filter.Where(x => x.Id.Equals(user.Id));
                var update = Builders<User>.Update.Set(x => x.Password, user.Password)
                                .Set(x=>x.ConfirmPassword, user.Password);
                context.Users.UpdateOne(filter, update);
                return true;
            }
            return false;
        }
    }
}
