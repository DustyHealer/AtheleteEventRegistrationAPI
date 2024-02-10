using AthleteAPI.Models;
using System.Collections.Generic;

namespace AthleteAPI.Repository
{
    public interface IAthleteRepository
    {
        List<Athlete> GetAllAthletes(int id);
        List<Athlete> GetAllAthletes();
        List<string> GetAllCategories();
        Athlete GetAthleteById(int id);
        Athlete GetAthleteByName(string name);
        List<Athlete> GetAthleteByCategory(string category);
        int AddAthlete(Athlete athlete);
        int BlockAthleteById(int id, string status);
    }
}
