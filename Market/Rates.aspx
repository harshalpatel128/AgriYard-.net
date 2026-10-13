<%@ Page Title="Today's Market Rates" Language="C#" MasterPageFile="~/Shared/Main.Master" AutoEventWireup="true" CodeBehind="Rates.aspx.cs" Inherits="AgriYard.Market.Rates" %>

<asp:Content ID="HeadContent1" ContentPlaceHolderID="HeadContent" runat="server">
    <link rel="stylesheet" href="~/Content/market.css" />
</asp:Content>

<asp:Content ID="MainContent1" ContentPlaceHolderID="MainContent" runat="server">
    <div class="content-container">
        <%-- Page Header: Title and 20 Kg Price Disclaimer Badge (Page 9 of PDF) --%>
        <div class="market-page-header">
            <div class="market-title-group">
                <h1>Today's Market Rates</h1>
            </div>
            <div>
                <span class="unit-pill-badge">Prices are for 20 Kg</span>
            </div>
        </div>

        <%-- Optional Active Filter Notification Banner --%>
        <asp:Panel ID="pnlFilterNotice" runat="server" Visible="false" CssClass="demo-info-banner">
            <asp:Literal ID="litFilterNotice" runat="server" />
            <a href="<%= ResolveUrl("~/Market/Rates.aspx") %>" style="margin-left: 10px; font-weight: 700; text-decoration: underline;">Reset Filters</a>
        </asp:Panel>

        <%-- Responsive Market Rates Table Wrapper --%>
        <div class="table-responsive-wrapper">
            <table class="agri-table">
                <thead>
                    <tr>
                        <th style="min-width: 180px;">Crop</th>
                        <th style="min-width: 120px;">Arrival</th>
                        <th style="min-width: 100px;">Min</th>
                        <th style="min-width: 100px;">Avg</th>
                        <th style="min-width: 100px;">Max</th>
                        <th style="text-align: right; min-width: 140px;">Action</th>
                    </tr>
                </thead>
                <tbody>
                    <asp:Repeater ID="rptMarketRates" runat="server">
                        <ItemTemplate>
                            <tr>
                                <td>
                                    <div class="crop-cell">
                                        <span class="crop-icon-chip">
                                            <svg width="15" height="15" viewBox="0 0 24 24" fill="none" stroke="#2e7d32" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" style="display:block;">
                                                <path d="M2 22s5.5-1.5 8.5-5.5C13.5 12.5 15 7 15 7s-5.5 1.5-9.5 5.5C1.5 16.5 2 22 2 22z" fill="#e8f5e9"></path>
                                                <path d="M12 12l8-8"></path>
                                                <path d="M17 4l3 3"></path>
                                            </svg>
                                        </span>
                                        <span><%# Eval("CropDisplayName") %></span>
                                    </div>
                                </td>
                                <td><%# Eval("ArrivalDisplay") %></td>
                                <td class="price-cell"><%# Eval("MinPriceFormatted") %></td>
                                <td class="price-cell" style="color: #2e7d32;"><%# Eval("AvgPriceFormatted") %></td>
                                <td class="price-cell"><%# Eval("MaxPriceFormatted") %></td>
                                <td style="text-align: right;">
                                    <a href='<%# ResolveUrl("~/Market/CropDetails.aspx?crop=" + Eval("CropId")) %>' class="btn-pill-outline">
                                        View Details
                                    </a>
                                </td>
                            </tr>
                        </ItemTemplate>
                    </asp:Repeater>
                </tbody>
            </table>
        </div>

        <%-- Footnote --%>
        <p class="table-footnote">* Prices are subject to change</p>
    </div>
</asp:Content>
