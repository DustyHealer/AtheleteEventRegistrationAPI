using System.Collections.Generic;
using UserAPI.Exceptions;
using UserAPI.Models;
using UserAPI.Repository;

namespace UserAPI.Service
{
    public class UserService : IUserService
    {
        private readonly IUserRepository repo;
        public UserService(IUserRepository _repo)
        {
            repo = _repo;
        }
        public bool BlockUserById(int id, string status)
        {
            var usr = repo.GetUserById(id);
            if (usr == null)
                throw new UserNotFoundException($"User with id: {id} does not exists");
            return repo.BlockUserById(id, status);
        }

        public List<User> GetAllUsers()
        {
            return repo.GetAllUsers();
        }

        public User GetUserById(int id)
        {
            var usr = repo.GetUserById(id);
            if (usr == null)
            {
                throw new UserNotFoundException($"User with id: {id} does not exists");
            }
            return usr;
        }

        public User Login(User user)
        {
            var usr = repo.GetUserByUsername(user.Username);
            if (usr == null)
            {
                throw new UserNotFoundException($"User with username: {user.Username} does not exists");
            }
            if (usr.Status.ToLower().Equals("blocked"))
            {
                throw new UserIdBlockedException($"User with username: {user.Username} is blocked");
            }
            var res = repo.Login(user);
            if (res==null)
            {
                throw new InvalidCredentialsException("Invalid Username or Password");
            }
            return res;
        }

        public User Register(User user)
        {
            var usr = repo.GetUserById(user.Id);
            if (usr != null)
            {
                throw new UserAlreadyExistsException($"User with id: {user.Id} already exists");
            }
            if (!user.Password.Equals(user.ConfirmPassword)) 
            {
                throw new PasswordAndConfirmPasswordMismatchException($"Password and Confirm password Mismatch for userId: {user.Id}");
            }
            return repo.Register(user);
        }

        public bool UpdateUser(int id, User user)
        {
            var usr = repo.GetUserById(id);
            if (usr == null)
            {
                throw new UserNotFoundException($"User with id: {id} does not exists");
            }
            if (usr.Status.ToLower().Equals("blocked"))
            {
                throw new UserIdBlockedException($"User with id: {user.Id} is blocked");
            }
            return repo.UpdateUser(id, user);
        }

        public bool UpdateUserPassword(User user)
        {
            var usr = repo.GetUserById(user.Id);
            if (usr == null)
            {
                throw new UserNotFoundException($"User with id: {user.Id} does not exists");
            }
            return repo.UpdateUserPassword(user);
        }
    }
}
