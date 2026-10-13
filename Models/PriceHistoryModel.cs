using System;

namespace AgriYard.Models
{
    /// <summary>
    /// Represents a single historical day's price record for the 7-day price history table and chart.
    /// Matches page 10 and 11 of the Figma PDF design.
    /// </summary>
    public class PriceHistoryModel
    {
        public string DateString { get; set; }      // e.g. "20 May 2025"
        public string ShortDate { get; set; }       // e.g. "20 May" (for chart X axis)
        public decimal MinPrice { get; set; }       // e.g. 600
        public decimal AvgPrice { get; set; }       // e.g. 650
        public decimal MaxPrice { get; set; }       // e.g. 700
        public int ArrivalBags { get; set; }

        public string MinFormatted
        {
            get { return string.Format("{0:0}", MinPrice); }
        }
        public string AvgFormatted
        {
            get { return string.Format("{0:0}", AvgPrice); }
        }
        public string MaxFormatted
        {
            get { return string.Format("{0:0}", MaxPrice); }
        }

        public PriceHistoryModel() { }

        public PriceHistoryModel(string dateStr, string shortDate, decimal min, decimal avg, decimal max, int bags = 900)
        {
            DateString = dateStr;
            ShortDate = shortDate;
            MinPrice = min;
            AvgPrice = avg;
            MaxPrice = max;
            ArrivalBags = bags;
        }
    }
}
