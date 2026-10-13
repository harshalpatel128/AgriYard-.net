<%@ Page Title="Crop Search Results" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="CropSearch.aspx.cs" Inherits="AgriYard.CropSearch" %>

<asp:Content ID="HeadContent1" ContentPlaceHolderID="HeadContent" runat="server">
    <link rel="stylesheet" href="~/Content/market.css" />
</asp:Content>

<asp:Content ID="MainContent1" ContentPlaceHolderID="MainContent" runat="server">
    <div class="content-container">
        <%-- Top Search & Filter Bar (Matching Page 5 of PDF) --%>
        <div style="display: flex; gap: 12px; align-items: center; margin-bottom: 24px;">
            <div class="search-box-wrapper" style="flex: 1;">
                <span class="search-icon-prefix">
                    <svg width="18" height="18" viewBox="0 0 24 24" fill="none" stroke="#8c9c8c" stroke-width="2.2" stroke-linecap="round" stroke-linejoin="round" style="display:block;">
                        <circle cx="11" cy="11" r="8"></circle>
                        <line x1="21" y1="21" x2="16.65" y2="16.65"></line>
                    </svg>
                </span>
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
                Style="padding: 13px 18px; border-radius: 12px; font-size: 16px; line-height: 1;" 
                OnClick="btnClearSearch_Click" 
                ToolTip="Clear search">
                &times;
            </asp:LinkButton>

            <%-- Advanced Filter & Sort Page Button (Filter Icon matching Page 5 of PDF) --%>
            <a href="<%= ResolveUrl("~/FilterSort.aspx") %>" class="btn btn-outline" style="padding: 13px 18px; border-radius: 12px; display:inline-flex; align-items:center; gap:6px;" title="Open Advanced Filters">
                <svg width="16" height="16" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round">
                    <line x1="4" y1="6" x2="20" y2="6"></line>
                    <line x1="7" y1="12" x2="17" y2="12"></line>
                    <line x1="10" y1="18" x2="14" y2="18"></line>
                </svg>
                <span>Filters</span>
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
                    <a href='<%# ResolveUrl("~/CropDetails.aspx?crop=" + Eval("CropId")) %>' class="search-result-card">
                        <div class="search-card-left">
                            <div class="search-card-icon">
                                <img src="<%= ResolveUrl("~/Images/garlic_icon.svg") %>" alt="Garlic" width="24" height="24" />
                            </div>
                            <div class="search-card-info">
                                <h3><%# Eval("CropDisplayName") %></h3>
                                <p><%# Eval("YardName") %> &bull; <%# Eval("LastUpdatedText") %></p>
                            </div>
                        </div>
                        <div class="search-card-right">
                            <div class="search-card-price">
                                <%# Eval("AvgPriceFormatted") %>
                            </div>
                            <div class="search-card-chevron">
                                <svg width="16" height="16" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2.5" stroke-linecap="round" stroke-linejoin="round" style="display:block;">
                                    <polyline points="9 18 15 12 9 6"></polyline>
                                </svg>
                            </div>
                        </div>
                    </a>
                </ItemTemplate>
            </asp:Repeater>
        </div>

        <%-- Bottom Can't Find Notice --%>
        <div class="search-empty-state">
            <p style="font-weight: 600; color: #3b4d3b; margin-bottom: 4px;">Can't find what you're looking for?</p>
            <p style="font-size: 13.5px;">Try searching another crop or yard, or <a href="<%= ResolveUrl("~/Rates.aspx") %>">view all today's rates</a>.</p>
        </div>
    </div>
</asp:Content>

