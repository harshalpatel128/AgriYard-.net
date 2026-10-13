<%@ Page Title="Users & Broadcast Alerts" Language="C#" MasterPageFile="~/Admin.Master" AutoEventWireup="true" CodeBehind="AdminUsersAlerts.aspx.cs" Inherits="AgriYard.AdminUsersAlerts" %>

<asp:Content ID="AdminHead1" ContentPlaceHolderID="AdminHeadContent" runat="server">
    <link rel="stylesheet" href="~/Content/admin.css" />
    <link rel="stylesheet" href="~/Content/validation.css" />
</asp:Content>

<asp:Content ID="AdminMain1" ContentPlaceHolderID="AdminMainContent" runat="server">
    <%-- Page Heading (Matching Page 19 of Figma PDF) --%>
    <h1 class="admin-page-title">Users &amp; Broadcast Alerts</h1>

    <%-- Broadcast Alert Feedback Banner --%>
    <asp:Panel ID="pnlAlertNotice" runat="server" Visible="false" CssClass="demo-success-banner">
        <asp:Literal ID="litAlertNotice" runat="server" />
    </asp:Panel>

    <%-- Main Card Container --%>
    <div class="card" style="border-radius: 16px; padding: 28px;">
        <%-- Top Header: Registered Users Title & Broadcast Alert Button --%>
        <div class="admin-users-header-row">
            <div>
                <h3 style="font-size: 18px; font-weight: 700; color: #1a271a; margin-bottom: 4px;">
                    Registered App Users
                </h3>
                <p style="font-size: 13px; color: #6b7280; margin: 0;">Click on status badge to toggle user access (Active / Blocked).</p>
            </div>
            <asp:Button 
                ID="btnToggleBroadcastModal" 
                runat="server" 
                Text="Broadcast Alert" 
                CssClass="btn btn-primary" 
                OnClick="btnToggleBroadcastModal_Click" />
        </div>

        <%-- Expandable Broadcast Alert Form --%>
        <asp:Panel ID="pnlBroadcastForm" runat="server" Visible="false" Style="background-color: #f7faf7; border: 1px solid #dbe6db; border-radius: 12px; padding: 20px; margin-bottom: 24px; margin-top: 16px;">
            <h4 style="font-size: 16px; font-weight: 700; color: #1b5e20; margin-bottom: 14px;">Create Broadcast Announcement</h4>

            <asp:ValidationSummary 
                ID="valSummaryAlert" 
                runat="server" 
                ValidationGroup="AlertGroup" 
                CssClass="validation-summary" 
                HeaderText="Please fix the following:" />

            <div class="admin-fields-row">
                <div class="form-group">
                    <asp:Label ID="lblAlertTitle" runat="server" AssociatedControlID="txtAlertTitle" CssClass="form-label">
                        Alert Title
                    </asp:Label>
                    <asp:TextBox ID="txtAlertTitle" runat="server" CssClass="form-control" placeholder="e.g. Groundnut Auction Schedule Update" />
                    <asp:RequiredFieldValidator 
                        ID="rfvAlertTitle" 
                        runat="server" 
                        ControlToValidate="txtAlertTitle" 
                        ErrorMessage="Alert title is required." 
                        CssClass="validation-error" 
                        Display="Dynamic" 
                        ValidationGroup="AlertGroup" />
                </div>

                <div class="form-group">
                    <asp:Label ID="lblTargetAudience" runat="server" AssociatedControlID="ddlTargetAudience" CssClass="form-label">
                        Target Audience
                    </asp:Label>
                    <asp:DropDownList ID="ddlTargetAudience" runat="server" CssClass="form-control">
                        <asp:ListItem Value="All" Selected="True">All Farmers &amp; Traders</asp:ListItem>
                        <asp:ListItem Value="Farmers">Farmers Only</asp:ListItem>
                        <asp:ListItem Value="Traders">Traders Only</asp:ListItem>
                        <asp:ListItem Value="ShopOwners">Shop Owners Only</asp:ListItem>
                    </asp:DropDownList>
                </div>
            </div>

            <div class="form-group">
                <asp:Label ID="lblAlertMsg" runat="server" AssociatedControlID="txtAlertMsg" CssClass="form-label">
                    Message Body
                </asp:Label>
                <asp:TextBox ID="txtAlertMsg" runat="server" CssClass="form-control" TextMode="MultiLine" Rows="3" placeholder="Enter broadcast message text..." />
                <asp:RequiredFieldValidator 
                    ID="rfvAlertMsg" 
                    runat="server" 
                    ControlToValidate="txtAlertMsg" 
                    ErrorMessage="Message body is required." 
                    CssClass="validation-error" 
                    Display="Dynamic" 
                    ValidationGroup="AlertGroup" />
            </div>

            <div style="display: flex; gap: 12px;">
                <asp:Button 
                    ID="btnSendBroadcast" 
                    runat="server" 
                    Text="Send Broadcast" 
                    CssClass="btn btn-primary" 
                    ValidationGroup="AlertGroup" 
                    OnClick="btnSendBroadcast_Click" />

                <asp:Button 
                    ID="btnCancelBroadcast" 
                    runat="server" 
                    Text="Cancel" 
                    CssClass="btn btn-outline" 
                    OnClick="btnCancelBroadcast_Click" />
            </div>
        </asp:Panel>

        <%-- Registered App Users Table (Matching Page 19 Table) --%>
        <div class="table-responsive-wrapper" style="box-shadow: none; border-radius: 8px; margin-top: 16px;">
            <table class="agri-table">
                <thead>
                    <tr>
                        <th style="min-width: 180px;">User Name</th>
                        <th style="min-width: 160px;">Mobile Number</th>
                        <th style="min-width: 120px;">Role</th>
                        <th style="min-width: 120px;">Status</th>
                    </tr>
                </thead>
                <tbody>
                    <asp:Repeater ID="rptRegisteredUsers" runat="server" OnItemCommand="rptRegisteredUsers_ItemCommand">
                        <ItemTemplate>
                            <tr>
                                <td style="font-weight: 700;"><%# Eval("FullName") %></td>
                                <td><%# Eval("MobileNumber") %></td>
                                <td><%# Eval("Role") %></td>
                                <td>
                                    <asp:LinkButton 
                                        ID="btnToggleUserStatus" 
                                        runat="server" 
                                        CommandName="ToggleStatus" 
                                        CommandArgument='<%# Eval("UserId") %>'
                                        CssClass='<%# "user-status-badge " + (Eval("Status").ToString() == "Active" ? "active-user" : "blocked-user") %>'
                                        ToolTip="Click to toggle Active / Blocked"
                                        Style="text-decoration: none; cursor: pointer;">
                                        <%# Eval("Status") %>
                                    </asp:LinkButton>
                                </td>
                            </tr>
                        </ItemTemplate>
                    </asp:Repeater>
                </tbody>
            </table>
        </div>

        <%-- Active Broadcast Announcements Section --%>
        <div style="margin-top: 36px; padding-top: 24px; border-top: 1px solid #f0f4f0;">
            <div style="display: flex; justify-content: space-between; align-items: center; margin-bottom: 16px;">
                <h3 style="font-size: 18px; font-weight: 700; color: #1a271a; margin: 0;">
                    Live Broadcast Announcements (<asp:Literal ID="litAlertsCount" runat="server">0</asp:Literal>)
                </h3>
                <span style="font-size: 12px; color: #2e7d32; font-weight: 600;">Displayed to farmers on Home Dashboard</span>
            </div>

            <asp:Repeater ID="rptActiveAlerts" runat="server" OnItemCommand="rptActiveAlerts_ItemCommand">
                <ItemTemplate>
                    <div class="admin-item-row-card">
                        <div class="admin-item-left">
                            <div class="admin-item-icon">
                                <svg width="22" height="22" viewBox="0 0 24 24" fill="none" stroke="#2e7d32" stroke-width="2" stroke-linecap="round" stroke-linejoin="round">
                                    <path d="M18 8A6 6 0 0 0 6 8c0 7-3 9-3 9h18s-3-2-3-9"></path>
                                    <path d="M13.73 21a2 2 0 0 1-3.46 0"></path>
                                </svg>
                            </div>
                            <div>
                                <h4 class="admin-item-name"><%# Eval("Title") %> <span style="font-size: 12px; font-weight: normal; color: #6b7280;">&bull; Target: <%# Eval("TargetAudience") %></span></h4>
                                <p class="admin-item-meta"><%# Eval("Message") %> &bull; <%# Eval("DatePosted") %></p>
                            </div>
                        </div>
                        <div class="admin-item-actions">
                            <asp:LinkButton 
                                ID="btnDeleteAlert" 
                                runat="server" 
                                CommandName="DeleteAlert" 
                                CommandArgument='<%# Eval("AlertId") %>' 
                                CssClass="btn-icon-action delete-icon" 
                                ToolTip="Delete Alert"
                                OnClientClick="return confirm('Remove this broadcast announcement?');">
                                <svg width="15" height="15" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"><polyline points="3 6 5 6 21 6"></polyline><path d="M19 6v14a2 2 0 0 1-2 2H7a2 2 0 0 1-2-2V6m3 0V4a2 2 0 0 1 2-2h4a2 2 0 0 1 2 2v2"></path></svg>
                            </asp:LinkButton>
                        </div>
                    </div>
                </ItemTemplate>
            </asp:Repeater>
        </div>
    </div>
</asp:Content>

