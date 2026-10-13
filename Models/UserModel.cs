using System;

namespace AgriYard.Models
{
    /// <summary>
    /// Represents an authenticated or registered user in the AgriYard system.
    /// Used for sample in-memory authentication and user management displays.
    /// </summary>
    public class UserModel
    {
        public int UserId { get; set; }
        public string FullName { get; set; }
        public string Email { get; set; }
        public string MobileNumber { get; set; }
        public string Role { get; set; }        // Farmer, Trader, Shop Owner, Admin
        public string Status { get; set; }      // Active, Blocked, Pending
        public DateTime CreatedAt { get; set; }

        public UserModel()
        {
            CreatedAt = DateTime.Now;
            Status = "Active";
            Role = "Farmer";
        }

        public UserModel(int id, string name, string email, string phone, string role, string status)
        {
            UserId = id;
            FullName = name;
            Email = email;
            MobileNumber = phone;
            Role = role;
            Status = status;
            CreatedAt = DateTime.Now;
        }
    }
}
