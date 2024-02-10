using System;
using System.Collections.Generic;
using AthleteAPI.Models;
using AthleteEventAPI.Models;
using Microsoft.AspNetCore.Hosting;
using Microsoft.AspNetCore.Mvc.Testing;
using Microsoft.EntityFrameworkCore;
using Microsoft.Extensions.DependencyInjection;
using Microsoft.Extensions.Logging;
using MongoDB.Driver;
using UserAPI.Models;
using Xunit;

namespace Test.InfraSetup
{
    //WebApplication Factory for Reminder API
    public class AthleteEventWebApplicationFactory<TStartup> : WebApplicationFactory<AthleteEventAPI.Startup>
    {
        protected override void ConfigureWebHost(IWebHostBuilder builder)
        {
            builder.ConfigureServices(services =>
            {
                services.AddScoped<AthleteEventContext>();

                // Build the service provider.
                var sp = services.BuildServiceProvider();

                // Create a scope to obtain a reference to the database contexts
                using (var scope = sp.CreateScope())
                {
                    var scopedServices = scope.ServiceProvider;
                    var context = scopedServices.GetRequiredService<AthleteEventContext>();
                    var logger = scopedServices.GetRequiredService<ILogger<AthleteEventWebApplicationFactory<TStartup>>>();

                    try
                    {
                        // Seed the database with some specific test data.
                        context.AthleteEvents.DeleteMany(Builders<AthleteEventAPI.Models.AthleteEvent>.Filter.Empty);
                        context.AthleteEvents.InsertMany(new List<AthleteEventAPI.Models.AthleteEvent>
            {
                new AthleteEventAPI.Models.AthleteEvent{Id=3001, Name="Cricket", ContactNo="10291029", ContactAddress="Melbourne AU", IsBlocked=false},
                 new AthleteEventAPI.Models.AthleteEvent{Id=3002, Name="Football", ContactNo="102994010", ContactAddress="Delhi IN", IsBlocked=false }
            });
                    }
                    catch (Exception ex)
                    {
                        logger.LogError(ex, "An error occurred seeding the " +
                                            "database with test messages. Error: {ex.Message}");
                    }
                }
            });
        }
    }

    //WebApplication Factory for User API
    public class UserWebApplicationFactory<TStartup> : WebApplicationFactory<UserAPI.Startup>
    {
        protected override void ConfigureWebHost(IWebHostBuilder builder)
        {
            builder.ConfigureServices(services =>
            {
                services.AddScoped<UserContext>();

                // Build the service provider.
                var sp = services.BuildServiceProvider();

                // Create a scope to obtain a reference to the database contexts
                using (var scope = sp.CreateScope())
                {
                    var scopedServices = scope.ServiceProvider;
                    var context = scopedServices.GetRequiredService<UserContext>();
                    var logger = scopedServices.GetRequiredService<ILogger<UserWebApplicationFactory<TStartup>>>();

                    try
                    {
                        // Seed the database with some specific test data.
                        context.Users.DeleteMany(Builders<UserAPI.Models.User>.Filter.Empty);
                        context.Users.InsertMany(new List<UserAPI.Models.User>
                            {
                                   new User{ Id=1001, Username="Mukesh",Password="Mukesh@123",ConfirmPassword="Mukesh@123",Role="User", Status="Active", Date=DateTime.Now},
                                   new User{ Id=1002, Username="Sachin", Password="Sachin@123",ConfirmPassword="Sachin@123",Role="User", Status="Active", Date=DateTime.Now}
                             });
                    }
                    catch (Exception ex)
                    {
                        logger.LogError(ex, "An error occurred seeding the " +
                                            "database with test messages. Error: {ex.Message}");
                    }
                }
            });
        }
    }

    [CollectionDefinition("Auth API")]
    public class DbCollection : ICollectionFixture<UserWebApplicationFactory<UserAPI.Startup>>
    {
        // This class has no code, and is never created. Its purpose is simply
        // to be the place to apply [CollectionDefinition] and all the
        // ICollectionFixture<> interfaces.
    }
}
