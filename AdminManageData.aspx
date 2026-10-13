<%@ Page Title="Manage Data" Language="C#" MasterPageFile="~/Admin.Master" AutoEventWireup="true" CodeBehind="AdminManageData.aspx.cs" Inherits="AgriYard.AdminManageData" %>

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

                <asp:HiddenField ID="hfEditYardId" runat="server" />
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
                            <div class="admin-item-icon">
                                <svg width="22" height="22" viewBox="0 0 24 24" fill="none" stroke="#2e7d32" stroke-width="2" stroke-linecap="round" stroke-linejoin="round">
                                    <path d="M3 21h18"></path><path d="M5 21V10"></path><path d="M9 21V10"></path><path d="M15 21V10"></path><path d="M19 21V10"></path><path d="M2 10l10-7 10 7"></path>
                                </svg>
                            </div>
                            <div>
                                <h4 class="admin-item-name"><%# Eval("YardName") %></h4>
                                <p class="admin-item-meta"><%# Eval("TotalShops") %> &bull; <%# Eval("ShortName") %></p>
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
                                <svg width="15" height="15" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"><path d="M11 4H4a2 2 0 0 0-2 2v14a2 2 0 0 0 2 2h14a2 2 0 0 0 2-2v-7"></path><path d="M18.5 2.5a2.121 2.121 0 0 1 3 3L12 15l-4 1 1-4 9.5-9.5z"></path></svg>
                            </asp:LinkButton>

                            <asp:LinkButton 
                                ID="btnDeleteYard" 
                                runat="server" 
                                CommandName="DeleteYard" 
                                CommandArgument='<%# Eval("YardId") %>' 
                                CssClass="btn-icon-action delete-icon" 
                                ToolTip="Delete Yard"
                                OnClientClick="return confirm('Delete this marketing yard from demo?');">
                                <svg width="15" height="15" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"><polyline points="3 6 5 6 21 6"></polyline><path d="M19 6v14a2 2 0 0 1-2 2H7a2 2 0 0 1-2-2V6m3 0V4a2 2 0 0 1 2-2h4a2 2 0 0 1 2 2v2"></path></svg>
                            </asp:LinkButton>
                        </div>
                    </div>
                </ItemTemplate>
            </asp:Repeater>
        </asp:Panel>

        <%-- 2. TAB CONTENT: CROPS --%>
        <asp:Panel ID="pnlCropsTab" runat="server" Visible="false">
            <div class="admin-top-action-bar">
                <asp:Button 
                    ID="btnToggleAddCrop" 
                    runat="server" 
                    Text="+ Add New Crop" 
                    CssClass="btn btn-primary" 
                    OnClick="btnToggleAddCrop_Click" />
            </div>

            <%-- Expandable Add Crop Form --%>
            <asp:Panel ID="pnlAddCropForm" runat="server" Visible="false" Style="background-color: #f7faf7; border: 1px solid #dbe6db; border-radius: 12px; padding: 20px; margin-bottom: 24px;">
                <h4 style="font-size: 16px; font-weight: 700; color: #1b5e20; margin-bottom: 14px;">Add New Agricultural Crop</h4>
                <div class="admin-fields-row">
                    <div class="form-group">
                        <label class="form-label">Crop English Name</label>
                        <asp:TextBox ID="txtNewCropName" runat="server" CssClass="form-control" placeholder="e.g. Cumin" />
                    </div>
                    <div class="form-group">
                        <label class="form-label">Gujarati Name</label>
                        <asp:TextBox ID="txtNewCropGuj" runat="server" CssClass="form-control" placeholder="e.g. Jeeru" />
                    </div>
                    <div class="form-group">
                        <label class="form-label">Category</label>
                        <asp:DropDownList ID="ddlNewCropCategory" runat="server" CssClass="form-control">
                            <asp:ListItem Value="Spices">Spices</asp:ListItem>
                            <asp:ListItem Value="Grains">Grains</asp:ListItem>
                            <asp:ListItem Value="Pulses">Pulses</asp:ListItem>
                            <asp:ListItem Value="Oilseeds">Oilseeds</asp:ListItem>
                            <asp:ListItem Value="Cash Crop">Cash Crop</asp:ListItem>
                        </asp:DropDownList>
                    </div>
                </div>
                <div style="display: flex; gap: 12px; margin-top: 12px;">
                    <asp:Button ID="btnSaveNewCrop" runat="server" Text="Save Crop" CssClass="btn btn-primary" OnClick="btnSaveNewCrop_Click" />
                    <asp:Button ID="btnCancelNewCrop" runat="server" Text="Cancel" CssClass="btn btn-outline" OnClick="btnCancelNewCrop_Click" />
                </div>
            </asp:Panel>

            <asp:Repeater ID="rptCropsList" runat="server" OnItemCommand="rptCropsList_ItemCommand">
                <ItemTemplate>
                    <div class="admin-item-row-card">
                        <div class="admin-item-left">
                            <div class="admin-item-icon">
                                <svg width="22" height="22" viewBox="0 0 24 24" fill="none" stroke="#2e7d32" stroke-width="2" stroke-linecap="round" stroke-linejoin="round">
                                    <path d="M2 22s5.5-1.5 8.5-5.5C13.5 12.5 15 7 15 7s-5.5 1.5-9.5 5.5C1.5 16.5 2 22 2 22z" fill="#e8f5e9"></path>
                                    <path d="M12 12l8-8"></path>
                                    <path d="M17 4l3 3"></path>
                                </svg>
                            </div>
                            <div>
                                <h4 class="admin-item-name"><%# Eval("FullDisplayName") %></h4>
                                <p class="admin-item-meta">Category: <%# Eval("Category") %> &bull; Unit: <%# Eval("StandardUnit") %></p>
                            </div>
                        </div>
                        <div class="admin-item-actions">
                            <asp:LinkButton 
                                ID="btnToggleCrop" 
                                runat="server" 
                                CommandName="ToggleCrop" 
                                CommandArgument='<%# Eval("CropId") %>' 
                                CssClass='<%# Eval("Status").ToString() == "Active" ? "user-status-badge active-user" : "user-status-badge blocked-user" %>'>
                                <%# Eval("Status") %>
                            </asp:LinkButton>
                        </div>
                    </div>
                </ItemTemplate>
            </asp:Repeater>
        </asp:Panel>

        <%-- 3. TAB CONTENT: SHOPS --%>
        <asp:Panel ID="pnlShopsTab" runat="server" Visible="false">
            <div class="admin-top-action-bar">
                <asp:Button 
                    ID="btnToggleAddShop" 
                    runat="server" 
                    Text="+ Add New Shop" 
                    CssClass="btn btn-primary" 
                    OnClick="btnToggleAddShop_Click" />
            </div>

            <%-- Expandable Add Shop Form --%>
            <asp:Panel ID="pnlAddShopForm" runat="server" Visible="false" Style="background-color: #f7faf7; border: 1px solid #dbe6db; border-radius: 12px; padding: 20px; margin-bottom: 24px;">
                <h4 style="font-size: 16px; font-weight: 700; color: #1b5e20; margin-bottom: 14px;">Add New Commission Shop</h4>
                <div class="admin-fields-row">
                    <div class="form-group">
                        <label class="form-label">Shop Name</label>
                        <asp:TextBox ID="txtNewShopName" runat="server" CssClass="form-control" placeholder="e.g. Kisan Traders" />
                    </div>
                    <div class="form-group">
                        <label class="form-label">Contact Number</label>
                        <asp:TextBox ID="txtNewShopPhone" runat="server" CssClass="form-control" placeholder="+91 98765 00000" />
                    </div>
                    <div class="form-group">
                        <label class="form-label">Associated Yard</label>
                        <asp:DropDownList ID="ddlNewShopYard" runat="server" CssClass="form-control">
                            <asp:ListItem Value="Rajkot Marketing Yard">Rajkot Marketing Yard</asp:ListItem>
                            <asp:ListItem Value="Junagadh Marketing Yard">Junagadh Marketing Yard</asp:ListItem>
                            <asp:ListItem Value="Gondal Marketing Yard">Gondal Marketing Yard</asp:ListItem>
                            <asp:ListItem Value="Mendarda Marketing Yard">Mendarda Marketing Yard</asp:ListItem>
                        </asp:DropDownList>
                    </div>
                </div>
                <div style="display: flex; gap: 12px; margin-top: 12px;">
                    <asp:Button ID="btnSaveNewShop" runat="server" Text="Save Shop" CssClass="btn btn-primary" OnClick="btnSaveNewShop_Click" />
                    <asp:Button ID="btnCancelNewShop" runat="server" Text="Cancel" CssClass="btn btn-outline" OnClick="btnCancelNewShop_Click" />
                </div>
            </asp:Panel>

            <asp:Repeater ID="rptAdminShopsList" runat="server" OnItemCommand="rptAdminShopsList_ItemCommand">
                <ItemTemplate>
                    <div class="admin-item-row-card">
                        <div class="admin-item-left">
                            <div class="admin-item-icon">
                                <svg width="22" height="22" viewBox="0 0 24 24" fill="none" stroke="#2e7d32" stroke-width="2" stroke-linecap="round" stroke-linejoin="round">
                                    <path d="M3 9l9-7 9 7v11a2 2 0 0 1-2 2H5a2 2 0 0 1-2-2z"></path>
                                    <polyline points="9 22 9 12 15 12 15 22"></polyline>
                                </svg>
                            </div>
                            <div>
                                <h4 class="admin-item-name"><%# Eval("ShopName") %></h4>
                                <p class="admin-item-meta"><%# Eval("AssociatedYard") %> &bull; Phone: <%# Eval("ContactNumber") %></p>
                            </div>
                        </div>
                        <div class="admin-item-actions">
                            <asp:LinkButton 
                                ID="btnToggleShop" 
                                runat="server" 
                                CommandName="ToggleShop" 
                                CommandArgument='<%# Eval("ShopId") %>' 
                                CssClass='<%# Eval("Status").ToString() == "Active" ? "user-status-badge active-user" : "user-status-badge blocked-user" %>'>
                                <%# Eval("Status") %>
                            </asp:LinkButton>

                            <asp:LinkButton 
                                ID="btnDeleteShop" 
                                runat="server" 
                                CommandName="DeleteShop" 
                                CommandArgument='<%# Eval("ShopId") %>' 
                                CssClass="btn-icon-action delete-icon" 
                                ToolTip="Delete Shop"
                                OnClientClick="return confirm('Delete this shop from directory?');">
                                <svg width="15" height="15" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"><polyline points="3 6 5 6 21 6"></polyline><path d="M19 6v14a2 2 0 0 1-2 2H7a2 2 0 0 1-2-2V6m3 0V4a2 2 0 0 1 2-2h4a2 2 0 0 1 2 2v2"></path></svg>
                            </asp:LinkButton>
                        </div>
                    </div>
                </ItemTemplate>
            </asp:Repeater>
        </asp:Panel>
    </div>
</asp:Content>

