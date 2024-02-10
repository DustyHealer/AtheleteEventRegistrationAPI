using Microsoft.EntityFrameworkCore;
using Microsoft.Extensions.Configuration;
using MongoDB.Driver;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace AthleteEventAPI.Models
{
    public class AthleteEventContext
    {
        MongoClient client;
        IMongoDatabase db;
        public AthleteEventContext(IConfiguration configuration)
        {
            //client = new MongoClient(configuration.GetSection("MongoDB").GetSection("ConnectionString").Value);
            //db = client.GetDatabase(configuration.GetSection("MongoDB").GetSection("AthleteEventDatabase").Value);
            client = new MongoClient(Environment.GetEnvironmentVariable("DatabaseConnection"));
            db = client.GetDatabase(Environment.GetEnvironmentVariable("DatabaseName"));
        }
        public IMongoCollection<AthleteEvent> AthleteEvents => db.GetCollection<AthleteEvent>("AthleteEvents");
    }
}
