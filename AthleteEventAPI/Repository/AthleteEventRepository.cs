using AthleteEventAPI.Models;
using MongoDB.Driver;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace AthleteEventAPI.Repository
{
    public class AthleteEventRepository : IAthleteEventRepository
    {
        private readonly AthleteEventContext context;
        public AthleteEventRepository(AthleteEventContext _context)
        {
            context = _context;
        }
        public bool Add(AthleteEvent athleteEvent)
        {
            var res = Search(athleteEvent.Name);
            if (res == null)
            {
                var topAthleteEvent = context.AthleteEvents.Find(x => true).SortByDescending(x => x.Id).FirstOrDefault();
                if (topAthleteEvent == null)
                {
                    athleteEvent.Id = 3001;
                }
                else
                {
                    athleteEvent.Id = topAthleteEvent.Id + 1;
                }
                context.AthleteEvents.InsertOne(athleteEvent);
                return true;
            }
            return false;
        }

        public List<AthleteEvent> AllAthleteEvents()
        {
            return context.AthleteEvents.Find(x => true).ToList();
        }

        public bool BlockAthleteEvent(string name)
        {
            var res = Search(name);
            if (res != null)
            {
                var filter = Builders<AthleteEvent>.Filter.Where(x => x.Name.Equals(name));
                var update = Builders<AthleteEvent>.Update.Set(x => x.IsBlocked, true);
                context.AthleteEvents.UpdateOne(filter, update);
                return true;
            }
            return false;
        }

        public bool DeleteAthleteEventByName(string name)
        {
            var res = Search(name);
            if (res != null)
            {
                context.AthleteEvents.DeleteOne(x=>x.Name.Equals(name));
                return true;
            }
            return false;
        }

        public bool Register(AthleteEvent athleteEvent)
        {
            var res = Search(athleteEvent.Name);
            if (res != null && res.IsBlocked == false)
            {
                return true;
            }
            return false;
        }

        public AthleteEvent Search(string name)
        {
            return context.AthleteEvents.Find(x => x.Name.Equals(name)).FirstOrDefault();
        }
    }
}
