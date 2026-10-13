-- ============================================================================
-- SCRIPT NAME: AgriYard_CreateTables.sql
-- DESCRIPTION: Standalone SQL Server Database Schema and Initial Seed Data
-- APPLICATION: AgriYard - Agricultural Market Intelligence Platform
-- TARGET DBMS: Microsoft SQL Server 2016 / 2019 / 2022 / Azure SQL
-- AUTHOR:      AgriYard Engineering Team
-- NOTICE:      This script is a design deliverable only. The ASP.NET Web Forms
--              application runs entirely on in-memory mock data and does NOT
--              require or establish any database connection.
-- ============================================================================

-- Use master to safely create the database if executing in a local SQL Server instance
USE [master];
GO

IF NOT EXISTS (SELECT name FROM sys.databases WHERE name = N'AgriYardDB')
BEGIN
    CREATE DATABASE [AgriYardDB];
END
GO

USE [AgriYardDB];
GO

-- ============================================================================
-- SECTION 1: CLEANUP / DROP EXISTING TABLES IN REVERSE DEPENDENCY ORDER
-- ============================================================================

IF OBJECT_ID(N'dbo.PasswordResetRequests', N'U') IS NOT NULL DROP TABLE dbo.PasswordResetRequests;
IF OBJECT_ID(N'dbo.SupportRequests', N'U') IS NOT NULL DROP TABLE dbo.SupportRequests;
IF OBJECT_ID(N'dbo.BroadcastAlerts', N'U') IS NOT NULL DROP TABLE dbo.BroadcastAlerts;
IF OBJECT_ID(N'dbo.AdminSettings', N'U') IS NOT NULL DROP TABLE dbo.AdminSettings;
IF OBJECT_ID(N'dbo.YardShops', N'U') IS NOT NULL DROP TABLE dbo.YardShops;
IF OBJECT_ID(N'dbo.Shops', N'U') IS NOT NULL DROP TABLE dbo.Shops;
IF OBJECT_ID(N'dbo.MarketPriceHistory', N'U') IS NOT NULL DROP TABLE dbo.MarketPriceHistory;
IF OBJECT_ID(N'dbo.DailyMarketRates', N'U') IS NOT NULL DROP TABLE dbo.DailyMarketRates;
IF OBJECT_ID(N'dbo.Crops', N'U') IS NOT NULL DROP TABLE dbo.Crops;
IF OBJECT_ID(N'dbo.MarketingYards', N'U') IS NOT NULL DROP TABLE dbo.MarketingYards;
IF OBJECT_ID(N'dbo.UserRoles', N'U') IS NOT NULL DROP TABLE dbo.UserRoles;
IF OBJECT_ID(N'dbo.Users', N'U') IS NOT NULL DROP TABLE dbo.Users;
IF OBJECT_ID(N'dbo.Roles', N'U') IS NOT NULL DROP TABLE dbo.Roles;
GO

-- ============================================================================
-- SECTION 2: CORE SECURITY & USER MANAGEMENT ENTITIES
-- ============================================================================

-- ----------------------------------------------------------------------------
-- TABLE 1: Roles
-- Purpose: Defines authorization roles in the AgriYard system (Farmer, Trader, Shop Owner, Admin).
-- ----------------------------------------------------------------------------
CREATE TABLE dbo.Roles (
    RoleId          INT IDENTITY(1,1) NOT NULL,
    RoleName        NVARCHAR(50)      NOT NULL,
    RoleDescription NVARCHAR(250)     NULL,
    IsActive        BIT               NOT NULL CONSTRAINT DF_Roles_IsActive DEFAULT (1),
    CreatedAt       DATETIME2(7)      NOT NULL CONSTRAINT DF_Roles_CreatedAt DEFAULT (SYSDATETIME()),

    CONSTRAINT PK_Roles PRIMARY KEY CLUSTERED (RoleId),
    CONSTRAINT UQ_Roles_RoleName UNIQUE NONCLUSTERED (RoleName)
);
GO

-- ----------------------------------------------------------------------------
-- TABLE 2: Users
-- Purpose: Stores registered application users including farmers, traders, and administrators.
-- ----------------------------------------------------------------------------
CREATE TABLE dbo.Users (
    UserId          INT IDENTITY(1,1) NOT NULL,
    FullName        NVARCHAR(100)     NOT NULL,
    Email           NVARCHAR(150)     NOT NULL,
    MobileNumber    VARCHAR(15)       NOT NULL,
    PasswordHash    NVARCHAR(256)     NOT NULL,
    Status          VARCHAR(20)       NOT NULL CONSTRAINT DF_Users_Status DEFAULT ('Active'),
    PreferredYardId INT               NULL,
    LastLoginAt     DATETIME2(7)      NULL,
    CreatedAt       DATETIME2(7)      NOT NULL CONSTRAINT DF_Users_CreatedAt DEFAULT (SYSDATETIME()),
    UpdatedAt       DATETIME2(7)      NOT NULL CONSTRAINT DF_Users_UpdatedAt DEFAULT (SYSDATETIME()),

    CONSTRAINT PK_Users PRIMARY KEY CLUSTERED (UserId),
    CONSTRAINT UQ_Users_Email UNIQUE NONCLUSTERED (Email),
    CONSTRAINT UQ_Users_MobileNumber UNIQUE NONCLUSTERED (MobileNumber),
    CONSTRAINT CK_Users_Status CHECK (Status IN ('Active', 'Inactive', 'Blocked', 'Pending'))
);
GO

-- ----------------------------------------------------------------------------
-- TABLE 3: UserRoles
-- Purpose: Junction table supporting many-to-many role assignments for users.
-- ----------------------------------------------------------------------------
CREATE TABLE dbo.UserRoles (
    UserRoleId      INT IDENTITY(1,1) NOT NULL,
    UserId          INT               NOT NULL,
    RoleId          INT               NOT NULL,
    AssignedAt      DATETIME2(7)      NOT NULL CONSTRAINT DF_UserRoles_AssignedAt DEFAULT (SYSDATETIME()),

    CONSTRAINT PK_UserRoles PRIMARY KEY CLUSTERED (UserRoleId),
    CONSTRAINT FK_UserRoles_Users FOREIGN KEY (UserId) REFERENCES dbo.Users(UserId) ON DELETE CASCADE,
    CONSTRAINT FK_UserRoles_Roles FOREIGN KEY (RoleId) REFERENCES dbo.Roles(RoleId) ON DELETE CASCADE,
    CONSTRAINT UQ_UserRoles_User_Role UNIQUE NONCLUSTERED (UserId, RoleId)
);
GO

-- ============================================================================
-- SECTION 3: APMC MARKETING YARDS & CROPS
-- ============================================================================

-- ----------------------------------------------------------------------------
-- TABLE 4: MarketingYards
-- Purpose: Details of APMC yards (e.g. Rajkot, Junagadh, Gondal, Mendarda).
-- ----------------------------------------------------------------------------
CREATE TABLE dbo.MarketingYards (
    YardId          INT IDENTITY(1,1) NOT NULL,
    YardCode        VARCHAR(20)       NOT NULL,
    YardName        NVARCHAR(100)     NOT NULL,
    LocationCity    NVARCHAR(50)      NOT NULL,
    StateName       NVARCHAR(50)      NOT NULL CONSTRAINT DF_MarketingYards_State DEFAULT (N'Gujarat'),
    FullAddress     NVARCHAR(300)     NOT NULL,
    Pincode         VARCHAR(10)       NULL,
    ContactNumber   VARCHAR(20)       NOT NULL,
    TotalShopsCount INT               NOT NULL CONSTRAINT DF_MarketingYards_TotalShops DEFAULT (0),
    EstablishedYear INT               NOT NULL,
    ImageUrl        NVARCHAR(300)     NULL,
    Latitude        DECIMAL(9,6)      NULL,
    Longitude       DECIMAL(9,6)      NULL,
    IsActive        BIT               NOT NULL CONSTRAINT DF_MarketingYards_IsActive DEFAULT (1),
    CreatedAt       DATETIME2(7)      NOT NULL CONSTRAINT DF_MarketingYards_CreatedAt DEFAULT (SYSDATETIME()),
    UpdatedAt       DATETIME2(7)      NOT NULL CONSTRAINT DF_MarketingYards_UpdatedAt DEFAULT (SYSDATETIME()),

    CONSTRAINT PK_MarketingYards PRIMARY KEY CLUSTERED (YardId),
    CONSTRAINT UQ_MarketingYards_YardCode UNIQUE NONCLUSTERED (YardCode),
    CONSTRAINT UQ_MarketingYards_YardName UNIQUE NONCLUSTERED (YardName)
);
GO

-- ----------------------------------------------------------------------------
-- TABLE 5: Crops
-- Purpose: Commodity master table for agricultural crops traded in the yards.
-- ----------------------------------------------------------------------------
CREATE TABLE dbo.Crops (
    CropId          INT IDENTITY(1,1) NOT NULL,
    CropCode        VARCHAR(20)       NOT NULL,
    CropName        NVARCHAR(100)     NOT NULL,
    GujaratiName    NVARCHAR(100)     NOT NULL,
    Category        NVARCHAR(50)      NOT NULL, -- Grains, Pulses, Oilseeds, Spices, Cash Crops
    StandardUnitKg  INT               NOT NULL CONSTRAINT DF_Crops_StandardUnitKg DEFAULT (20), -- 20 Kg standard (Maund)
    UnitDisplayName NVARCHAR(30)      NOT NULL CONSTRAINT DF_Crops_UnitDisplay DEFAULT (N'20 Kg'),
    IconName        NVARCHAR(50)      NULL,
    IsActive        BIT               NOT NULL CONSTRAINT DF_Crops_IsActive DEFAULT (1),
    CreatedAt       DATETIME2(7)      NOT NULL CONSTRAINT DF_Crops_CreatedAt DEFAULT (SYSDATETIME()),

    CONSTRAINT PK_Crops PRIMARY KEY CLUSTERED (CropId),
    CONSTRAINT UQ_Crops_CropCode UNIQUE NONCLUSTERED (CropCode),
    CONSTRAINT UQ_Crops_CropName UNIQUE NONCLUSTERED (CropName)
);
GO

-- ============================================================================
-- SECTION 4: MARKET RATES & PRICE TREND HISTORIES
-- ============================================================================

-- ----------------------------------------------------------------------------
-- TABLE 6: DailyMarketRates
-- Purpose: Stores the latest intraday / daily auction rates for crops across yards.
-- ----------------------------------------------------------------------------
CREATE TABLE dbo.DailyMarketRates (
    RateId              BIGINT IDENTITY(1,1) NOT NULL,
    YardId              INT                  NOT NULL,
    CropId              INT                  NOT NULL,
    RateDate            DATE                 NOT NULL,
    ArrivalBags         INT                  NOT NULL CONSTRAINT DF_DailyMarketRates_Arrival DEFAULT (0),
    TotalQuantityKg     DECIMAL(12,2)        NOT NULL CONSTRAINT DF_DailyMarketRates_TotalQty DEFAULT (0.00),
    MinPrice            DECIMAL(10,2)        NOT NULL,
    AvgPrice            DECIMAL(10,2)        NOT NULL,
    MaxPrice            DECIMAL(10,2)        NOT NULL,
    PreviousAvgPrice    DECIMAL(10,2)        NULL,
    PriceChange         DECIMAL(10,2)        NOT NULL CONSTRAINT DF_DailyMarketRates_PriceChange DEFAULT (0.00),
    ChangePercentage    DECIMAL(5,2)         NOT NULL CONSTRAINT DF_DailyMarketRates_ChangePct DEFAULT (0.00),
    PriceTrend          VARCHAR(10)          NOT NULL CONSTRAINT DF_DailyMarketRates_Trend DEFAULT ('Stable'), -- Rise, Fall, Stable
    LastUpdated         DATETIME2(7)         NOT NULL CONSTRAINT DF_DailyMarketRates_LastUpdated DEFAULT (SYSDATETIME()),

    CONSTRAINT PK_DailyMarketRates PRIMARY KEY CLUSTERED (RateId),
    CONSTRAINT FK_DailyMarketRates_Yards FOREIGN KEY (YardId) REFERENCES dbo.MarketingYards(YardId),
    CONSTRAINT FK_DailyMarketRates_Crops FOREIGN KEY (CropId) REFERENCES dbo.Crops(CropId),
    CONSTRAINT UQ_DailyMarketRates_Yard_Crop_Date UNIQUE NONCLUSTERED (YardId, CropId, RateDate),
    CONSTRAINT CK_DailyMarketRates_PriceHierarchy CHECK (MinPrice <= AvgPrice AND AvgPrice <= MaxPrice),
    CONSTRAINT CK_DailyMarketRates_Trend CHECK (PriceTrend IN ('Rise', 'Fall', 'Stable'))
);
GO

-- ----------------------------------------------------------------------------
-- TABLE 7: MarketPriceHistory
-- Purpose: Historical records of daily closing prices used to render 7-day trend charts.
-- ----------------------------------------------------------------------------
CREATE TABLE dbo.MarketPriceHistory (
    HistoryId       BIGINT IDENTITY(1,1) NOT NULL,
    YardId          INT                  NOT NULL,
    CropId          INT                  NOT NULL,
    RecordDate      DATE                 NOT NULL,
    MinPrice        DECIMAL(10,2)        NOT NULL,
    AvgPrice        DECIMAL(10,2)        NOT NULL,
    MaxPrice        DECIMAL(10,2)        NOT NULL,
    ArrivalBags     INT                  NOT NULL,
    CreatedAt       DATETIME2(7)         NOT NULL CONSTRAINT DF_MarketPriceHistory_CreatedAt DEFAULT (SYSDATETIME()),

    CONSTRAINT PK_MarketPriceHistory PRIMARY KEY CLUSTERED (HistoryId),
    CONSTRAINT FK_MarketPriceHistory_Yards FOREIGN KEY (YardId) REFERENCES dbo.MarketingYards(YardId),
    CONSTRAINT FK_MarketPriceHistory_Crops FOREIGN KEY (CropId) REFERENCES dbo.Crops(CropId),
    CONSTRAINT UQ_MarketPriceHistory_Yard_Crop_Date UNIQUE NONCLUSTERED (YardId, CropId, RecordDate),
    CONSTRAINT CK_MarketPriceHistory_Prices CHECK (MinPrice <= AvgPrice AND AvgPrice <= MaxPrice)
);
GO

-- ============================================================================
-- SECTION 5: TRUSTED SHOPS & COMMISSIONS
-- ============================================================================

-- ----------------------------------------------------------------------------
-- TABLE 8: Shops
-- Purpose: Directory of certified and trusted commission merchants and traders.
-- ----------------------------------------------------------------------------
CREATE TABLE dbo.Shops (
    ShopId          INT IDENTITY(1,1) NOT NULL,
    YardId          INT                  NOT NULL,
    ShopName        NVARCHAR(150)        NOT NULL,
    OwnerName       NVARCHAR(100)        NULL,
    ContactNumber   VARCHAR(20)          NOT NULL,
    ShopNumber      NVARCHAR(50)         NULL,
    IsTrusted       BIT                  NOT NULL CONSTRAINT DF_Shops_IsTrusted DEFAULT (1),
    Status          VARCHAR(20)          NOT NULL CONSTRAINT DF_Shops_Status DEFAULT ('Active'),
    CreatedAt       DATETIME2(7)         NOT NULL CONSTRAINT DF_Shops_CreatedAt DEFAULT (SYSDATETIME()),

    CONSTRAINT PK_Shops PRIMARY KEY CLUSTERED (ShopId),
    CONSTRAINT FK_Shops_Yards FOREIGN KEY (YardId) REFERENCES dbo.MarketingYards(YardId),
    CONSTRAINT CK_Shops_Status CHECK (Status IN ('Active', 'Inactive', 'Suspended'))
);
GO

-- ----------------------------------------------------------------------------
-- TABLE 9: YardShops
-- Purpose: Many-to-many relationship table if shops operate branches across yards.
-- ----------------------------------------------------------------------------
CREATE TABLE dbo.YardShops (
    YardShopId      INT IDENTITY(1,1) NOT NULL,
    YardId          INT               NOT NULL,
    ShopId          INT               NOT NULL,
    BranchName      NVARCHAR(100)     NULL,
    AssignedDate    DATE              NOT NULL CONSTRAINT DF_YardShops_AssignedDate DEFAULT (CAST(SYSDATETIME() AS DATE)),

    CONSTRAINT PK_YardShops PRIMARY KEY CLUSTERED (YardShopId),
    CONSTRAINT FK_YardShops_Yards FOREIGN KEY (YardId) REFERENCES dbo.MarketingYards(YardId) ON DELETE CASCADE,
    CONSTRAINT FK_YardShops_Shops FOREIGN KEY (ShopId) REFERENCES dbo.Shops(ShopId) ON DELETE CASCADE,
    CONSTRAINT UQ_YardShops_Yard_Shop UNIQUE NONCLUSTERED (YardId, ShopId)
);
GO

-- ============================================================================
-- SECTION 6: ALERTS, SUPPORT, SETTINGS & AUTH AUDITING
-- ============================================================================

-- ----------------------------------------------------------------------------
-- TABLE 10: BroadcastAlerts
-- Purpose: Market announcements, arrival notices, and advisory alerts.
-- ----------------------------------------------------------------------------
CREATE TABLE dbo.BroadcastAlerts (
    AlertId         INT IDENTITY(1,1) NOT NULL,
    Title           NVARCHAR(200)     NOT NULL,
    MessageBody     NVARCHAR(MAX)     NOT NULL,
    TargetAudience  VARCHAR(50)       NOT NULL CONSTRAINT DF_BroadcastAlerts_Target DEFAULT ('All'),
    SentDate        DATETIME2(7)      NOT NULL CONSTRAINT DF_BroadcastAlerts_SentDate DEFAULT (SYSDATETIME()),
    Status          VARCHAR(20)       NOT NULL CONSTRAINT DF_BroadcastAlerts_Status DEFAULT ('Active'),
    CreatedByUserId INT               NULL,

    CONSTRAINT PK_BroadcastAlerts PRIMARY KEY CLUSTERED (AlertId),
    CONSTRAINT FK_BroadcastAlerts_Users FOREIGN KEY (CreatedByUserId) REFERENCES dbo.Users(UserId),
    CONSTRAINT CK_BroadcastAlerts_Status CHECK (Status IN ('Active', 'Archived', 'Draft'))
);
GO

-- ----------------------------------------------------------------------------
-- TABLE 11: SupportRequests
-- Purpose: Help desk feedback, helpline tickets, and user bug reports.
-- ----------------------------------------------------------------------------
CREATE TABLE dbo.SupportRequests (
    RequestId       INT IDENTITY(1,1) NOT NULL,
    UserId          INT               NULL,
    ContactPhone    VARCHAR(20)       NOT NULL,
    Subject         NVARCHAR(150)     NOT NULL,
    Category        VARCHAR(50)       NOT NULL, -- Rates Inquiry, Shop Contact, Bug Report, General
    Description     NVARCHAR(MAX)     NOT NULL,
    Status          VARCHAR(20)       NOT NULL CONSTRAINT DF_SupportRequests_Status DEFAULT ('Open'),
    SubmittedAt     DATETIME2(7)      NOT NULL CONSTRAINT DF_SupportRequests_SubmittedAt DEFAULT (SYSDATETIME()),

    CONSTRAINT PK_SupportRequests PRIMARY KEY CLUSTERED (RequestId),
    CONSTRAINT FK_SupportRequests_Users FOREIGN KEY (UserId) REFERENCES dbo.Users(UserId) ON DELETE SET NULL,
    CONSTRAINT CK_SupportRequests_Status CHECK (Status IN ('Open', 'InProgress', 'Resolved', 'Closed'))
);
GO

-- ----------------------------------------------------------------------------
-- TABLE 12: AdminSettings
-- Purpose: System-level configurations, helpline numbers, and version controls.
-- ----------------------------------------------------------------------------
CREATE TABLE dbo.AdminSettings (
    SettingId       INT IDENTITY(1,1) NOT NULL,
    SettingKey      VARCHAR(100)      NOT NULL,
    SettingValue    NVARCHAR(MAX)     NOT NULL,
    Category        VARCHAR(50)       NOT NULL CONSTRAINT DF_AdminSettings_Category DEFAULT ('General'),
    Description     NVARCHAR(250)     NULL,
    LastUpdatedAt   DATETIME2(7)      NOT NULL CONSTRAINT DF_AdminSettings_UpdatedAt DEFAULT (SYSDATETIME()),

    CONSTRAINT PK_AdminSettings PRIMARY KEY CLUSTERED (SettingId),
    CONSTRAINT UQ_AdminSettings_Key UNIQUE NONCLUSTERED (SettingKey)
);
GO

-- ----------------------------------------------------------------------------
-- TABLE 13: PasswordResetRequests
-- Purpose: Tokens and expiry tracking for self-service password reset flows.
-- ----------------------------------------------------------------------------
CREATE TABLE dbo.PasswordResetRequests (
    ResetRequestId  BIGINT IDENTITY(1,1) NOT NULL,
    UserIdentifier  NVARCHAR(150)        NOT NULL, -- Email or Mobile
    ResetToken      VARCHAR(100)         NOT NULL,
    ExpiresAt       DATETIME2(7)         NOT NULL,
    IsUsed          BIT                  NOT NULL CONSTRAINT DF_PasswordReset_IsUsed DEFAULT (0),
    RequestedAt     DATETIME2(7)         NOT NULL CONSTRAINT DF_PasswordReset_RequestedAt DEFAULT (SYSDATETIME()),

    CONSTRAINT PK_PasswordResetRequests PRIMARY KEY CLUSTERED (ResetRequestId)
);
GO

-- ============================================================================
-- SECTION 7: PERFORMANCE INDEXES
-- ============================================================================

CREATE NONCLUSTERED INDEX IX_DailyMarketRates_Date_Trend
    ON dbo.DailyMarketRates (RateDate, PriceTrend)
    INCLUDE (YardId, CropId, AvgPrice, PriceChange, ChangePercentage);
GO

CREATE NONCLUSTERED INDEX IX_MarketPriceHistory_Crop_Yard_Date
    ON dbo.MarketPriceHistory (CropId, YardId, RecordDate DESC);
GO

CREATE NONCLUSTERED INDEX IX_Shops_YardId
    ON dbo.Shops (YardId)
    INCLUDE (ShopName, ContactNumber, Status);
GO

-- ============================================================================
-- SECTION 8: SEED DATA POPULATION (MATCHING FIGMA SPECIFICATIONS)
-- ============================================================================

-- 1. Roles
INSERT INTO dbo.Roles (RoleName, RoleDescription) VALUES
(N'Farmer', N'Cultivator seeking transparent APMC market intelligence'),
(N'Trader', N'Registered commission trader and merchant'),
(N'Shop Owner', N'Certified APMC yard shop broker'),
(N'Administrator', N'System administrator with rate management privileges');
GO

-- 2. Users (from Page 19 of PDF)
INSERT INTO dbo.Users (FullName, Email, MobileNumber, PasswordHash, Status) VALUES
(N'Harshal Dobariya', N'harshal.dobariya@example.com', N'+91 98765 43210', N'DEMO_HASH_SECURE', 'Active'),
(N'Rameshbhai Patel', N'ramesh.patel@example.com',     N'+91 98234 56789', N'DEMO_HASH_SECURE', 'Active'),
(N'Mansukhbhai Savaliya', N'mansukh.savaliya@example.com', N'+91 97123 11223', N'DEMO_HASH_SECURE', 'Active'),
(N'Kantibhai Vaghani', N'kantibhai.vaghani@example.com', N'+91 94260 99887', N'DEMO_HASH_SECURE', 'Blocked');
GO

-- Assign user roles
INSERT INTO dbo.UserRoles (UserId, RoleId) VALUES
(1, 1), -- Harshal -> Farmer
(2, 2), -- Ramesh -> Trader
(3, 1), -- Mansukh -> Farmer
(4, 3); -- Kantibhai -> Shop Owner
GO

-- 3. Marketing Yards (Pages 4, 7, 8 of PDF)
INSERT INTO dbo.MarketingYards (YardCode, YardName, LocationCity, StateName, FullAddress, Pincode, ContactNumber, TotalShopsCount, EstablishedYear, ImageUrl) VALUES
(N'RAJ', N'Rajkot Marketing Yard',    N'Rajkot',   N'Gujarat', N'150ft Ring Road, Rajkot, Gujarat 360005',   N'360005', N'0281 2456789', 250, 1985, N'/Images/yard_rajkot.jpg'),
(N'JUN', N'Junagadh Marketing Yard',  N'Junagadh', N'Gujarat', N'Station Road, Junagadh, Gujarat 362001',    N'362001', N'0285 2621450', 180, 1988, N'/Images/yard_junagadh.jpg'),
(N'GON', N'Gondal Marketing Yard',    N'Gondal',   N'Gujarat', N'National Highway 27, Gondal, Gujarat 360311', N'360311', N'0282 5220015', 210, 1978, N'/Images/yard_gondal.jpg'),
(N'MEN', N'Mendarda Marketing Yard',  N'Mendarda', N'Gujarat', N'Market Yard Road, Mendarda, Gujarat 362260', N'362260', N'0287 2241230', 95,  1994, N'/Images/yard_mendarda.jpg');
GO

-- 4. Crops (Pages 4, 9, 10, 11, 12, 13 of PDF)
INSERT INTO dbo.Crops (CropCode, CropName, GujaratiName, Category, StandardUnitKg, UnitDisplayName, IconName) VALUES
(N'WHEAT',  N'Wheat',          N'Ghau',  N'Grains',   20, N'20 Kg', N'wheat'),
(N'SOYA',   N'Soyabean',       N'Soya',  N'Oilseeds', 20, N'20 Kg', N'soyabean'),
(N'CHANA',  N'Chana',          N'Gram',  N'Pulses',   20, N'20 Kg', N'chana'),
(N'COTTON', N'Cotton (Kapas)', N'Kapas', N'Cash Crop',20, N'20 Kg', N'cotton'),
(N'TUVER',  N'Tuver',          N'Tuver', N'Pulses',   20, N'20 Kg', N'tuver'),
(N'GARLIC', N'Garlic',         N'Lasan', N'Spices',   20, N'20 Kg', N'garlic');
GO

-- 5. Daily Market Rates (Matches Page 4, 9, 12, 13)
-- Rates for 21 May 2025 at Rajkot Yard (YardId = 1)
INSERT INTO dbo.DailyMarketRates (YardId, CropId, RateDate, ArrivalBags, TotalQuantityKg, MinPrice, AvgPrice, MaxPrice, PreviousAvgPrice, PriceChange, ChangePercentage, PriceTrend) VALUES
(1, 1, '2025-05-21', 980,  19600.00, 620.00, 670.00,  720.00,  610.00,  60.00,   9.84,  'Rise'),
(1, 2, '2025-05-21', 860,  17200.00, 600.00, 650.00,  700.00,  570.00,  80.00,  14.04,  'Rise'),
(1, 3, '2025-05-21', 750,  15000.00, 540.00, 590.00,  640.00,  680.00, -90.00, -14.29,  'Fall'),
(1, 4, '2025-05-21', 1020, 20400.00, 740.00, 810.00,  880.00,  690.00, 120.00,  17.39,  'Rise'),
(1, 5, '2025-05-21', 680,  13600.00, 700.00, 760.00,  820.00,  710.00,  50.00,   7.25,  'Rise'),
(1, 6, '2025-05-21', 560,  11200.00, 900.00, 1020.00, 1140.00, 960.00,  60.00,   6.32,  'Rise');
GO

-- 6. Historical 7-Day Prices for Wheat (Ghau) (Page 10, 11 of PDF)
INSERT INTO dbo.MarketPriceHistory (YardId, CropId, RecordDate, MinPrice, AvgPrice, MaxPrice, ArrivalBags) VALUES
(1, 1, '2025-05-20', 600.00, 650.00, 700.00, 950),
(1, 1, '2025-05-19', 590.00, 640.00, 690.00, 920),
(1, 1, '2025-05-18', 580.00, 630.00, 680.00, 890),
(1, 1, '2025-05-17', 570.00, 620.00, 670.00, 910),
(1, 1, '2025-05-16', 560.00, 610.00, 660.00, 870),
(1, 1, '2025-05-15', 550.00, 600.00, 650.00, 840),
(1, 1, '2025-05-14', 540.00, 590.00, 640.00, 800);
GO

-- 7. Trusted Shops (Page 14 of PDF)
INSERT INTO dbo.Shops (YardId, ShopName, OwnerName, ContactNumber, ShopNumber, IsTrusted, Status) VALUES
(1, N'Ramdev Trading',          N'Rameshbhai Patel',    N'+91 8238930700', N'Shop No. 12', 1, 'Active'),
(1, N'Patel Corporation',       N'Bharat Patel',        N'+91 98765 43211', N'Shop No. 18', 1, 'Active'),
(1, N'Mahadev Agency',          N'Govindbhai Dabhi',    N'+91 98765 43212', N'Shop No. 25', 1, 'Active'),
(1, N'Shree Krishna Traders',   N'Kishorbhai Radadiya', N'+91 98765 43213', N'Shop No. 31', 1, 'Active'),
(1, N'Jay Khodiyar Traders',    N'Pravinbhai Khodiyar', N'+91 98765 43214', N'Shop No. 42', 1, 'Active'),
(1, N'Balaji Trading Co.',      N'Sanjaybhai Balaji',   N'+91 98765 43215', N'Shop No. 54', 1, 'Active'),
(1, N'Shivam Enterprise',       N'Mukeshbhai Shivam',   N'+91 98765 43216', N'Shop No. 67', 1, 'Active'),
(1, N'Om Agro Traders',         N'Hasmukhbhai Om',      N'+91 98765 43217', N'Shop No. 78', 1, 'Active'),
(1, N'Shakti Commission Agent', N'Shaktisinh Jadeja',   N'+91 98765 43218', N'Shop No. 89', 1, 'Active');
GO

-- 8. Admin Settings (Page 20 of PDF)
INSERT INTO dbo.AdminSettings (SettingKey, SettingValue, Category, Description) VALUES
(N'HelplineNumber',   N'+91 9624042246',            N'Support', N'Toll-free farmer helpline phone number'),
(N'SupportEmail',     N'support@agriyard.com',      N'Support', N'Official support email address'),
(N'AppVersion',       N'v1.0.0',                    N'System',  N'Current deployed mobile/web build version'),
(N'ForceUpdateMinVer',N'v1.0.0',                    N'System',  N'Minimum mandatory client version required');
GO

-- 9. Broadcast Alerts (Page 19 of PDF)
INSERT INTO dbo.BroadcastAlerts (Title, MessageBody, TargetAudience, Status, CreatedByUserId) VALUES
(N'Cotton Arrival Spike at Rajkot Yard',
 N'Heavy arrival of fresh Kapas recorded this morning. Sellers advised to plan transit accordingly.',
 N'All Farmers & Traders', 'Active', 1),
(N'Monsoon APMC Holiday Notice',
 N'Marketing yards will observe market holiday on coming Monday for routine yard sanitation.',
 N'All', 'Active', 1);
GO

PRINT 'AgriYard database schema and initial seed data creation completed successfully.';
GO
