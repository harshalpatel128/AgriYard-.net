<%@ Page Title="Advanced Filter & Sort" Language="C#" MasterPageFile="~/Shared/Main.Master" AutoEventWireup="true" CodeBehind="FilterSort.aspx.cs" Inherits="AgriYard.Market.FilterSort" %>

<asp:Content ID="HeadContent1" ContentPlaceHolderID="HeadContent" runat="server">
    <link rel="stylesheet" href="~/Content/market.css" />
</asp:Content>

<asp:Content ID="MainContent1" ContentPlaceHolderID="MainContent" runat="server">
    <div class="content-container" style="max-width: 860px;">
        <%-- Page Heading (Matching Page 6 of Figma PDF) --%>
        <div style="margin-bottom: 24px;">
            <h1 style="font-size: 24px; font-weight: 800; color: #1b5e20; margin-bottom: 4px;">
                Advanced Filter &amp; Sort
            </h1>
            <p style="font-size: 14px; color: #5c6f5c;">
                Customize your market data view
            </p>
        </div>

        <%-- Two Column Filter Card --%>
        <div class="filter-card">
            <div class="filter-grid-two-col">
                <%-- Column 1: Sort Options --%>
                <div>
                    <h3 class="filter-col-title">Sort By</h3>
                    <div class="filter-option-list">
                        <label class="filter-label-row">
                            <asp:RadioButton ID="rbHighToLow" runat="server" GroupName="SortOption" Checked="true" />
                            <span>Price: High to Low</span>
                        </label>
                        <label class="filter-label-row">
                            <asp:RadioButton ID="rbLowToHigh" runat="server" GroupName="SortOption" />
                            <span>Price: Low to High</span>
                        </label>
                        <label class="filter-label-row">
                            <asp:RadioButton ID="rbLatestUpdated" runat="server" GroupName="SortOption" />
                            <span>Latest Updated First</span>
                        </label>
                    </div>
                </div>

                <%-- Column 2: Filter by Market Yard --%>
                <div>
                    <h3 class="filter-col-title">Filter by Market Yard</h3>
                    <div class="filter-option-list">
                        <label class="filter-label-row">
                            <asp:CheckBox ID="chkRajkot" runat="server" Checked="true" />
                            <span>Rajkot Marketing Yard</span>
                        </label>
                        <label class="filter-label-row">
                            <asp:CheckBox ID="chkJunagadh" runat="server" Checked="true" />
                            <span>Junagadh Marketing Yard</span>
                        </label>
                        <label class="filter-label-row">
                            <asp:CheckBox ID="chkGondal" runat="server" />
                            <span>Gondal Marketing Yard</span>
                        </label>
                        <label class="filter-label-row">
                            <asp:CheckBox ID="chkMendarda" runat="server" />
                            <span>Mendarda Marketing Yard</span>
                        </label>
                    </div>
                </div>
            </div>

            <%-- Action Buttons: Clear All & Apply Filters --%>
            <div class="filter-actions-row">
                <asp:Button 
                    ID="btnClearAll" 
                    runat="server" 
                    Text="Clear All" 
                    CssClass="btn-clear-filters" 
                    OnClick="btnClearAll_Click" />

                <asp:Button 
                    ID="btnApplyFilters" 
                    runat="server" 
                    Text="Apply Filters" 
                    CssClass="btn btn-primary" 
                    OnClick="btnApplyFilters_Click" />
            </div>
        </div>
    </div>
</asp:Content>
