# AgriYard — Agricultural Market Intelligence Platform

A complete, pixel-perfect, responsive agricultural market intelligence website built with **ASP.NET Web Forms**, **C#**, and **HTML5/CSS3/JavaScript**, faithfully recreating the **21-page Figma UI/UX specification** (`.net figma.pdf`).

---

## 🌾 Project Overview

**AgriYard** is designed for Gujarat's farmers, traders, and APMC shop owners, providing real-time daily auction rates, price movement analytics (Top Gainers / Top Losers), 7-day trend visualizations, certified yard directories, and an administrative management panel.

> **Important Architecture Notice**:
> This website is a complete frontend and UI/UX implementation with standard ASP.NET Web Forms architecture, native ASP.NET server-side model validation, and SQL Server schema designs. All operational data is served from thread-safe, local, in-memory C# data collections (`AgriYard.Data.SampleData`). 
> **The application does NOT use ASP.NET Web API, REST APIs, Entity Framework, ADO.NET, connection strings, or database connectivity.**

---

## 🛠️ Technology Stack

| Component | Technology | Description |
| :--- | :--- | :--- |
| **Framework** | .NET Framework 4.8 / 4.8.1 | Native Web Forms Web Application |
| **Server Language** | C# | Code-behind (`.aspx.cs`) with standard postbacks |
| **Presentation** | ASP.NET Web Forms (`.aspx`) | Web Controls, Repeaters, Master Pages |
| **Validation** | 6 Native ASP.NET Validators | `RequiredField`, `Range`, `Compare`, `RegularExpression`, `Custom`, `ValidationSummary` |
| **Styling** | Custom Responsive CSS3 | Modular CSS files with structured English comments |
| **Scripting** | Pure Vanilla JavaScript & HTML5 Canvas | Lightweight client-side chart rendering and menu toggling |
| **Database Design** | Microsoft SQL Server (T-SQL) | Standalone table creation script with keys, constraints & seed data |

---

## 📑 21-Page Implementation Checklist (Figma PDF Mapping)

Every screen from the 21-page design reference has been faithfully implemented:

| # | Screen / Page | ASPX File | Route / Query | Key Features |
|---|---|---|---|---|
| **1** | **Login** | `Account/Login.aspx` | `/Account/Login.aspx` | Welcome Back, Email & Password inputs, validators, Forgot Password link |
| **2** | **Forgot Password** | `Account/ForgotPassword.aspx` | `/Account/ForgotPassword.aspx` | Green lock badge, email/mobile input, Send Reset Link button, back link |
| **3** | **Create Account** | `Account/Register.aspx` | `/Account/Register.aspx` | Full Name, Mobile, Email, Password, Confirm Password with `CompareValidator` |
| **4** | **Home Dashboard** | `Default.aspx` | `/Default.aspx` | Greeting, "21 May 2025" pill, Search bar, 4 Yard cards, Price Rise & Fall previews |
| **5** | **Crop Search Results** | `Market/CropSearch.aspx` | `/Market/CropSearch.aspx?q=Garlic` | Garlic search results (6 found), rate cards across yards with chevrons |
| **6** | **Advanced Filter & Sort**| `Market/FilterSort.aspx` | `/Market/FilterSort.aspx` | Radio buttons (High-Low, Low-High, Latest), Yard checkboxes, Clear All / Apply |
| **7** | **Marketing Yard (Rajkot)**| `Yards/YardDetails.aspx` | `/Yards/YardDetails.aspx?id=rajkot` | Hero banner photo, Address, Total Shops (250+), Contact, Est 1985, Map button |
| **8** | **Marketing Yard (Junagadh)**| `Yards/YardDetails.aspx`| `/Yards/YardDetails.aspx?id=junagadh`| Station Road address, 180+ Shops, Established 1988, Actions |
| **9** | **Today's Market Rates** | `Market/Rates.aspx` | `/Market/Rates.aspx` | Crop, Arrival, Min, Avg, Max, "View Details" buttons, "Prices are for 20 Kg" badge |
| **10**| **7-Day Trend Chart** | `Market/PriceHistory.aspx` | `/Market/PriceHistory.aspx?crop=wheat`| Wheat (Ghau) canvas line chart (Min, Avg, Max) & 7-day data table |
| **11**| **Crop Price Details** | `Market/CropDetails.aspx` | `/Market/CropDetails.aspx?crop=wheat` | Today's Summary (980 bags, 19,600 kg), 3 Price cards (₹620, ₹670, ₹720), 7-day table |
| **12**| **Price Rise / Gainers** | `Market/PriceRise.aspx` | `/Market/PriceRise.aspx` | Cotton (+17.39%), Soyabean (+14.04%), Wheat (+9.84%), Tuver (+7.25%), Garlic |
| **13**| **Price Fall / Losers** | `Market/PriceFall.aspx` | `/Market/PriceFall.aspx` | Chana (-14.29%), Tuver (-10.67%), Soyabean (-9.09%), Wheat (-6.25%), Garlic |
| **14**| **Trusted Shop Directory**| `Shops/ShopDirectory.aspx`| `/Shops/ShopDirectory.aspx` | 3x3 Card Grid of certified merchants with `tel:` call buttons & live filter |
| **15**| **User Profile** | `Profile/Profile.aspx` | `/Profile/Profile.aspx` | Green banner, avatar, Harshal Dobariya, Personal Info, Change Password, Logout |
| **16**| **Change Password** | `Profile/ChangePassword.aspx` | `/Profile/ChangePassword.aspx` | Current, New, Confirm inputs, `CustomValidator` (diff pass), `CompareValidator` |
| **17**| **Admin Dashboard** | `Admin/Dashboard.aspx` | `/Admin/Dashboard.aspx` | Total Users (14,520), Active Yards (24), Quick Price Update with `CustomValidator` |
| **18**| **Admin - Manage Data** | `Admin/ManageData.aspx` | `/Admin/ManageData.aspx` | Tabs (Yards, Crops, Shops), "+ Add New Yard" form, in-memory Edit & Delete |
| **19**| **Users & Broadcast Alerts**| `Admin/UsersAlerts.aspx` | `/Admin/UsersAlerts.aspx` | Registered users table (Harshal, Ramesh, etc., Active/Blocked), Broadcast alert form |
| **20**| **Admin Settings** | `Admin/Settings.aspx` | `/Admin/Settings.aspx` | Change Admin Password, Update Helpline, Edit Terms, Version v1.0.0, Logout |
| **21**| **Help & Support** | `Support/HelpSupport.aspx` | `/Support/HelpSupport.aspx` | Green banner with help icon, FAQs, Call Helpline, Email, Bug report form |

---

## ✅ All Six Mandatory ASP.NET Web Forms Validators Checklist

Every one of the six required native ASP.NET validators is implemented with dedicated control IDs, server-side validation (`Page.IsValid`), and clear error styling:

| Validator Control | Implementation Page | Control ID | Validation Rule / Purpose |
| :--- | :--- | :--- | :--- |
| **1. RequiredFieldValidator** | `Account/Login.aspx` | `rfvEmail`, `rfvPassword` | Ensures mandatory email and password fields cannot be submitted empty. |
| | `Account/Register.aspx` | `rfvFullName`, `rfvMobileNumber`, `rfvEmail`, `rfvPassword`, `rfvConfirmPassword` | Ensures complete user registration inputs before submission. |
| | `Account/ForgotPassword.aspx` | `rfvIdentifier` | Requires an email or mobile number to send a reset link. |
| | `Profile/ChangePassword.aspx` | `rfvCurrentPassword`, `rfvNewPassword`, `rfvConfirmNewPassword` | Validates all password fields are supplied. |
| | `Admin/Dashboard.aspx` | `rfvArrival`, `rfvMinPrice`, `rfvAvgPrice`, `rfvMaxPrice` | Prevents submitting empty auction arrivals or prices. |
| | `Admin/ManageData.aspx` | `rfvYardName`, `rfvLocation`, `rfvTotalShopsInput`, `rfvEstYear` | Ensures all APMC yard properties are entered. |
| | `Admin/UsersAlerts.aspx` | `rfvAlertTitle`, `rfvAlertMsg` | Ensures broadcast title and message are provided. |
| | `Support/HelpSupport.aspx` | `rfvBugTitle`, `rfvBugDesc` | Validates issue title and description on bug reports. |
| **2. RangeValidator** | `Admin/Dashboard.aspx` | `rvArrival` | Validates arrival is between 1 and 100,000 bags (`Type="Integer"`). |
| | `Admin/Dashboard.aspx` | `rvMinPrice`, `rvAvgPrice`, `rvMaxPrice` | Validates prices are between ₹1 and ₹50,000 (`Type="Double"`). |
| | `Admin/ManageData.aspx` | `rvTotalShopsInput` | Validates yard shop count is between 1 and 10,000 (`Type="Integer"`). |
| | `Admin/ManageData.aspx` | `rvEstYear` | Validates yard establishment year is between 1900 and 2026 (`Type="Integer"`). |
| **3. CompareValidator** | `Account/Register.aspx` | `cvConfirmPassword` | Compares `txtConfirmPassword` to `txtPassword` (`Operator="Equal"`). |
| | `Profile/ChangePassword.aspx` | `cvConfirmNewPassword` | Compares `txtConfirmNewPassword` to `txtNewPassword` (`Operator="Equal"`). |
| | `Admin/Settings.aspx` | `cvAdminPass` | Compares new admin password to confirm password field (`Operator="Equal"`). |
| **4. RegularExpressionValidator**| `Account/Login.aspx` | `revEmail` | Validates standard email address syntax (`^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$`). |
| | `Account/Register.aspx` | `revMobileNumber` | Validates 10-digit Indian mobile number format (`^[6-9]\d{9}$`). |
| | `Account/ForgotPassword.aspx` | `revIdentifier` | Validates either a 10-digit mobile number OR a valid email format. |
| | `Profile/ChangePassword.aspx` | `revNewPassword` | Enforces minimum password length of 6 characters (`^.{6,25}$`). |
| **5. CustomValidator** | `Admin/Dashboard.aspx` | `cvPriceHierarchy` | **Server-side business rule validation** (`OnServerValidate`): verifies that `MinPrice <= AvgPrice` AND `AvgPrice <= MaxPrice`. |
| | `Profile/ChangePassword.aspx` | `cvDifferentPassword` | **Server-side rule validation**: verifies that the new password is not identical to the current password. |
| **6. ValidationSummary** | `Account/Login.aspx` | `valSummaryLogin` | Summarizes all login errors in a clear list at the top of the form. |
| | `Account/Register.aspx` | `valSummaryRegister` | Consolidates all registration validation messages. |
| | `Account/ForgotPassword.aspx` | `valSummaryForgot` | Displays password reset validation feedback. |
| | `Profile/ChangePassword.aspx` | `valSummaryChangePassword` | Summarizes password change errors. |
| | `Admin/Dashboard.aspx` | `valSummaryRateUpdate` | Consolidates quick price update errors. |
| | `Admin/ManageData.aspx` | `valSummaryNewYard` | Summarizes errors when adding a new yard. |
| | `Admin/UsersAlerts.aspx` | `valSummaryAlert` | Summarizes broadcast alert form errors. |
| | `Support/HelpSupport.aspx` | `valSummaryBug` | Summarizes bug report form errors. |

---

## 🗄️ SQL Server Database Schema (`Database/AgriYard_CreateTables.sql`)

The repository contains a standalone, production-ready SQL Server schema script:
`Database/AgriYard_CreateTables.sql`

### Entities Defined:
1. `dbo.Roles` — User authorization roles (Farmer, Trader, Shop Owner, Administrator).
2. `dbo.Users` — Registered system users with mobile numbers, emails, and statuses.
3. `dbo.UserRoles` — User-to-role junction table.
4. `dbo.MarketingYards` — APMC yards (Rajkot, Junagadh, Gondal, Mendarda) with addresses, contacts, shop counts, established years.
5. `dbo.Crops` — Commodities (Wheat, Soyabean, Chana, Cotton, Tuver, Garlic) with Gujarati names and standard 20 Kg maund units.
6. `dbo.DailyMarketRates` — Daily auction rates with bags arrival, `DECIMAL(10,2)` prices, and `MinPrice <= AvgPrice <= MaxPrice` check constraint.
7. `dbo.MarketPriceHistory` — 7-day historical prices for trend charts.
8. `dbo.Shops` — Trusted commission shops with contact numbers and yard associations.
9. `dbo.YardShops` — Multi-yard shop branch associations.
10. `dbo.BroadcastAlerts` — Targeted market bulletins and announcements.
11. `dbo.SupportRequests` — Help desk tickets and bug reports.
12. `dbo.AdminSettings` — System configuration keys (Helpline, Support Email, App Version).
13. `dbo.PasswordResetRequests` — Token tracking for self-service password recovery.

### How to Open & Run the SQL Script:
1. Open **SQL Server Management Studio (SSMS)** or **Azure Data Studio**.
2. Connect to your SQL Server instance (e.g., `localhost` or `SQLEXPRESS`).
3. Open `Database/AgriYard_CreateTables.sql`.
4. Click **Execute** (or press `F5`).
5. The script creates the `AgriYardDB` database, all 13 tables with constraints, indexes, and populates realistic seed data matching the Figma PDF.

*(Note: The web application runs completely independently without executing or connecting to this database.)*

---

## 🚀 Running the Project in Visual Studio

### Prerequisites:
- Microsoft Visual Studio 2019, 2022, or 2026 with the **ASP.NET and web development** workload installed.
- .NET Framework 4.8 / 4.8.1.

### Step-by-Step Instructions:
1. Launch **Visual Studio**.
2. Click **Open a project or solution**.
3. Select `AgriYard.sln` from the project directory (`c:\website\AgriYard.sln`).
4. Set the build configuration to **Debug** and platform to **Any CPU**.
5. Build the solution (**Build** > **Build Solution** or press `Ctrl + Shift + B`).
6. Press `F5` (or `Ctrl + F5`) to run the application using IIS Express.
7. The browser will open `http://localhost:5000/Default.aspx` (or your assigned IIS Express port).

---

## 🖥️ Running Directly with IIS Express (Command Line)

If Visual Studio is not currently open, you can launch the site directly using IIS Express:

```powershell
& "C:\Program Files\IIS Express\iisexpress.exe" /path:"c:\website" /port:8080
```

Then navigate to:
- Home Dashboard: [http://localhost:8080/Default.aspx](http://localhost:8080/Default.aspx)
- Today's Market Rates: [http://localhost:8080/Market/Rates.aspx](http://localhost:8080/Market/Rates.aspx)
- Crop Search (Garlic): [http://localhost:8080/Market/CropSearch.aspx](http://localhost:8080/Market/CropSearch.aspx)
- Seven-Day Trend Chart: [http://localhost:8080/Market/PriceHistory.aspx](http://localhost:8080/Market/PriceHistory.aspx)
- Price Rise (Gainers): [http://localhost:8080/Market/PriceRise.aspx](http://localhost:8080/Market/PriceRise.aspx)
- Price Fall (Losers): [http://localhost:8080/Market/PriceFall.aspx](http://localhost:8080/Market/PriceFall.aspx)
- Shop Directory: [http://localhost:8080/Shops/ShopDirectory.aspx](http://localhost:8080/Shops/ShopDirectory.aspx)
- User Profile: [http://localhost:8080/Profile/Profile.aspx](http://localhost:8080/Profile/Profile.aspx)
- Admin Dashboard: [http://localhost:8080/Admin/Dashboard.aspx](http://localhost:8080/Admin/Dashboard.aspx)

---

## 📁 Project Directory Structure

```
c:\website\
├── Account/
│   ├── Login.aspx & Login.aspx.cs           (Page 1: Login)
│   ├── ForgotPassword.aspx & .cs            (Page 2: Forgot Password)
│   └── Register.aspx & .cs                  (Page 3: Create Account)
├── Admin/
│   ├── Dashboard.aspx & .cs                 (Page 17: Admin Dashboard & Quick Price Update)
│   ├── ManageData.aspx & .cs                (Page 18: Manage Yards, Crops, Shops)
│   ├── UsersAlerts.aspx & .cs               (Page 19: Registered Users & Broadcast Alerts)
│   └── Settings.aspx & .cs                  (Page 20: Admin Settings)
├── Market/
│   ├── CropSearch.aspx & .cs                (Page 5: Crop Search Results)
│   ├── FilterSort.aspx & .cs                (Page 6: Advanced Filter & Sort)
│   ├── Rates.aspx & .cs                     (Page 9: Today's Market Rates)
│   ├── PriceHistory.aspx & .cs              (Page 10: Seven-Day Price Trend Chart)
│   ├── CropDetails.aspx & .cs               (Page 11: Crop Price Details)
│   ├── PriceRise.aspx & .cs                 (Page 12: Price Rise / Top Gainers)
│   └── PriceFall.aspx & .cs                 (Page 13: Price Fall / Top Losers)
├── Yards/
│   ├── YardDetails.aspx & .cs               (Pages 7 & 8: Marketing Yard Details)
│   └── YardList.aspx & .cs                  (All APMC Yards Directory)
├── Shops/
│   └── ShopDirectory.aspx & .cs             (Page 14: Trusted Shop Directory)
├── Profile/
│   ├── Profile.aspx & .cs                   (Page 15: User Profile)
│   ├── ChangePassword.aspx & .cs            (Page 16: Change Password)
│   └── PersonalInfo.aspx & .cs              (Personal Information editing)
├── Support/
│   └── HelpSupport.aspx & .cs               (Page 21: Help & Support)
├── Shared/
│   ├── Main.Master & Main.Master.cs         (Public Layout, Nav, Active Underline, Footer)
│   └── Admin.Master & Admin.Master.cs       (Admin Layout, Sidebar Navigation)
├── Models/
│   ├── UserModel.cs, YardModel.cs, CropModel.cs, MarketRateModel.cs,
│   ├── PriceHistoryModel.cs, ShopModel.cs, AlertModel.cs
├── Data/
│   └── SampleData.cs                        (Thread-safe in-memory collections & queries)
├── Content/
│   ├── site.css                             (Global tokens, reset, navbar, footer)
│   ├── auth.css                             (Auth card, form inputs, links)
│   ├── dashboard.css                        (Greeting, yard grid, trends preview)
│   ├── market.css                           (Tables, search cards, filters, chart styles)
│   ├── admin.css                            (Admin sidebar, metrics, form rows)
│   └── validation.css                       (Validator spans, highlights, error summary)
├── Scripts/
│   ├── site.js                              (Mobile drawer, password toggles, modals)
│   ├── market.js                            (Live shop search, filter helpers)
│   └── charts.js                            (Canvas 7-day trend line chart renderer)
├── Images/
│   ├── yard_rajkot.svg, yard_junagadh.svg, yard_gondal.svg, yard_mendarda.svg
│   ├── avatar.svg, lock_icon.svg, help_icon.svg, garlic_icon.svg
├── Database/
│   └── AgriYard_CreateTables.sql            (Standalone SQL Server creation script)
├── Default.aspx & Default.aspx.cs           (Page 4: Home Dashboard)
├── Global.asax & Global.asax.cs             (Application lifecycle hooks)
├── Web.config                               (Target framework 4.8 & validation settings)
├── AgriYard.csproj                          (Visual Studio Project)
├── AgriYard.sln                             (Visual Studio Solution)
└── README.md                                (Complete documentation)
```

---

## 💡 Beginner-Friendly Code Comments

Every C#, ASPX, JavaScript, and especially CSS file includes structured, descriptive English comments explaining:
- The purpose and architecture of every class and control.
- How event handlers process form submissions and verify `Page.IsValid`.
- How each of the six validators operates and why client-side and server-side checks both function.
- Detailed CSS component banners before every styling rule (e.g., `/* ========================================== GLOBAL PAGE STYLES ========================================== */`).
