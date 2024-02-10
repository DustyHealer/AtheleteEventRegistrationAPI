using System;
using System.Collections.Generic;
using System.Text;
using AthleteEventAPI.Models;
using Microsoft.Extensions.Configuration;
using MongoDB.Driver;

namespace Test.InfraSetup
{
    public class AthleteEventDbFixture : IDisposable
    {
        private IConfigurationRoot configuration;
        public AthleteEventContext context;
        public AthleteEventDbFixture()
        {
            var builder = new ConfigurationBuilder().AddJsonFile("appsettings.json");

            configuration = builder.Build();
            context = new AthleteEventContext(configuration);
            context.AthleteEvents.DeleteMany(Builders<AthleteEvent>.Filter.Empty);
            context.AthleteEvents.InsertMany(new List<AthleteEvent>
            {
                new AthleteEvent{ Id=3001, Name="Cricket", ContactNo="10291029", ContactAddress="Melbourne AU", IsBlocked=false},
                new AthleteEvent{ Id=3002, Name="Football", ContactNo="102994010", ContactAddress="Delhi IN", IsBlocked=false}
            });
        }
        public void Dispose()
        {
            context = null;
        }
    }
}
