<%@ Page Title="Manage Data" Language="C#" MasterPageFile="~/Shared/Admin.Master" AutoEventWireup="true" CodeBehind="ManageData.aspx.cs" Inherits="AgriYard.Admin.ManageData" %>

<asp:Content ID="AdminHead1" ContentPlaceHolderID="AdminHeadContent" runat="server">
    <link rel="stylesheet" href="~/Content/admin.css" />
    <link rel="stylesheet" href="~/Content/validation.css" />
</asp:Content>

<asp:Content ID="AdminMain1" ContentPlaceHolderID="AdminMainContent" runat="server">
    <h1 class="admin-page-title">Manage Data</h1>

    <%-- Metric Cards --%>
    <div class="admin-metrics-row">
        <div class="admin-stat-card">
            <div class="admin-stat-label">Total Users</div>
            <div class="admin-stat-number">14,520</div>
        </div>
        <div class="admin-stat-card">
            <div class="admin-stat-label">Active Yards</div>
            <div class="admin-stat-number"><asp:Literal ID="litActiveYardsCount" runat="server">24</asp:Literal></div>
        </div>
    </div>

    <%-- Main Data Management Card Container --%>
    <div class="card" style="border-radius: 16px; padding: 28px;">
        <%-- Notification Banner --%>
        <asp:Panel ID="pnlManageNotice" runat="server" Visible="false" CssClass="demo-success-banner">
            <asp:Literal ID="litManageNotice" runat="server" />
        </asp:Panel>

        <%-- Sub-Navigation Tabs: Yards, Crops, Shops (Matching Page 18) --%>
        <div class="admin-tabs-nav">
            <asp:LinkButton ID="tabYards" runat="server" CssClass="admin-tab-link active" OnClick="tabYards_Click">
                Yards
            </asp:LinkButton>
            <asp:LinkButton ID="tabCrops" runat="server" CssClass="admin-tab-link" OnClick="tabCrops_Click">
                Crops
            </asp:LinkButton>
            <asp:LinkButton ID="tabShops" runat="server" CssClass="admin-tab-link" OnClick="tabShops_Click">
                Shops
            </asp:LinkButton>
        </div>

        <%-- 1. TAB CONTENT: YARDS --%>
        <asp:Panel ID="pnlYardsTab" runat="server">
            <%-- Top Action Bar: + Add New Yard --%>
            <div class="admin-top-action-bar">
                <asp:Button 
                    ID="btnToggleAddYard" 
                    runat="server" 
                    Text="+ Add New Yard" 
                    CssClass="btn btn-primary" 
                    OnClick="btnToggleAddYard_Click" />
            </div>

            <%-- Expandable Add Yard Form with Validators --%>
            <asp:Panel ID="pnlAddYardForm" runat="server" Visible="false" Style="background-color: #f7faf7; border: 1px solid #dbe6db; border-radius: 12px; padding: 20px; margin-bottom: 24px;">
                <h4 style="font-size: 16px; font-weight: 700; color: #1b5e20; margin-bottom: 14px;">Add New APMC Yard</h4>

                <asp:ValidationSummary 
                    ID="valSummaryNewYard" 
                    runat="server" 
                    ValidationGroup="NewYardGroup" 
                    CssClass="validation-summary" 
                    HeaderText="Please fix the following:" />

                <div class="admin-fields-row">
                    <div class="form-group">
                        <asp:Label ID="lblYardName" runat="server" AssociatedControlID="txtYardName" CssClass="form-label">Yard Name</asp:Label>
                        <asp:TextBox ID="txtYardName" runat="server" CssClass="form-control" placeholder="e.g. Morbi Marketing Yard" />
                        <asp:RequiredFieldValidator 
                            ID="rfvYardName" 
                            runat="server" 
                            ControlToValidate="txtYardName" 
                            ErrorMessage="Yard name is required." 
                            CssClass="validation-error" 
                            Display="Dynamic" 
                            ValidationGroup="NewYardGroup" />
                    </div>

                    <div class="form-group">
                        <asp:Label ID="lblLocation" runat="server" AssociatedControlID="txtLocation" CssClass="form-label">Location (City, State)</asp:Label>
                        <asp:TextBox ID="txtLocation" runat="server" CssClass="form-control" placeholder="e.g. Morbi, Gujarat" />
                        <asp:RequiredFieldValidator 
                            ID="rfvLocation" 
                            runat="server" 
                            ControlToValidate="txtLocation" 
                            ErrorMessage="Location is required." 
                            CssClass="validation-error" 
                            Display="Dynamic" 
                            ValidationGroup="NewYardGroup" />
                    </div>
                </div>

                <div class="admin-fields-row">
                    <div class="form-group">
                        <asp:Label ID="lblTotalShopsInput" runat="server" AssociatedControlID="txtTotalShopsInput" CssClass="form-label">Total Shops Count</asp:Label>
                        <asp:TextBox ID="txtTotalShopsInput" runat="server" CssClass="form-control" placeholder="e.g. 120" />
                        <asp:RequiredFieldValidator 
                            ID="rfvTotalShopsInput" 
                            runat="server" 
                            ControlToValidate="txtTotalShopsInput" 
                            ErrorMessage="Total shops count is required." 
                            CssClass="validation-error" 
                            Display="Dynamic" 
                            ValidationGroup="NewYardGroup" />
                        <asp:RangeValidator 
                            ID="rvTotalShopsInput" 
                            runat="server" 
                            ControlToValidate="txtTotalShopsInput" 
                            Type="Integer" 
                            MinimumValue="1" 
                            MaximumValue="10000" 
                            ErrorMessage="Total shops count must be between 1 and 10,000." 
                            CssClass="validation-error" 
                            Display="Dynamic" 
                            ValidationGroup="NewYardGroup" />
                    </div>

                    <div class="form-group">
                        <asp:Label ID="lblEstYear" runat="server" AssociatedControlID="txtEstYear" CssClass="form-label">Established Year</asp:Label>
                        <asp:TextBox ID="txtEstYear" runat="server" CssClass="form-control" placeholder="e.g. 1990" />
                        <asp:RequiredFieldValidator 
                            ID="rfvEstYear" 
                            runat="server" 
                            ControlToValidate="txtEstYear" 
                            ErrorMessage="Established year is required." 
                            CssClass="validation-error" 
                            Display="Dynamic" 
                            ValidationGroup="NewYardGroup" />
                        <asp:RangeValidator 
                            ID="rvEstYear" 
                            runat="server" 
                            ControlToValidate="txtEstYear" 
                            Type="Integer" 
                            MinimumValue="1900" 
                            MaximumValue="2026" 
                            ErrorMessage="Established year must be between 1900 and 2026." 
                            CssClass="validation-error" 
                            Display="Dynamic" 
                            ValidationGroup="NewYardGroup" />
                    </div>
                </div>

                <div style="display: flex; gap: 12px;">
                    <asp:Button 
                        ID="btnSaveNewYard" 
                        runat="server" 
                        Text="Save Yard" 
                        CssClass="btn btn-primary" 
                        ValidationGroup="NewYardGroup" 
                        OnClick="btnSaveNewYard_Click" />

                    <asp:Button 
                        ID="btnCancelNewYard" 
                        runat="server" 
                        Text="Cancel" 
                        CssClass="btn btn-outline" 
                        OnClick="btnCancelNewYard_Click" />
                </div>
            </asp:Panel>

            <%-- List of Marketing Yards (Matching Page 18: Rajkot, Junagadh, etc.) --%>
            <asp:Repeater ID="rptYardsList" runat="server" OnItemCommand="rptYardsList_ItemCommand">
                <ItemTemplate>
                    <div class="admin-item-row-card">
                        <div class="admin-item-left">
                            <div class="admin-item-icon">🏛</div>
                            <div>
                                <h4 class="admin-item-name"><%# Eval("YardName") %></h4>
                                <p class="admin-item-meta"><%# Eval("TotalShops") %> • <%# Eval("ShortName") %></p>
                            </div>
                        </div>
                        <div class="admin-item-actions">
                            <asp:LinkButton 
                                ID="btnEditYard" 
                                runat="server" 
                                CommandName="EditYard" 
                                CommandArgument='<%# Eval("YardId") %>' 
                                CssClass="btn-icon-action edit-icon" 
                                ToolTip="Edit Yard">
                                ✏
                            </asp:LinkButton>

                            <asp:LinkButton 
                                ID="btnDeleteYard" 
                                runat="server" 
                                CommandName="DeleteYard" 
                                CommandArgument='<%# Eval("YardId") %>' 
                                CssClass="btn-icon-action delete-icon" 
                                ToolTip="Delete Yard"
                                OnClientClick="return confirm('Delete this marketing yard (Demo)?');">
                                🗑
                            </asp:LinkButton>
                        </div>
                    </div>
                </ItemTemplate>
            </asp:Repeater>
        </asp:Panel>

        <%-- 2. TAB CONTENT: CROPS --%>
        <asp:Panel ID="pnlCropsTab" runat="server" Visible="false">
            <asp:Repeater ID="rptCropsList" runat="server">
                <ItemTemplate>
                    <div class="admin-item-row-card">
                        <div class="admin-item-left">
                            <div class="admin-item-icon">🌾</div>
                            <div>
                                <h4 class="admin-item-name"><%# Eval("FullDisplayName") %></h4>
                                <p class="admin-item-meta">Category: <%# Eval("Category") %> • Unit: <%# Eval("StandardUnit") %></p>
                            </div>
                        </div>
                        <div class="admin-item-actions">
                            <span class="user-status-badge active-user">Active</span>
                        </div>
                    </div>
                </ItemTemplate>
            </asp:Repeater>
        </asp:Panel>

        <%-- 3. TAB CONTENT: SHOPS --%>
        <asp:Panel ID="pnlShopsTab" runat="server" Visible="false">
            <asp:Repeater ID="rptAdminShopsList" runat="server">
                <ItemTemplate>
                    <div class="admin-item-row-card">
                        <div class="admin-item-left">
                            <div class="admin-item-icon">🏪</div>
                            <div>
                                <h4 class="admin-item-name"><%# Eval("ShopName") %></h4>
                                <p class="admin-item-meta"><%# Eval("AssociatedYard") %> • Phone: <%# Eval("ContactNumber") %></p>
                            </div>
                        </div>
                        <div class="admin-item-actions">
                            <span class="user-status-badge active-user">Active</span>
                        </div>
                    </div>
                </ItemTemplate>
            </asp:Repeater>
        </asp:Panel>
    </div>
</asp:Content>
