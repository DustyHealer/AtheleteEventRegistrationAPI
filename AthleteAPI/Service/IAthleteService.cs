using AthleteAPI.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace AthleteAPI.Service
{
    public interface IAthleteService
    {
        List<Athlete> GetAllAthletes(int id);
        List<Athlete> GetAllAthletes();
        List<Athlete> GetAllUnblockedAthletes();
        List<string> GetAllCategories();
        Athlete GetAthleteById(int id);
        Athlete GetAthleteByName(string name);
        List<Athlete> GetAthleteByCategory(string category);
        int AddAthlete(Athlete athlete);
        int BlockAthleteById(int id, string status);
    }
}
