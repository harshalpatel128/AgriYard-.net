<%@ Page Title="Crop Price Details" Language="C#" MasterPageFile="~/Shared/Main.Master" AutoEventWireup="true" CodeBehind="CropDetails.aspx.cs" Inherits="AgriYard.Market.CropDetails" %>

<asp:Content ID="HeadContent1" ContentPlaceHolderID="HeadContent" runat="server">
    <link rel="stylesheet" href="~/Content/market.css" />
</asp:Content>

<asp:Content ID="MainContent1" ContentPlaceHolderID="MainContent" runat="server">
    <div class="content-container">
        <%-- Back Link to Rates (Page 11) --%>
        <a href="<%= ResolveUrl("~/Market/Rates.aspx") %>" class="back-nav-link">
            &lt; Back to Today's Rates
        </a>

        <%-- Header Row: Crop Title & Last Updated Timestamp --%>
        <div class="market-page-header">
            <div style="display: flex; align-items: center; gap: 12px;">
                <span class="crop-icon-chip" style="width: 38px; height: 38px; font-size: 18px;">🌾</span>
                <h1 style="font-size: 26px; font-weight: 800; color: #1b5e20;">
                    <asp:Literal ID="litCropTitle" runat="server">Wheat (Ghau)</asp:Literal>
                </h1>
            </div>
            <div style="font-size: 13.5px; color: #687968;">
                Last Updated: <asp:Literal ID="litLastUpdated" runat="server">21 May 2025, 08:30 AM</asp:Literal>
            </div>
        </div>

        <%-- Two Column Split: Today's Summary & 7-Day History Table --%>
        <div class="crop-details-grid">
            <%-- Left Column: Today's Summary (20 Kg) --%>
            <div class="crop-summary-card">
                <h3 class="crop-summary-heading">Today's Summary (20 Kg)</h3>

                <%-- Arrival and Total Quantity Stats --%>
                <div class="stats-two-up">
                    <div class="stat-box">
                        <div class="stat-label">Total Arrival</div>
                        <div class="stat-val"><asp:Literal ID="litArrival" runat="server">980 Bags</asp:Literal></div>
                    </div>
                    <div class="stat-box">
                        <div class="stat-label">Total Quantity</div>
                        <div class="stat-val"><asp:Literal ID="litTotalQty" runat="server">19,600 Kg</asp:Literal></div>
                    </div>
                </div>

                <%-- Three Price Highlight Cards: Min, Avg, Highest --%>
                <div class="price-three-cards">
                    <div class="price-highlight-card min-box">
                        <div class="price-box-label">Minimum Price</div>
                        <div class="price-box-amount"><asp:Literal ID="litMinPrice" runat="server">₹620</asp:Literal></div>
                    </div>
                    <div class="price-highlight-card avg-box">
                        <div class="price-box-label">Average Price</div>
                        <div class="price-box-amount"><asp:Literal ID="litAvgPrice" runat="server">₹670</asp:Literal></div>
                    </div>
                    <div class="price-highlight-card max-box">
                        <div class="price-box-label">Highest Price</div>
                        <div class="price-box-amount"><asp:Literal ID="litMaxPrice" runat="server">₹720</asp:Literal></div>
                    </div>
                </div>

                <%-- View Full Trend Chart Button --%>
                <asp:HyperLink 
                    ID="lnkViewChart" 
                    runat="server" 
                    NavigateUrl="~/Market/PriceHistory.aspx" 
                    CssClass="btn btn-primary btn-block">
                    View Full Trend Chart
                </asp:HyperLink>
            </div>

            <%-- Right Column: Previous 7 Days Prices (20 Kg) Table --%>
            <div class="crop-summary-card">
                <h3 class="crop-summary-heading">Previous 7 Days Prices (20 Kg)</h3>

                <div class="table-responsive-wrapper" style="box-shadow: none; border-radius: 8px;">
                    <table class="agri-table">
                        <thead>
                            <tr>
                                <th>Date</th>
                                <th>Min (₹)</th>
                                <th>Avg (₹)</th>
                                <th>Max (₹)</th>
                            </tr>
                        </thead>
                        <tbody>
                            <asp:Repeater ID="rptSevenDayHistory" runat="server">
                                <ItemTemplate>
                                    <tr>
                                        <td><%# Eval("DateString") %></td>
                                        <td class="price-cell"><%# Eval("MinFormatted") %></td>
                                        <td class="price-cell" style="color: #2e7d32;"><%# Eval("AvgFormatted") %></td>
                                        <td class="price-cell"><%# Eval("MaxFormatted") %></td>
                                    </tr>
                                </ItemTemplate>
                            </asp:Repeater>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
