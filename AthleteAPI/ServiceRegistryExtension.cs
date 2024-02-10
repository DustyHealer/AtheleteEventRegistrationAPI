using Consul;
using Microsoft.AspNetCore.Builder;
using Microsoft.Extensions.Configuration;
using Microsoft.Extensions.DependencyInjection;
using Microsoft.Extensions.Hosting;
using Microsoft.Extensions.Logging;
using System;

namespace AthleteAPI
{
    public static class ServiceRegistryExtension
    {
        public static IServiceCollection AddConsulConfig(this IServiceCollection services, IConfiguration configurationSettings)
        {
            services.AddSingleton<IConsulClient, ConsulClient>(p => new ConsulClient(consulConfig =>
            {
                //consulConfig.Address = new Uri(configurationSettings["ConsulConfig:ConsulAddress"]);
                consulConfig.Address = new Uri(Environment.GetEnvironmentVariable("ConsulAddress"));
            }));
            return services;
        }

        public static IApplicationBuilder UseConsul(this IApplicationBuilder app, IConfiguration configirationSettings)
        {
            var consulClient = app.ApplicationServices.GetRequiredService<IConsulClient>();
            var logger = app.ApplicationServices.GetRequiredService<ILoggerFactory>().CreateLogger("AppExtension");
            var lifetime = app.ApplicationServices.GetRequiredService<IHostApplicationLifetime>();

            var registration = new AgentServiceRegistration()
            {
                //ID = configirationSettings["ConsulConfig:ServiceName"],
                //Name = configirationSettings["ConsulConfig:ServiceName"],
                //Address = configirationSettings["ConsulConfig:ServiceHost"],
                //Port = int.Parse(configirationSettings["ConsulConfig:ServicePort"])
                ID = Environment.GetEnvironmentVariable("ConsulServiceName"),
                Name = Environment.GetEnvironmentVariable("ConsulServiceName"),
                Address = Environment.GetEnvironmentVariable("ConsulServiceHost"),
                Port = int.Parse(Environment.GetEnvironmentVariable("ConsulServicePort"))

            };

            logger.LogInformation("Registering with consul");
            consulClient.Agent.ServiceDeregister(registration.ID).ConfigureAwait(true);
            consulClient.Agent.ServiceRegister(registration).ConfigureAwait(true);

            lifetime.ApplicationStopped.Register(() =>
            {
                logger.LogInformation("Registering service from consul");
                consulClient.Agent.ServiceDeregister(registration.ID).ConfigureAwait(true);
            });

            return app;
        }
    }
}
