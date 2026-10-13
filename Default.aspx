<%@ Page Title="Home Dashboard" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="AgriYard.Default" %>

<asp:Content ID="HeadContent1" ContentPlaceHolderID="HeadContent" runat="server">
    <%-- Dashboard specific styling --%>
    <link rel="stylesheet" href="~/Content/dashboard.css" />
</asp:Content>

<asp:Content ID="MainContent1" ContentPlaceHolderID="MainContent" runat="server">
    <div class="content-container">
        <%-- Top Header Row: Greeting & Current Date Badge (Page 4) --%>
        <div class="dash-header-row">
            <div>
                <h1 class="dash-greeting-title">Good Morning!</h1>
                <p class="dash-greeting-sub">Check today's market rates</p>
            </div>
            <div>
                <span class="date-pill-badge">21 May 2025</span>
            </div>
        </div>

        <%-- Broadcast Announcement Banner (from Admin) --%>
        <asp:Panel ID="pnlBroadcastBanner" runat="server" Visible="false" CssClass="broadcast-announcement-banner">
            <div class="broadcast-banner-icon">
                <svg width="22" height="22" viewBox="0 0 24 24" fill="none" stroke="#2e7d32" stroke-width="2.2" stroke-linecap="round" stroke-linejoin="round">
                    <path d="M18 8A6 6 0 0 0 6 8c0 7-3 9-3 9h18s-3-2-3-9"></path>
                    <path d="M13.73 21a2 2 0 0 1-3.46 0"></path>
                </svg>
            </div>
            <div class="broadcast-banner-body">
                <div class="broadcast-banner-title">
                    <asp:Literal ID="litBannerTitle" runat="server" />
                </div>
                <div class="broadcast-banner-desc">
                    <asp:Literal ID="litBannerBody" runat="server" />
                </div>
            </div>
        </asp:Panel>

        <%-- Quick Search Bar: Yard or Crop Lookup --%>
        <div class="dash-search-container">
            <div class="search-box-wrapper">
                <span class="search-icon-prefix">
                    <svg width="18" height="18" viewBox="0 0 24 24" fill="none" stroke="#8c9c8c" stroke-width="2.2" stroke-linecap="round" stroke-linejoin="round" style="display:block;">
                        <circle cx="11" cy="11" r="8"></circle>
                        <line x1="21" y1="21" x2="16.65" y2="16.65"></line>
                    </svg>
                </span>
                <asp:TextBox 
                    ID="txtDashboardSearch" 
                    runat="server" 
                    CssClass="dash-search-input" 
                    placeholder="Search yard or crop..." 
                    AutoPostBack="true" 
                    OnTextChanged="txtDashboardSearch_TextChanged" />
            </div>
        </div>

        <%-- Marketing Yards Section (4 Cards Grid) --%>
        <section style="margin-bottom: 36px;">
            <h2 class="section-heading-green">Marketing Yards</h2>
            <div class="yards-grid">
                <asp:Repeater ID="rptMarketingYards" runat="server">
                    <ItemTemplate>
                        <a href='<%# ResolveUrl("~/YardDetails.aspx?id=" + Eval("YardId")) %>' class="yard-card">
                            <img src='<%# ResolveUrl(Eval("ImageUrl").ToString()) %>' alt='<%# Eval("YardName") %>' class="yard-card-image" />
                            <div class="yard-card-body">
                                <h3 class="yard-card-title"><%# Eval("ShortName") %></h3>
                                <p class="yard-card-location"><%# Eval("Location") %></p>
                            </div>
                        </a>
                    </ItemTemplate>
                </asp:Repeater>
            </div>
        </section>

        <%-- Two-Column Trends Split: Price Rise & Price Fall Summary Cards --%>
        <section class="trends-split-row">
            <%-- Left Column: Price Rise (Top Gainers Today) --%>
            <div class="trend-summary-card">
                <div class="trend-card-header">
                    <h3 class="trend-card-title-gain">Price Rise</h3>
                    <p class="trend-card-subtitle">Top Gainers Today</p>
                </div>
                <div class="trend-item-list">
                    <asp:Repeater ID="rptTopGainers" runat="server">
                        <ItemTemplate>
                            <div class="trend-item-row">
                                <div class="trend-item-left">
                                    <span class="trend-arrow-badge-up">
                                        <svg width="10" height="10" viewBox="0 0 10 10" fill="#2e7d32" style="display:block;">
                                            <polygon points="5,1 9,8 1,8" />
                                        </svg>
                                    </span>
                                    <span class="trend-crop-name"><%# Eval("CropDisplayName") %></span>
                                </div>
                                <div style="display: flex; align-items: center;">
                                    <span class="trend-price-value"><%# Eval("AvgPriceFormatted") %></span>
                                    <span class="trend-gain-tag"><%# Eval("ChangeFormatted") %> (<%# Eval("PercentageFormatted") %>)</span>
                                </div>
                            </div>
                        </ItemTemplate>
                    </asp:Repeater>
                </div>
            </div>

            <%-- Right Column: Price Fall (Top Losers Today) --%>
            <div class="trend-summary-card">
                <div class="trend-card-header">
                    <h3 class="trend-card-title-loss">Price Fall</h3>
                    <p class="trend-card-subtitle">Top Losers Today</p>
                </div>
                <div class="trend-item-list">
                    <asp:Repeater ID="rptTopLosers" runat="server">
                        <ItemTemplate>
                            <div class="trend-item-row">
                                <div class="trend-item-left">
                                    <span class="trend-arrow-badge-down">
                                        <svg width="10" height="10" viewBox="0 0 10 10" fill="#d32f2f" style="display:block;">
                                            <polygon points="5,9 1,2 9,2" />
                                        </svg>
                                    </span>
                                    <span class="trend-crop-name"><%# Eval("CropDisplayName") %></span>
                                </div>
                                <div style="display: flex; align-items: center;">
                                    <span class="trend-price-value"><%# Eval("AvgPriceFormatted") %></span>
                                    <span class="trend-loss-tag"><%# Eval("ChangeFormatted") %> (<%# Eval("PercentageFormatted") %>)</span>
                                </div>
                            </div>
                        </ItemTemplate>
                    </asp:Repeater>
                </div>
            </div>
        </section>
    </div>
</asp:Content>

