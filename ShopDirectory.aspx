<%@ Page Title="Trusted Shop Directory" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="ShopDirectory.aspx.cs" Inherits="AgriYard.ShopDirectory" %>

<asp:Content ID="HeadContent1" ContentPlaceHolderID="HeadContent" runat="server">
    <link rel="stylesheet" href="~/Content/market.css" />
</asp:Content>

<asp:Content ID="MainContent1" ContentPlaceHolderID="MainContent" runat="server">
    <div class="content-container">
        <%-- Page Header (Page 14 of PDF) --%>
        <div style="margin-bottom: 24px;">
            <h1 style="font-size: 26px; font-weight: 800; color: #1b5e20; margin-bottom: 4px;">
                Trusted Shop Directory
            </h1>
            <p style="font-size: 14px; color: #5c6f5c;">
                Find reliable shop contacts
            </p>
        </div>

        <%-- Search Input Bar --%>
        <div class="dash-search-container" style="max-width: 760px; margin-bottom: 28px;">
            <div class="search-box-wrapper">
                <span class="search-icon-prefix">
                    <svg width="18" height="18" viewBox="0 0 24 24" fill="none" stroke="#8c9c8c" stroke-width="2.2" stroke-linecap="round" stroke-linejoin="round" style="display:block;">
                        <circle cx="11" cy="11" r="8"></circle>
                        <line x1="21" y1="21" x2="16.65" y2="16.65"></line>
                    </svg>
                </span>
                <asp:TextBox 
                    ID="txtShopSearch" 
                    runat="server" 
                    ClientIDMode="Static"
                    CssClass="dash-search-input" 
                    placeholder="Search shop name..." 
                    AutoPostBack="true" 
                    OnTextChanged="txtShopSearch_TextChanged" />
            </div>
        </div>

        <%-- 3x3 Responsive Grid of Shop Cards --%>
        <div class="shops-directory-grid">
            <asp:Repeater ID="rptShops" runat="server">
                <ItemTemplate>
                    <div class="shop-card">
                        <div class="shop-card-left">
                            <div class="shop-chip-icon">
                                <svg width="10" height="10" viewBox="0 0 10 10" fill="#2e7d32" style="display:block;">
                                    <polygon points="5,1 9,8 1,8" />
                                </svg>
                            </div>
                            <div class="shop-card-details">
                                <h3><%# Eval("ShopName") %></h3>
                                <p><%# Eval("ContactNumber") %></p>
                            </div>
                        </div>
                        <a href='<%# "tel:" + Eval("CleanPhone") %>' class="shop-call-btn" title='<%# "Call " + Eval("ShopName") %>'>
                            <svg width="16" height="16" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" style="display:block;">
                                <path d="M22 16.92v3a2 2 0 0 1-2.18 2 19.79 19.79 0 0 1-8.63-3.07 19.5 19.5 0 0 1-6-6 19.79 19.79 0 0 1-3.07-8.67A2 2 0 0 1 4.11 2h3a2 2 0 0 1 2 1.72 12.84 12.84 0 0 0 .7 2.81 2 2 0 0 1-.45 2.11L8.09 9.91a16 16 0 0 0 6 6l1.27-1.27a2 2 0 0 1 2.11-.45 12.84 12.84 0 0 0 2.81.7A2 2 0 0 1 22 16.92z"></path>
                            </svg>
                        </a>
                    </div>
                </ItemTemplate>
            </asp:Repeater>
        </div>
    </div>
</asp:Content>

