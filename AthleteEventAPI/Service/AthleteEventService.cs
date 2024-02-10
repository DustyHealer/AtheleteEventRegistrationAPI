using AthleteEventAPI.Exceptions;
using AthleteEventAPI.Models;
using AthleteEventAPI.Repository;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace AthleteEventAPI.Service
{
    public class AthleteEventService : IAthleteEventService
    {
        private readonly IAthleteEventRepository repo;
        public AthleteEventService(IAthleteEventRepository _repo)
        {
            repo = _repo;
        }

        public bool Add(AthleteEvent athleteEvent)
        {
            var res = repo.Search(athleteEvent.Name);
            if (res != null) 
            {
                throw new AthleteEventAlreadyExistsException($"AthleteEvent with name: {athleteEvent.Name} already exists.");
            }
            return repo.Add(athleteEvent);
        }

        public List<AthleteEvent> AllAthleteEvents()
        {
            return repo.AllAthleteEvents();
        }

        public bool BlockAthleteEvent(string name)
        {
            var res = repo.Search(name);
            if (res == null)
            {
                throw new AthleteEventNotFoundException($"AthleteEvent with name: {name} does not exists");
            }
            return repo.BlockAthleteEvent(name);
        }

        public bool DeleteAthleteEventByName(string name)
        {
            var res = repo.Search(name);
            if (res == null)
            {
                throw new AthleteEventNotFoundException($"AthleteEvent with name: {name} does not exists");
            }
            return repo.DeleteAthleteEventByName(name);
        }

        public bool Register(AthleteEvent athleteEvent)
        {
            var res = repo.Search(athleteEvent.Name);
            if (res == null)
            {
                throw new AthleteEventNotFoundException($"AthleteEvent with name: {athleteEvent.Name} does not exists");
            }
            return repo.Register(athleteEvent);
        }

        public AthleteEvent Search(string name)
        {
            var res = repo.Search(name);
            if (res == null)
            {
                throw new AthleteEventNotFoundException($"AthleteEvent with name: {name} does not exists");
            }
            return res;
        }
    }
}
