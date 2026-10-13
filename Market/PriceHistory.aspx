<%@ Page Title="Seven-Day Price Trend Chart" Language="C#" MasterPageFile="~/Shared/Main.Master" AutoEventWireup="true" CodeBehind="PriceHistory.aspx.cs" Inherits="AgriYard.Market.PriceHistory" %>

<asp:Content ID="HeadContent1" ContentPlaceHolderID="HeadContent" runat="server">
    <link rel="stylesheet" href="~/Content/market.css" />
</asp:Content>

<asp:Content ID="MainContent1" ContentPlaceHolderID="MainContent" runat="server">
    <div class="content-container">
        <%-- Back Link (Page 10 of PDF) --%>
        <a href="<%= ResolveUrl("~/Market/Rates.aspx") %>" class="back-nav-link">
            &lt; Back to Today's Rates
        </a>

        <%-- Page Heading and 20 Kg Unit Subtitle --%>
        <div style="margin-bottom: 24px;">
            <h1 style="font-size: 26px; font-weight: 800; color: #1b5e20; margin-bottom: 4px;">
                <asp:Literal ID="litTrendHeading" runat="server">Wheat (Ghau) - Last 7 Days</asp:Literal>
            </h1>
            <p style="font-size: 14px; color: #5c6f5c;">Prices for 20 Kg</p>
        </div>

        <%-- Main Trend Container: Chart on Left, Data Table on Right --%>
        <div class="chart-container-card">
            <div style="display: grid; grid-template-columns: 1.4fr 1fr; gap: 32px; align-items: start;">
                <%-- Left Column: Interactive Canvas Line Chart --%>
                <div>
                    <div class="chart-canvas-wrapper">
                        <canvas id="priceTrendCanvas" style="width: 100%; height: 100%; display: block;"></canvas>
                    </div>

                    <%-- Chart Legend Matching Figma --%>
                    <div class="chart-legend">
                        <div class="legend-item">
                            <span class="legend-dot dot-min"></span>
                            <span>Min Price</span>
                        </div>
                        <div class="legend-item">
                            <span class="legend-dot dot-avg"></span>
                            <span>Avg Price</span>
                        </div>
                        <div class="legend-item">
                            <span class="legend-dot dot-max"></span>
                            <span>Max Price</span>
                        </div>
                    </div>
                </div>

                <%-- Right Column: 7-Day History Table --%>
                <div>
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
                                <asp:Repeater ID="rptPriceHistoryTable" runat="server">
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
    </div>

    <%-- Chart Rendering Script --%>
    <script src="<%= ResolveUrl("~/Scripts/charts.js") %>"></script>
</asp:Content>
