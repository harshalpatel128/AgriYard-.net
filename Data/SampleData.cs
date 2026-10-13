using System;
using System.Collections.Generic;
using System.Linq;
using AgriYard.Models;

namespace AgriYard.Data
{
    /// <summary>
    /// Thread-safe in-memory data store for the AgriYard application.
    /// Contains realistic demonstration data matching the exact numbers and text in the Figma design PDF.
    /// Notice: This class serves data purely from memory; no database connection is required or used.
    /// </summary>
    public static class SampleData
    {
        private static readonly object _lock = new object();

        // --------------------------------------------------------------------
        // STATIC IN-MEMORY COLLECTIONS
        // --------------------------------------------------------------------
        private static List<YardModel> _yards;
        private static List<CropModel> _crops;
        private static List<MarketRateModel> _marketRates;
        private static List<MarketRateModel> _gainers;
        private static List<MarketRateModel> _losers;
        private static List<PriceHistoryModel> _wheatHistory;
        private static List<ShopModel> _shops;
        private static List<UserModel> _users;
        private static List<AlertModel> _alerts;

        static SampleData()
        {
            InitializeData();
        }

        /// <summary>
        /// Populates initial demonstration datasets.
        /// </summary>
        private static void InitializeData()
        {
            // 1. APMC Marketing Yards (Pages 4, 7, 8)
            _yards = new List<YardModel>
            {
                new YardModel("rajkot", "Rajkot Marketing Yard", "Rajkot", "Rajkot, Gujarat",
                    "150ft Ring Road, Rajkot, Gujarat 360005", "0281 2456789", "250+ Shops", 250, 1985,
                    "/Images/yard_rajkot.svg"),

                new YardModel("junagadh", "Junagadh Marketing Yard", "Junagadh", "Junagadh, Gujarat",
                    "150ft Ring Road, Rajkot, Gujarat 360005", "0281 2456789", "250+ Shops", 250, 1985,
                    "/Images/yard_junagadh.svg"),

                new YardModel("gondal", "Gondal Marketing Yard", "Gondal", "Gondal, Gujarat",
                    "National Highway 27, Gondal, Gujarat 360311", "0282 5220015", "210+ Shops", 210, 1978,
                    "/Images/yard_gondal.svg"),

                new YardModel("mendarda", "Mendarda Marketing Yard", "Mendarda", "Junagadh, Gujarat",
                    "Market Yard Road, Mendarda, Gujarat 362260", "0287 2241230", "95+ Shops", 95, 1994,
                    "/Images/yard_mendarda.svg")
            };

            // 2. Agricultural Crops
            _crops = new List<CropModel>
            {
                new CropModel("wheat", "Wheat", "Ghau", "Grains", "wheat"),
                new CropModel("soyabean", "Soyabean", "", "Oilseeds", "soyabean"),
                new CropModel("chana", "Chana", "", "Pulses", "chana"),
                new CropModel("cotton", "Cotton", "Kapas", "Cash Crop", "cotton"),
                new CropModel("tuver", "Tuver", "", "Pulses", "tuver"),
                new CropModel("garlic", "Garlic", "Lasan", "Spices", "garlic")
            };

            // 3. Today's Market Rates for 21 May 2025 (Page 9 of PDF)
            _marketRates = new List<MarketRateModel>
            {
                new MarketRateModel
                {
                    CropId = "wheat",
                    CropDisplayName = "Wheat (Ghau)",
                    YardId = "rajkot",
                    YardName = "Rajkot Marketing Yard",
                    ArrivalBags = 980,
                    TotalQuantityKg = 19600,
                    MinPrice = 620,
                    AvgPrice = 670,
                    MaxPrice = 720,
                    PriceChange = 60,
                    PercentageChange = 9.84m,
                    Direction = "Rise"
                },
                new MarketRateModel
                {
                    CropId = "soyabean",
                    CropDisplayName = "Soyabean",
                    YardId = "rajkot",
                    YardName = "Rajkot Marketing Yard",
                    ArrivalBags = 860,
                    TotalQuantityKg = 17200,
                    MinPrice = 600,
                    AvgPrice = 650,
                    MaxPrice = 700,
                    PriceChange = 80,
                    PercentageChange = 14.04m,
                    Direction = "Rise"
                },
                new MarketRateModel
                {
                    CropId = "chana",
                    CropDisplayName = "Chana",
                    YardId = "rajkot",
                    YardName = "Rajkot Marketing Yard",
                    ArrivalBags = 750,
                    TotalQuantityKg = 15000,
                    MinPrice = 540,
                    AvgPrice = 590,
                    MaxPrice = 640,
                    PriceChange = -90,
                    PercentageChange = -14.29m,
                    Direction = "Fall"
                },
                new MarketRateModel
                {
                    CropId = "cotton",
                    CropDisplayName = "Cotton (Kapas)",
                    YardId = "rajkot",
                    YardName = "Rajkot Marketing Yard",
                    ArrivalBags = 1020,
                    TotalQuantityKg = 20400,
                    MinPrice = 740,
                    AvgPrice = 810,
                    MaxPrice = 880,
                    PriceChange = 120,
                    PercentageChange = 17.39m,
                    Direction = "Rise"
                },
                new MarketRateModel
                {
                    CropId = "tuver",
                    CropDisplayName = "Tuver",
                    YardId = "rajkot",
                    YardName = "Rajkot Marketing Yard",
                    ArrivalBags = 680,
                    TotalQuantityKg = 13600,
                    MinPrice = 700,
                    AvgPrice = 760,
                    MaxPrice = 820,
                    PriceChange = 50,
                    PercentageChange = 7.25m,
                    Direction = "Rise"
                },
                new MarketRateModel
                {
                    CropId = "garlic",
                    CropDisplayName = "Garlic (Lasan)",
                    YardId = "rajkot",
                    YardName = "Rajkot Marketing Yard",
                    ArrivalBags = 560,
                    TotalQuantityKg = 11200,
                    MinPrice = 900,
                    AvgPrice = 1020,
                    MaxPrice = 1140,
                    PriceChange = 60,
                    PercentageChange = 6.32m,
                    Direction = "Rise"
                }
            };

            // 4. Price Rise / Top Gainers (Page 12 of PDF)
            _gainers = new List<MarketRateModel>
            {
                new MarketRateModel { CropDisplayName = "Cotton (Kapas)", AvgPrice = 810, PriceChange = 120, PercentageChange = 17.39m, CropId = "cotton" },
                new MarketRateModel { CropDisplayName = "Soyabean",       AvgPrice = 650, PriceChange = 80,  PercentageChange = 14.04m, CropId = "soyabean" },
                new MarketRateModel { CropDisplayName = "Wheat (Ghau)",   AvgPrice = 670, PriceChange = 60,  PercentageChange = 9.84m,  CropId = "wheat" },
                new MarketRateModel { CropDisplayName = "Tuver",          AvgPrice = 760, PriceChange = 50,  PercentageChange = 7.25m,  CropId = "tuver" },
                new MarketRateModel { CropDisplayName = "Garlic (Lasan)", AvgPrice = 1020, PriceChange = 60, PercentageChange = 6.32m,  CropId = "garlic" }
            };

            // 5. Price Fall / Top Losers (Page 13 of PDF)
            _losers = new List<MarketRateModel>
            {
                new MarketRateModel { CropDisplayName = "Chana",          AvgPrice = 540,  PriceChange = -90, PercentageChange = -14.29m, CropId = "chana" },
                new MarketRateModel { CropDisplayName = "Tuver",          AvgPrice = 670,  PriceChange = -80, PercentageChange = -10.67m, CropId = "tuver" },
                new MarketRateModel { CropDisplayName = "Soyabean",       AvgPrice = 600,  PriceChange = -60, PercentageChange = -9.09m,  CropId = "soyabean" },
                new MarketRateModel { CropDisplayName = "Wheat (Ghau)",   AvgPrice = 600,  PriceChange = -40, PercentageChange = -6.25m,  CropId = "wheat" },
                new MarketRateModel { CropDisplayName = "Garlic (Lasan)", AvgPrice = 1010, PriceChange = -40, PercentageChange = -3.81m,  CropId = "garlic" }
            };

            // 6. 7-Day History for Wheat (Ghau) (Pages 10, 11 of PDF)
            _wheatHistory = new List<PriceHistoryModel>
            {
                new PriceHistoryModel("20 May 2025", "20 May", 600, 650, 700, 950),
                new PriceHistoryModel("19 May 2025", "19 May", 590, 640, 690, 920),
                new PriceHistoryModel("18 May 2025", "18 May", 580, 630, 680, 890),
                new PriceHistoryModel("17 May 2025", "17 May", 570, 620, 670, 910),
                new PriceHistoryModel("16 May 2025", "16 May", 560, 610, 660, 870),
                new PriceHistoryModel("15 May 2025", "15 May", 550, 600, 650, 840),
                new PriceHistoryModel("14 May 2025", "14 May", 540, 590, 640, 800)
            };

            // 7. Trusted Shop Directory (Page 14 of PDF)
            _shops = new List<ShopModel>
            {
                new ShopModel(1, "Ramdev Trading",          "+91 8238930700", "Rajkot Marketing Yard", "Rameshbhai Patel", "12"),
                new ShopModel(2, "Patel Corporation",       "+91 98765 43211", "Rajkot Marketing Yard", "Bharat Patel", "18"),
                new ShopModel(3, "Mahadev Agency",          "+91 98765 43212", "Junagadh Marketing Yard", "Govindbhai Dabhi", "25"),
                new ShopModel(4, "Shree Krishna Traders",   "+91 98765 43213", "Rajkot Marketing Yard", "Kishorbhai Radadiya", "31"),
                new ShopModel(5, "Jay Khodiyar Traders",    "+91 98765 43214", "Gondal Marketing Yard", "Pravinbhai Khodiyar", "42"),
                new ShopModel(6, "Balaji Trading Co.",      "+91 98765 43215", "Rajkot Marketing Yard", "Sanjaybhai Balaji", "54"),
                new ShopModel(7, "Shivam Enterprise",       "+91 98765 43216", "Mendarda Marketing Yard", "Mukeshbhai Shivam", "67"),
                new ShopModel(8, "Om Agro Traders",         "+91 98765 43217", "Gondal Marketing Yard", "Hasmukhbhai Om", "78"),
                new ShopModel(9, "Shakti Commission Agent", "+91 98765 43218", "Rajkot Marketing Yard", "Shaktisinh Jadeja", "89")
            };

            // 8. Registered App Users (Page 19 of PDF)
            _users = new List<UserModel>
            {
                new UserModel(1, "Harshal Dobariya",   "harshal.dobariya@example.com", "+91 98765 43210", "Farmer",     "Active"),
                new UserModel(2, "Rameshbhai Patel",   "ramesh.patel@example.com",     "+91 98234 56789", "Trader",     "Active"),
                new UserModel(3, "Mansukhbhai Savaliya","mansukh.savaliya@example.com", "+91 97123 11223", "Farmer",     "Active"),
                new UserModel(4, "Kantibhai Vaghani",  "kantibhai.vaghani@example.com", "+91 94260 99887", "Shop Owner", "Blocked")
            };

            // 9. Broadcast Alerts (Page 19 of PDF)
            _alerts = new List<AlertModel>
            {
                new AlertModel(1, "Cotton Arrival Spike at Rajkot Yard",
                    "Heavy arrival of fresh Kapas recorded this morning. Sellers advised to plan transit accordingly.",
                    "All Farmers & Traders", "21 May 2025", "Active"),
                new AlertModel(2, "Monsoon APMC Holiday Notice",
                    "Marketing yards will observe market holiday on coming Monday for routine yard sanitation.",
                    "All", "19 May 2025", "Active")
            };
        }

        // --------------------------------------------------------------------
        // DATA ACCESS METHODS (IN-MEMORY DEMO ONLY)
        // --------------------------------------------------------------------

        public static List<YardModel> GetAllYards()
        {
            lock (_lock)
            {
                return new List<YardModel>(_yards);
            }
        }

        public static YardModel GetYardById(string id)
        {
            lock (_lock)
            {
                if (string.IsNullOrEmpty(id)) return _yards.FirstOrDefault();
                var yard = _yards.FirstOrDefault(y => y.YardId.Equals(id, StringComparison.OrdinalIgnoreCase));
                return yard ?? _yards.FirstOrDefault();
            }
        }

        public static void AddYard(YardModel newYard)
        {
            lock (_lock)
            {
                _yards.Add(newYard);
            }
        }

        public static void DeleteYard(string yardId)
        {
            lock (_lock)
            {
                _yards.RemoveAll(y => y.YardId.Equals(yardId, StringComparison.OrdinalIgnoreCase));
            }
        }

        public static List<CropModel> GetAllCrops()
        {
            lock (_lock)
            {
                return new List<CropModel>(_crops);
            }
        }

        public static List<MarketRateModel> GetDailyMarketRates()
        {
            lock (_lock)
            {
                return new List<MarketRateModel>(_marketRates);
            }
        }

        public static MarketRateModel GetRateByCrop(string cropId)
        {
            lock (_lock)
            {
                if (string.IsNullOrEmpty(cropId)) return _marketRates.FirstOrDefault();
                var rate = _marketRates.FirstOrDefault(r => r.CropId.Equals(cropId, StringComparison.OrdinalIgnoreCase));
                return rate ?? _marketRates.FirstOrDefault();
            }
        }

        public static void UpdateMarketRate(string cropId, string yardId, int arrival, decimal min, decimal avg, decimal max)
        {
            lock (_lock)
            {
                var existing = _marketRates.FirstOrDefault(r => r.CropId.Equals(cropId, StringComparison.OrdinalIgnoreCase));
                if (existing != null)
                {
                    existing.ArrivalBags = arrival;
                    existing.MinPrice = min;
                    existing.AvgPrice = avg;
                    existing.MaxPrice = max;
                    existing.TotalQuantityKg = arrival * 20;
                    existing.LastUpdatedText = DateTime.Now.ToString("dd MMM yyyy, hh:mm tt");
                }
            }
        }

        public static List<MarketRateModel> GetTopGainers()
        {
            lock (_lock)
            {
                return new List<MarketRateModel>(_gainers);
            }
        }

        public static List<MarketRateModel> GetTopLosers()
        {
            lock (_lock)
            {
                return new List<MarketRateModel>(_losers);
            }
        }

        public static List<PriceHistoryModel> Get7DayHistory(string cropId = "wheat")
        {
            lock (_lock)
            {
                return new List<PriceHistoryModel>(_wheatHistory);
            }
        }

        public static List<ShopModel> GetAllShops(string search = "")
        {
            lock (_lock)
            {
                if (string.IsNullOrWhiteSpace(search))
                {
                    return new List<ShopModel>(_shops);
                }
                string term = search.Trim();
                return _shops.Where(s => s.ShopName.IndexOf(term, StringComparison.OrdinalIgnoreCase) >= 0 ||
                                         s.AssociatedYard.IndexOf(term, StringComparison.OrdinalIgnoreCase) >= 0 ||
                                         s.ContactNumber.IndexOf(term, StringComparison.OrdinalIgnoreCase) >= 0).ToList();
            }
        }

        public static List<UserModel> GetAllUsers()
        {
            lock (_lock)
            {
                return new List<UserModel>(_users);
            }
        }

        public static List<AlertModel> GetAllAlerts()
        {
            lock (_lock)
            {
                return new List<AlertModel>(_alerts);
            }
        }

        public static void AddAlert(AlertModel alert)
        {
            lock (_lock)
            {
                alert.AlertId = _alerts.Count + 1;
                _alerts.Insert(0, alert);
            }
        }

        /// <summary>
        /// Performs search on crops and yards for the Crop Search Results page (Page 5).
        /// When searching "Garlic", returns 4-6 matching yard rate cards.
        /// </summary>
        public static List<MarketRateModel> SearchCrops(string query)
        {
            lock (_lock)
            {
                if (string.IsNullOrWhiteSpace(query))
                {
                    return new List<MarketRateModel>(_marketRates);
                }

                string q = query.Trim().ToLowerInvariant();

                // If user searches for Garlic / Lasan (Page 5 in PDF)
                if (q.Contains("garlic") || q.Contains("lasan"))
                {
                    return new List<MarketRateModel>
                    {
                        new MarketRateModel
                        {
                            CropDisplayName = "Garlic (Lasan)",
                            YardName = "Rajkot Marketing Yard",
                            LastUpdatedText = "Today Avg Price (20 Kg)",
                            AvgPrice = 1020,
                            CropId = "garlic"
                        },
                        new MarketRateModel
                        {
                            CropDisplayName = "Garlic (Lasan)",
                            YardName = "Junagadh Marketing Yard",
                            LastUpdatedText = "Today Avg Price (20 Kg)",
                            AvgPrice = 1010,
                            CropId = "garlic"
                        },
                        new MarketRateModel
                        {
                            CropDisplayName = "Garlic (Lasan)",
                            YardName = "Gondal Marketing Yard",
                            LastUpdatedText = "Today Avg Price (20 Kg)",
                            AvgPrice = 1005,
                            CropId = "garlic"
                        },
                        new MarketRateModel
                        {
                            CropDisplayName = "Garlic (Lasan)",
                            YardName = "Mendarda Marketing Yard",
                            LastUpdatedText = "Yesterday Avg Price (20 Kg)",
                            AvgPrice = 990,
                            CropId = "garlic"
                        }
                    };
                }

                // General match across all crops & yards
                return _marketRates.Where(r => r.CropDisplayName.IndexOf(query, StringComparison.OrdinalIgnoreCase) >= 0 ||
                                               r.YardName.IndexOf(query, StringComparison.OrdinalIgnoreCase) >= 0).ToList();
            }
        }

        /// <summary>
        /// Applies sorting and filtering as shown on Page 6 (Advanced Filter & Sort).
        /// </summary>
        public static List<MarketRateModel> FilterAndSort(string sortBy, List<string> selectedYards)
        {
            lock (_lock)
            {
                var query = _marketRates.AsEnumerable();

                if (selectedYards != null && selectedYards.Count > 0)
                {
                    query = query.Where(r => selectedYards.Any(y => r.YardName.IndexOf(y, StringComparison.OrdinalIgnoreCase) >= 0));
                }

                if (sortBy == "HighToLow")
                {
                    query = query.OrderByDescending(r => r.AvgPrice);
                }
                else if (sortBy == "LowToHigh")
                {
                    query = query.OrderBy(r => r.AvgPrice);
                }
                else // "Latest"
                {
                    query = query.OrderByDescending(r => r.ArrivalBags);
                }

                return query.ToList();
            }
        }
    }
}
