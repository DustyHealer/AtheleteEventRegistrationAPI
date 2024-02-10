using Microsoft.EntityFrameworkCore;
using Microsoft.Extensions.Configuration;
using MongoDB.Driver;
using System;

namespace UserAPI.Models
{
    public class UserContext
    {
        MongoClient client;
        IMongoDatabase db;
        public UserContext(IConfiguration configuration)
        {
            //client = new MongoClient(configuration.GetSection("MongoDB").GetSection("ConnectionString").Value);
            //db = client.GetDatabase(configuration.GetSection("MongoDB").GetSection("UserDatabase").Value);
            client = new MongoClient(Environment.GetEnvironmentVariable("DatabaseConnection"));
            db = client.GetDatabase(Environment.GetEnvironmentVariable("DatabaseName"));
        }

        public IMongoCollection<User> Users => db.GetCollection<User>("Users");
    }
}
