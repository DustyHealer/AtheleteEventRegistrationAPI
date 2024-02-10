using MongoDB.Bson.Serialization.Attributes;
using System;

namespace UserAPI.Models
{
    public class User
    {
        [BsonId]
        public int Id { get; set; }
        public string EmailId { get; set; }
        public string Username { get; set; }
        public string Password { get; set; }
        public string ConfirmPassword { get; set; }
        public string Role { get; set; } = "User";
        public string CountryCode { get; set; }
        public string CountryName { get; set; }
        public string DialCode { get; set; }
        public string Phonenumber { get; set; }
        public string Status { get; set; } = "Active";
        public DateTime Date { get; set; } = DateTime.Now;
    }
}
