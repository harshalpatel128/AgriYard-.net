using System;

namespace AgriYard.Models
{
    /// <summary>
    /// Represents daily auction market rates for a specific crop at a marketing yard.
    /// Matches the data displayed on Today's Market Rates table and Dashboard.
    /// </summary>
    public class MarketRateModel
    {
        public string CropId { get; set; }
        public string CropDisplayName { get; set; }     // e.g. "Wheat (Ghau)"
        public string YardId { get; set; }
        public string YardName { get; set; }            // e.g. "Rajkot Marketing Yard"
        public int ArrivalBags { get; set; }            // e.g. 980
        public string ArrivalDisplay                    // e.g. "980 Bags"
        {
            get { return string.Format("{0} Bags", ArrivalBags); }
        }
        public decimal TotalQuantityKg { get; set; }    // e.g. 19,600 Kg
        public decimal MinPrice { get; set; }           // e.g. 620
        public decimal AvgPrice { get; set; }           // e.g. 670
        public decimal MaxPrice { get; set; }           // e.g. 720
        public string PriceUnit { get; set; }           // "20 Kg"
        public string LastUpdatedText { get; set; }     // "21 May 2025, 08:30 AM"
        public DateTime RateDate { get; set; }

        // Trend indicators for Price Rise / Fall
        public decimal PriceChange { get; set; }        // e.g. +120 or -90
        public decimal PercentageChange { get; set; }   // e.g. +17.39% or -14.29%
        public string Direction { get; set; }           // "Rise", "Fall", "Neutral"

        public string MinPriceFormatted
        {
            get { return string.Format("&#8377;{0:0}", MinPrice); }
        }
        public string AvgPriceFormatted
        {
            get { return string.Format("&#8377;{0:0}", AvgPrice); }
        }
        public string MaxPriceFormatted
        {
            get { return string.Format("&#8377;{0:0}", MaxPrice); }
        }
        public string ChangeFormatted
        {
            get
            {
                if (PriceChange > 0)
                    return string.Format("+&#8377;{0:0}", PriceChange);
                if (PriceChange < 0)
                    return string.Format("-&#8377;{0:0}", Math.Abs(PriceChange));
                return "&#8377;0";
            }
        }
        public string PercentageFormatted
        {
            get
            {
                if (PercentageChange > 0)
                    return string.Format("+{0:0.00}%", PercentageChange);
                if (PercentageChange < 0)
                    return string.Format("{0:0.00}%", PercentageChange);
                return "0.00%";
            }
        }

        public MarketRateModel()
        {
            PriceUnit = "20 Kg";
            RateDate = DateTime.Now;
            LastUpdatedText = "21 May 2025, 08:30 AM";
        }
    }
}
