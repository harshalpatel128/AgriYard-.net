using System;

namespace AgriYard.Models
{
    /// <summary>
    /// Represents an admin broadcast alert distributed to farmers and traders.
    /// Matches Page 19 of the Figma design.
    /// </summary>
    public class AlertModel
    {
        public int AlertId { get; set; }
        public string Title { get; set; }
        public string Message { get; set; }
        public string TargetAudience { get; set; }   // "All Farmers & Traders", "Farmers", "Traders"
        public string DateFormatted { get; set; }
        public string DatePosted 
        { 
            get { return DateFormatted; } 
            set { DateFormatted = value; } 
        }
        public string Status { get; set; }           // "Active", "Archived"

        public AlertModel()
        {
            DateFormatted = DateTime.Now.ToString("dd MMM yyyy");
            Status = "Active";
            TargetAudience = "All Farmers & Traders";
        }

        public AlertModel(int id, string title, string message, string target, string date, string status = "Active")
        {
            AlertId = id;
            Title = title;
            Message = message;
            TargetAudience = target;
            DateFormatted = date;
            Status = status;
        }
    }

    /// <summary>
    /// Represents a user support ticket or bug report from the Help & Support page.
    /// Matches Page 21 of the Figma design.
    /// </summary>
    public class SupportTicketModel
    {
        public int TicketId { get; set; }
        public string FullName { get; set; }
        public string ContactNumber { get; set; }
        public string Category { get; set; }
        public string Description { get; set; }
        public string Status { get; set; }
        public DateTime CreatedAt { get; set; }

        public SupportTicketModel()
        {
            Status = "Open";
            CreatedAt = DateTime.Now;
        }
    }
}
