using AthleteAPI.Exceptions;
using AthleteAPI.Models;
using AthleteAPI.Repository;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace AthleteAPI.Service
{
    public class AthleteService : IAthleteService
    {
        private readonly IAthleteRepository repo;
        public AthleteService(IAthleteRepository _repo)
        {
            repo = _repo;
        }
        public int AddAthlete(Athlete athlete)
        {
            var ath = repo.GetAthleteByCategory(athlete.Category);
            if (ath != null)
            {
                var ath1 = ath.Where(x => x.Name.Equals(athlete.Name)).FirstOrDefault();
                if (ath1 != null)
                    throw new AthleteAlreadyExistsException($"Athlete with id: {athlete.AthleteId} already exists");
            }            
            return repo.AddAthlete(athlete);
        }

        public int BlockAthleteById(int id, string status)
        {
            var ath = repo.GetAthleteById(id);
            if (ath == null) 
            {
                    throw new AthleteNotFoundException($"Athlete with id: {id} does not exists");
            }
            return repo.BlockAthleteById(id,status);
        }

        public List<Athlete> GetAllAthletes(int id)
        {
            return repo.GetAllAthletes(id);
        }

        public List<Athlete> GetAllAthletes()
        {
            return repo.GetAllAthletes();
        }

        public List<string> GetAllCategories()
        {
            return repo.GetAllCategories();
        }

        public List<Athlete> GetAllUnblockedAthletes()
        {
            var ath = repo.GetAllAthletes();
            return ath.Where(x => x.Status != "Blocked").ToList();
        }

        public List<Athlete> GetAthleteByCategory(string category)
        {
            return repo.GetAthleteByCategory(category);
        }

        public Athlete GetAthleteById(int id)
        {
            var res = repo.GetAthleteById(id);
            if (res == null) 
            {
                throw new AthleteNotFoundException($"Athlete with id: {id} does not exists");
            }
            return res;
        }

        public Athlete GetAthleteByName(string name)
        {
            var res = repo.GetAthleteByName(name);
            if (res == null)
            {
                throw new AthleteNotFoundException($"Athlete with name: {name} does not exists");
            }
            return res;
        }
    }
}
