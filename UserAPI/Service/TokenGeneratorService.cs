using Microsoft.IdentityModel.Tokens;
using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.IdentityModel.Tokens.Jwt;
using System.Linq;
using System.Security.Claims;
using System.Text;
using System.Threading.Tasks;

namespace UserAPI.Service
{
    public class TokenGeneratorService : ITokenGeneratorService
    {
        public string GenerateJWTToken(string username, string role)
        {
            var claims = new[]
            {
                new Claim("username", username),
                new Claim("role", role)
            };
            var key = new SymmetricSecurityKey(Encoding.UTF8.GetBytes("this_is_my_one_and_only_key"));
            var creds = new SigningCredentials(key, SecurityAlgorithms.HmacSha256);
            var token = new JwtSecurityToken(
                    issuer: "UserApi",
                    audience: "AthleteApi",
                    claims: claims,
                    expires: DateTime.Now.AddMinutes(30),
                    signingCredentials: creds
                );
            var response = new { username = username, token = new JwtSecurityTokenHandler().WriteToken(token) };
            return JsonConvert.SerializeObject(response);
        }
    }
}
