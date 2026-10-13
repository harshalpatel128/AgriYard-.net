<%@ Page Title="Crop Search Results" Language="C#" MasterPageFile="~/Shared/Main.Master" AutoEventWireup="true" CodeBehind="CropSearch.aspx.cs" Inherits="AgriYard.Market.CropSearch" %>

<asp:Content ID="HeadContent1" ContentPlaceHolderID="HeadContent" runat="server">
    <link rel="stylesheet" href="~/Content/market.css" />
</asp:Content>

<asp:Content ID="MainContent1" ContentPlaceHolderID="MainContent" runat="server">
    <div class="content-container" style="max-width: 900px;">
        <%-- Top Search & Filter Bar (Matching Page 5 of PDF) --%>
        <div style="display: flex; gap: 12px; align-items: center; margin-bottom: 24px;">
            <div class="search-box-wrapper" style="flex: 1;">
                <span class="search-icon-prefix">🔍</span>
                <asp:TextBox 
                    ID="cropSearchInput" 
                    runat="server" 
                    CssClass="dash-search-input" 
                    placeholder="Search crop or yard..." 
                    Text="Garlic" 
                    AutoPostBack="true" 
                    OnTextChanged="cropSearchInput_TextChanged" />
            </div>

            <%-- Clear Search Button (x) --%>
            <asp:LinkButton 
                ID="btnClearSearch" 
                runat="server" 
                CssClass="btn btn-outline" 
                Style="padding: 13px 18px; border-radius: 12px; font-size: 16px;" 
                OnClick="btnClearSearch_Click" 
                ToolTip="Clear search">
                ✕
            </asp:LinkButton>

            <%-- Advanced Filter & Sort Page Button (Filter Icon) --%>
            <a href="<%= ResolveUrl("~/Market/FilterSort.aspx") %>" class="btn btn-outline" style="padding: 13px 18px; border-radius: 12px;" title="Open Advanced Filters">
                ⚙ Filters
            </a>
        </div>

        <%-- Results Count Header --%>
        <div class="search-results-header">
            <h2 class="search-results-heading">
                Results for "<asp:Literal ID="litSearchTerm" runat="server">Garlic</asp:Literal>"
            </h2>
            <div class="search-results-count">
                <asp:Literal ID="litResultCount" runat="server">6 Results Found</asp:Literal>
            </div>
        </div>

        <%-- List of Matching Yard Rate Cards --%>
        <div class="search-card-list">
            <asp:Repeater ID="rptSearchResults" runat="server">
                <ItemTemplate>
                    <a href='<%# ResolveUrl("~/Market/CropDetails.aspx?crop=" + Eval("CropId")) %>' class="search-result-card">
                        <div class="search-card-left">
                            <div class="search-card-icon">
                                <img src="<%= ResolveUrl("~/Images/garlic_icon.svg") %>" alt="Garlic" width="24" height="24" />
                            </div>
                            <div class="search-card-info">
                                <h3><%# Eval("CropDisplayName") %></h3>
                                <p><%# Eval("YardName") %> • <%# Eval("LastUpdatedText") %></p>
                            </div>
                        </div>
                        <div class="search-card-right">
                            <div class="search-card-price">
                                <%# Eval("AvgPriceFormatted") %>
                            </div>
                            <div class="search-card-chevron">
                                ❯
                            </div>
                        </div>
                    </a>
                </ItemTemplate>
            </asp:Repeater>
        </div>

        <%-- Bottom Can't Find Notice --%>
        <div class="search-empty-state">
            <p style="font-weight: 600; color: #3b4d3b; margin-bottom: 4px;">Can't find what you're looking for?</p>
            <p style="font-size: 13.5px;">Try searching another crop or yard, or <a href="<%= ResolveUrl("~/Market/Rates.aspx") %>">view all today's rates</a>.</p>
        </div>
    </div>
</asp:Content>
