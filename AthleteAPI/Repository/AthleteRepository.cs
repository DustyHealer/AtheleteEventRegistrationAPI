using AthleteAPI.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace AthleteAPI.Repository
{    
    public class AthleteRepository : IAthleteRepository
    {
        private readonly AthleteDbContext dbContext;
        public AthleteRepository(AthleteDbContext _dbContext)
        {
            dbContext = _dbContext;
        }
        public int AddAthlete(Athlete athlete)
        {
            var topAthlete = dbContext.Athletes.OrderByDescending(x => x.AthleteId).FirstOrDefault();
            if (topAthlete == null)
            {
                athlete.AthleteId = 2001;
            }
            else
            {
                athlete.AthleteId = topAthlete.AthleteId + 1;
            }
            dbContext.Athletes.Add(athlete);
            return dbContext.SaveChanges();
        }

        public int BlockAthleteById(int id, string status)
        {
            var athlete = GetAthleteById(id);
            athlete.Status = status;
            dbContext.Entry<Athlete>(athlete).State = Microsoft.EntityFrameworkCore.EntityState.Modified;
            return dbContext.SaveChanges();
        }

        public List<Athlete> GetAllAthletes()
        {
            return dbContext.Athletes.ToList();
        }

        public List<Athlete> GetAllAthletes(int id)
        {
            return dbContext.Athletes.Where(x=>x.AthleteId != id).ToList();
        }

        public List<string> GetAllCategories()
        {
            return dbContext.Athletes.Select(x => x.Category).Distinct().ToList();
        }

        public List<Athlete> GetAthleteByCategory(string category)
        {
            return dbContext.Athletes.Where(x => x.Category.Equals(category)).ToList();
        }

        public Athlete GetAthleteById(int id)
        {
            return dbContext.Athletes.Where(x => x.AthleteId.Equals(id)).FirstOrDefault();
        }

        public Athlete GetAthleteByName(string name)
        {
            return dbContext.Athletes.Where(x => x.Name.Equals(name)).FirstOrDefault();
        }
    }
}
