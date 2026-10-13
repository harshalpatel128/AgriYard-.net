<%@ Page Title="Price Rise - Top Gainers" Language="C#" MasterPageFile="~/Shared/Main.Master" AutoEventWireup="true" CodeBehind="PriceRise.aspx.cs" Inherits="AgriYard.Market.PriceRise" %>

<asp:Content ID="HeadContent1" ContentPlaceHolderID="HeadContent" runat="server">
    <link rel="stylesheet" href="~/Content/market.css" />
</asp:Content>

<asp:Content ID="MainContent1" ContentPlaceHolderID="MainContent" runat="server">
    <div class="content-container">
        <%-- Page Header (Page 12 of PDF) --%>
        <div class="market-page-header">
            <div class="market-title-group">
                <h1 class="rise-title">Price Rise</h1>
                <p class="market-subtitle">Top Gainers Today</p>
            </div>
            <div>
                <span class="unit-pill-badge">Prices are for 20 Kg</span>
            </div>
        </div>

        <%-- Top Gainers Table --%>
        <div class="table-responsive-wrapper">
            <table class="agri-table">
                <thead>
                    <tr>
                        <th style="min-width: 200px;">Crop</th>
                        <th style="min-width: 140px;">Today's Price</th>
                        <th style="min-width: 140px;">Price Increase</th>
                        <th style="min-width: 140px;">Percentage</th>
                    </tr>
                </thead>
                <tbody>
                    <asp:Repeater ID="rptPriceRise" runat="server">
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
                                        <a href='<%# ResolveUrl("~/Market/CropDetails.aspx?crop=" + Eval("CropId")) %>' style="color: inherit; text-decoration: none;">
                                            <%# Eval("CropDisplayName") %>
                                        </a>
                                    </div>
                                </td>
                                <td class="price-cell"><%# Eval("AvgPriceFormatted") %></td>
                                <td class="gain-cell">
                                    <svg width="10" height="10" viewBox="0 0 10 10" fill="#2e7d32" style="display:inline-block; vertical-align:middle; margin-right:4px;">
                                        <polygon points="5,1 9,8 1,8" />
                                    </svg>
                                    <%# Eval("ChangeFormatted") %>
                                </td>
                                <td class="gain-cell"><%# Eval("PercentageFormatted") %></td>
                            </tr>
                        </ItemTemplate>
                    </asp:Repeater>
                </tbody>
            </table>
        </div>

        <p class="table-footnote">* Prices are for 20 Kg</p>
    </div>
</asp:Content>
