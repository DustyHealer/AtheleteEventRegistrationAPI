using AthleteEventAPI.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace AthleteEventAPI.Service
{
    public interface IAthleteEventService
    {
        bool Register(AthleteEvent athleteEvent);
        bool Add(AthleteEvent athleteEvent);
        List<AthleteEvent> AllAthleteEvents();
        AthleteEvent Search(string name);
        bool DeleteAthleteEventByName(string name);
        bool BlockAthleteEvent(string name);
    }
}
