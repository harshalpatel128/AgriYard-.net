<%@ Page Title="Price Fall - Top Losers" Language="C#" MasterPageFile="~/Shared/Main.Master" AutoEventWireup="true" CodeBehind="PriceFall.aspx.cs" Inherits="AgriYard.Market.PriceFall" %>

<asp:Content ID="HeadContent1" ContentPlaceHolderID="HeadContent" runat="server">
    <link rel="stylesheet" href="~/Content/market.css" />
</asp:Content>

<asp:Content ID="MainContent1" ContentPlaceHolderID="MainContent" runat="server">
    <div class="content-container">
        <%-- Page Header (Page 13 of PDF) --%>
        <div class="market-page-header">
            <div class="market-title-group">
                <h1 class="fall-title">Price Fall</h1>
                <p class="market-subtitle">Top Losers Today</p>
            </div>
            <div>
                <span class="unit-pill-badge">Prices are for 20 Kg</span>
            </div>
        </div>

        <%-- Top Losers Table --%>
        <div class="table-responsive-wrapper">
            <table class="agri-table">
                <thead>
                    <tr>
                        <th style="min-width: 200px;">Crop</th>
                        <th style="min-width: 140px;">Today's Price</th>
                        <th style="min-width: 140px;">Price Decrease</th>
                        <th style="min-width: 140px;">Percentage</th>
                    </tr>
                </thead>
                <tbody>
                    <asp:Repeater ID="rptPriceFall" runat="server">
                        <ItemTemplate>
                            <tr>
                                <td>
                                    <div class="crop-cell">
                                        <span class="crop-icon-chip" style="color: #d32f2f; background-color: #ffebee;">▼</span>
                                        <a href='<%# ResolveUrl("~/Market/CropDetails.aspx?crop=" + Eval("CropId")) %>' style="color: inherit; text-decoration: none;">
                                            <%# Eval("CropDisplayName") %>
                                        </a>
                                    </div>
                                </td>
                                <td class="price-cell"><%# Eval("AvgPriceFormatted") %></td>
                                <td class="loss-cell">▼ <%# Eval("ChangeFormatted") %></td>
                                <td class="loss-cell"><%# Eval("PercentageFormatted") %></td>
                            </tr>
                        </ItemTemplate>
                    </asp:Repeater>
                </tbody>
            </table>
        </div>

        <p class="table-footnote">* Prices are for 20 Kg</p>
    </div>
</asp:Content>
