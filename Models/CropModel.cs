using System;

namespace AgriYard.Models
{
    /// <summary>
    /// Represents an agricultural commodity traded across Gujarat APMC yards.
    /// Includes both English and Gujarati commodity names (e.g., Wheat / Ghau).
    /// </summary>
    public class CropModel
    {
        public string CropId { get; set; }          // e.g. "wheat", "cotton", "garlic"
        public string CropName { get; set; }        // e.g. "Wheat"
        public string GujaratiName { get; set; }    // e.g. "Ghau"
        public string FullDisplayName               // e.g. "Wheat (Ghau)"
        {
            get
            {
                if (string.IsNullOrEmpty(GujaratiName)) return CropName;
                return string.Format("{0} ({1})", CropName, GujaratiName);
            }
        }
        public string Category { get; set; }        // Grains, Oilseeds, Pulses, Cash Crop, Spices
        public string StandardUnit { get; set; }    // "20 Kg"
        public string IconCode { get; set; }        // CSS / SVG icon identifier

        public CropModel()
        {
            StandardUnit = "20 Kg";
        }

        public CropModel(string id, string name, string gujName, string category, string icon)
        {
            CropId = id;
            CropName = name;
            GujaratiName = gujName;
            Category = category;
            IconCode = icon;
            StandardUnit = "20 Kg";
        }
    }
}
