<%@ Page Title="Trusted Shop Directory" Language="C#" MasterPageFile="~/Shared/Main.Master" AutoEventWireup="true" CodeBehind="ShopDirectory.aspx.cs" Inherits="AgriYard.Shops.ShopDirectory" %>

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
        <div class="dash-search-container" style="max-width: 600px; margin-bottom: 28px;">
            <div class="search-box-wrapper">
                <span class="search-icon-prefix">🔍</span>
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
                                ▲
                            </div>
                            <div class="shop-card-details">
                                <h3><%# Eval("ShopName") %></h3>
                                <p><%# Eval("ContactNumber") %></p>
                            </div>
                        </div>
                        <a href='<%# "tel:" + Eval("CleanPhone") %>' class="shop-call-btn" title='<%# "Call " + Eval("ShopName") %>'>
                            📞
                        </a>
                    </div>
                </ItemTemplate>
            </asp:Repeater>
        </div>
    </div>
</asp:Content>
