using MongoDB.Bson.Serialization.Attributes;
using MongoDB.Bson.Serialization.IdGenerators;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace AthleteEventAPI.Models
{
    public class AthleteEvent
    {
        [BsonId]
        public int Id { get; set; }
        public string Name { get; set; }
        public string Logo { get; set; }
        public string ContactNo { get; set; }
        public string ContactAddress { get; set; }
        public bool IsBlocked { get; set; } = false;
    }
}
