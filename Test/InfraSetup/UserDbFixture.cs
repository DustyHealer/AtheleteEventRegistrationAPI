using System;
using System.Collections.Generic;
using System.Text;
using Microsoft.Extensions.Configuration;
using MongoDB.Driver;
using UserAPI.Models;

namespace Test.InfraSetup
{
    public class UserDbFixture : IDisposable
    {
        private IConfigurationRoot configuration;
        public UserContext context;
        public UserDbFixture()
        {
            var builder = new ConfigurationBuilder().AddJsonFile("appsettings.json");

            configuration = builder.Build();
            context = new UserContext(configuration);
            context.Users.DeleteMany(Builders<User>.Filter.Empty);
            context.Users.InsertMany(new List<User>
            {
                new User{ Id=1001, Username="Mukesh",Password="Mukesh@123",ConfirmPassword="Mukesh@123",Role="User", Status="Active", Date=DateTime.Now},
                new User{ Id=1002, Username="Sachin", Password="Sachin@123",ConfirmPassword="Sachin@123",Role="User", Status="Active", Date=DateTime.Now}
            });
        }
        public void Dispose()
        {
            context = null;
        }
    }
}
