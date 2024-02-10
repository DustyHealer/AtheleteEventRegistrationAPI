using System.Text;
using Microsoft.AspNetCore.Authentication.JwtBearer;
using Microsoft.AspNetCore.Builder;
using Microsoft.AspNetCore.Hosting;
using Microsoft.Extensions.Configuration;
using Microsoft.Extensions.DependencyInjection;
using Microsoft.Extensions.Hosting;
using Microsoft.IdentityModel.Tokens;
using UserAPI.Models;
using UserAPI.Repository;
using UserAPI.Service;

namespace UserAPI
{
    public class Startup
    {
        public Startup(IConfiguration configuration)
        {
            Configuration = configuration;
        }

        public IConfiguration Configuration { get; }

        // This method gets called by the runtime. Use this method to add services to the container.
        public void ConfigureServices(IServiceCollection services)
        {
            services.AddConsulConfig(Configuration);
            services.AddControllers().AddNewtonsoftJson();

            //Dependency Resolution
            services.AddScoped<UserContext>();
            services.AddScoped<IUserRepository, UserRepository>();
            services.AddScoped<IUserService, UserService>();
            services.AddScoped<ITokenGeneratorService, TokenGeneratorService>();

            //CORS
            services.AddCors(options => options.AddPolicy("AllowedOrigins", policy => policy.AllowAnyOrigin().AllowAnyHeader().AllowAnyMethod()));

            //JWT Token
            //JWT Token Authentocation
            var key = new SymmetricSecurityKey(Encoding.UTF8.GetBytes("this_is_my_one_and_only_key"));
            services.AddAuthentication(options =>
            {
                options.DefaultAuthenticateScheme = JwtBearerDefaults.AuthenticationScheme;
                options.DefaultChallengeScheme = JwtBearerDefaults.AuthenticationScheme;
            }).AddJwtBearer(o => o.TokenValidationParameters = new TokenValidationParameters()
            {
                ValidateIssuerSigningKey = true,
                IssuerSigningKey = key,

                ValidateIssuer = true,
                ValidIssuer = "UserApi",

                ValidateAudience = true,
                ValidAudience = "AthleteApi"
            });

            //Swagger 
            services.AddSwaggerGen();

            
        }

        // This method gets called by the runtime. Use this method to configure the HTTP request pipeline.
        public void Configure(IApplicationBuilder app, IWebHostEnvironment env)
        {
            if (env.IsDevelopment())
            {
                app.UseDeveloperExceptionPage();
            }

            app.UseHttpsRedirection();

            app.UseConsul(Configuration);

            app.UseCors("AllowedOrigins");

            app.UseSwagger();

            app.UseSwaggerUI(options => options.SwaggerEndpoint("/swagger/v1/swagger.json", "UserApi V1"));

            app.UseRouting();

            app.UseAuthentication().UseAuthorization();

            app.UseEndpoints(endpoints =>
            {
                endpoints.MapControllers();
            });
        }
    }
}
