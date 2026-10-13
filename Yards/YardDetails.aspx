<%@ Page Title="Marketing Yard Details" Language="C#" MasterPageFile="~/Shared/Main.Master" AutoEventWireup="true" CodeBehind="YardDetails.aspx.cs" Inherits="AgriYard.Yards.YardDetails" %>

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
                    <div class="yard-info-icon">📍</div>
                    <div class="yard-info-text">
                        <h4>Address</h4>
                        <p><asp:Literal ID="litAddress" runat="server">150ft Ring Road, Rajkot, Gujarat 360005</asp:Literal></p>
                    </div>
                </div>

                <%-- 2. Total Shops Card --%>
                <div class="yard-info-card">
                    <div class="yard-info-icon">🏪</div>
                    <div class="yard-info-text">
                        <h4>Total Shops</h4>
                        <p><asp:Literal ID="litTotalShops" runat="server">250+ Shops</asp:Literal></p>
                    </div>
                </div>

                <%-- 3. Contact Number Card --%>
                <div class="yard-info-card">
                    <div class="yard-info-icon">📞</div>
                    <div class="yard-info-text">
                        <h4>Contact Number</h4>
                        <p><asp:Literal ID="litContact" runat="server">0281 2456789</asp:Literal></p>
                    </div>
                </div>

                <%-- 4. Established Year Card --%>
                <div class="yard-info-card">
                    <div class="yard-info-icon">📅</div>
                    <div class="yard-info-text">
                        <h4>Established</h4>
                        <p><asp:Literal ID="litEstablished" runat="server">1985</asp:Literal></p>
                    </div>
                </div>
            </div>

            <%-- Right Column: Stacked Action Buttons --%>
            <div class="yard-actions-stack">
                <a href="<%= ResolveUrl("~/Market/Rates.aspx") %>" class="btn btn-primary btn-block">
                    Today's Rates
                </a>
                <a href="<%= ResolveUrl("~/Shops/ShopDirectory.aspx") %>" class="btn btn-outline btn-block">
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
