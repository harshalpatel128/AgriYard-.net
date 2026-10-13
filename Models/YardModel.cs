using System;

namespace AgriYard.Models
{
    /// <summary>
    /// Represents an APMC Marketing Yard such as Rajkot, Junagadh, Gondal, or Mendarda.
    /// Stores contact details, total shops count, established year, and banner images.
    /// </summary>
    public class YardModel
    {
        public string YardId { get; set; }          // e.g. "rajkot", "junagadh", "gondal", "mendarda"
        public string YardName { get; set; }        // e.g. "Rajkot Marketing Yard"
        public string ShortName { get; set; }       // e.g. "Rajkot"
        public string Location { get; set; }        // e.g. "Rajkot, Gujarat"
        public string Address { get; set; }         // e.g. "150ft Ring Road, Rajkot, Gujarat 360005"
        public string ContactNumber { get; set; }   // e.g. "0281 2456789"
        public string TotalShops { get; set; }      // e.g. "250+ Shops"
        public int TotalShopsNumeric { get; set; }  // e.g. 250
        public int EstablishedYear { get; set; }    // e.g. 1985
        public string ImageUrl { get; set; }        // Path to image asset
        public string GoogleMapsUrl { get; set; }   // External map reference link

        public YardModel() { }

        public YardModel(string id, string name, string shortName, string location, string address,
                         string contact, string totalShops, int numericShops, int year, string image)
        {
            YardId = id;
            YardName = name;
            ShortName = shortName;
            Location = location;
            Address = address;
            ContactNumber = contact;
            TotalShops = totalShops;
            TotalShopsNumeric = numericShops;
            EstablishedYear = year;
            ImageUrl = image;
            GoogleMapsUrl = "https://maps.google.com/?q=" + Uri.EscapeDataString(name + " " + address);
        }
    }
}
