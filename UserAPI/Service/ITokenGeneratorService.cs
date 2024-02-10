using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace UserAPI.Service
{
    public interface ITokenGeneratorService
    {
        string GenerateJWTToken(string username, string role);
    }
}
