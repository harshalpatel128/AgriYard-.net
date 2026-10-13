using System;

namespace AgriYard.Models
{
    /// <summary>
    /// Represents a certified or trusted commission shop in an APMC yard.
    /// Matches the Trusted Shop Directory grid shown on Page 14 of the Figma design.
    /// </summary>
    public class ShopModel
    {
        public int ShopId { get; set; }
        public string ShopName { get; set; }        // e.g. "Ramdev Trading"
        public string ContactNumber { get; set; }   // e.g. "+91 8238930700"
        public string CleanPhone                    // Clean numeric for tel: links
        {
            get
            {
                if (string.IsNullOrEmpty(ContactNumber)) return "";
                return ContactNumber.Replace(" ", "").Replace("-", "");
            }
        }
        public string AssociatedYard { get; set; }  // e.g. "Rajkot Marketing Yard"
        public string OwnerName { get; set; }
        public string ShopNumber { get; set; }      // e.g. "Shop #12"
        public string Status { get; set; }          // "Active", "Suspended"
        public bool IsTrusted { get; set; }

        public ShopModel()
        {
            IsTrusted = true;
            Status = "Active";
        }

        public ShopModel(int id, string name, string phone, string yard, string owner = "", string number = "")
        {
            ShopId = id;
            ShopName = name;
            ContactNumber = phone;
            AssociatedYard = yard;
            OwnerName = owner;
            ShopNumber = number;
            IsTrusted = true;
            Status = "Active";
        }
    }
}
