<%@ Page Title="Marketing Yard Details" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="YardDetails.aspx.cs" Inherits="AgriYard.YardDetails" %>

<asp:Content ID="HeadContent1" ContentPlaceHolderID="HeadContent" runat="server">
    <link rel="stylesheet" href="~/Content/market.css" />
</asp:Content>

<asp:Content ID="MainContent1" ContentPlaceHolderID="MainContent" runat="server">
    <div class="content-container">
        <%-- Back Link (Pages 7 & 8 of PDF) --%>
        <a href="<%= ResolveUrl("~/Default.aspx") %>" class="back-nav-link">
            &lt; Back to Yards
        </a>

        <%-- Hero Banner Photo of APMC Yard --%>
        <asp:Image ID="imgYardHero" runat="server" CssClass="yard-details-hero-img" AlternateText="Marketing Yard Photo" />

        <%-- Yard Name Heading --%>
        <h1 style="font-size: 28px; font-weight: 800; color: #1b5e20; margin-bottom: 24px;">
            <asp:Literal ID="litYardName" runat="server">Rajkot Marketing Yard</asp:Literal>
        </h1>

        <%-- Two Column Layout: Info Cards Left, Action Buttons Right (Matching Page 7 & 8) --%>
        <div style="display: grid; grid-template-columns: 2fr 1fr; gap: 36px; align-items: start;">
            <%-- Left Column: 4 Information Metadata Cards --%>
            <div class="yard-info-grid">
                <%-- 1. Address Card --%>
                <div class="yard-info-card">
                    <div class="yard-info-icon">
                        <svg width="22" height="22" viewBox="0 0 24 24" fill="none" stroke="#2e7d32" stroke-width="2" stroke-linecap="round" stroke-linejoin="round">
                            <path d="M21 10c0 7-9 13-9 13s-9-6-9-13a9 9 0 0 1 18 0z"></path>
                            <circle cx="12" cy="10" r="3"></circle>
                        </svg>
                    </div>
                    <div class="yard-info-text">
                        <h4>Address</h4>
                        <p><asp:Literal ID="litAddress" runat="server">150ft Ring Road, Rajkot, Gujarat 360005</asp:Literal></p>
                    </div>
                </div>

                <%-- 2. Total Shops Card --%>
                <div class="yard-info-card">
                    <div class="yard-info-icon">
                        <svg width="22" height="22" viewBox="0 0 24 24" fill="none" stroke="#2e7d32" stroke-width="2" stroke-linecap="round" stroke-linejoin="round">
                            <path d="M3 9l9-7 9 7v11a2 2 0 0 1-2 2H5a2 2 0 0 1-2-2z"></path>
                            <polyline points="9 22 9 12 15 12 15 22"></polyline>
                        </svg>
                    </div>
                    <div class="yard-info-text">
                        <h4>Total Shops</h4>
                        <p><asp:Literal ID="litTotalShops" runat="server">250+ Shops</asp:Literal></p>
                    </div>
                </div>

                <%-- 3. Contact Number Card --%>
                <div class="yard-info-card">
                    <div class="yard-info-icon">
                        <svg width="22" height="22" viewBox="0 0 24 24" fill="none" stroke="#2e7d32" stroke-width="2" stroke-linecap="round" stroke-linejoin="round">
                            <path d="M22 16.92v3a2 2 0 0 1-2.18 2 19.79 19.79 0 0 1-8.63-3.07 19.5 19.5 0 0 1-6-6 19.79 19.79 0 0 1-3.07-8.67A2 2 0 0 1 4.11 2h3a2 2 0 0 1 2 1.72 12.84 12.84 0 0 0 .7 2.81 2 2 0 0 1-.45 2.11L8.09 9.91a16 16 0 0 0 6 6l1.27-1.27a2 2 0 0 1 2.11-.45 12.84 12.84 0 0 0 2.81.7A2 2 0 0 1 22 16.92z"></path>
                        </svg>
                    </div>
                    <div class="yard-info-text">
                        <h4>Contact Number</h4>
                        <p><asp:Literal ID="litContact" runat="server">0281 2456789</asp:Literal></p>
                    </div>
                </div>

                <%-- 4. Established Year Card --%>
                <div class="yard-info-card">
                    <div class="yard-info-icon">
                        <svg width="22" height="22" viewBox="0 0 24 24" fill="none" stroke="#2e7d32" stroke-width="2" stroke-linecap="round" stroke-linejoin="round">
                            <rect x="3" y="4" width="18" height="18" rx="2" ry="2"></rect>
                            <line x1="16" y1="2" x2="16" y2="6"></line>
                            <line x1="8" y1="2" x2="8" y2="6"></line>
                            <line x1="3" y1="10" x2="21" y2="10"></line>
                        </svg>
                    </div>
                    <div class="yard-info-text">
                        <h4>Established</h4>
                        <p><asp:Literal ID="litEstablished" runat="server">1985</asp:Literal></p>
                    </div>
                </div>
            </div>

            <%-- Right Column: Stacked Action Buttons --%>
            <div class="yard-actions-stack">
                <a href="<%= ResolveUrl("~/Rates.aspx") %>" class="btn btn-primary btn-block">
                    Today's Rates
                </a>
                <a href="<%= ResolveUrl("~/ShopDirectory.aspx") %>" class="btn btn-outline btn-block">
                    Shop List
                </a>
                <asp:HyperLink 
                    ID="lnkOpenMaps" 
                    runat="server" 
                    Target="_blank" 
                    CssClass="btn btn-outline btn-block">
                    Open in Maps
                </asp:HyperLink>
            </div>
        </div>
    </div>
</asp:Content>

