<%@ Page Title="Users & Broadcast Alerts" Language="C#" MasterPageFile="~/Shared/Admin.Master" AutoEventWireup="true" CodeBehind="UsersAlerts.aspx.cs" Inherits="AgriYard.Admin.UsersAlerts" %>

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
            <h3 style="font-size: 18px; font-weight: 700; color: #1a271a;">
                Registered App Users
            </h3>
            <asp:Button 
                ID="btnToggleBroadcastModal" 
                runat="server" 
                Text="Broadcast Alert" 
                CssClass="btn btn-primary" 
                OnClick="btnToggleBroadcastModal_Click" />
        </div>

        <%-- Expandable Broadcast Alert Form --%>
        <asp:Panel ID="pnlBroadcastForm" runat="server" Visible="false" Style="background-color: #f7faf7; border: 1px solid #dbe6db; border-radius: 12px; padding: 20px; margin-bottom: 24px;">
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
        <div class="table-responsive-wrapper" style="box-shadow: none; border-radius: 8px;">
            <table class="agri-table">
                <thead>
                    <tr>
                        <th style="min-width: 180px;">User Name</th>
                        <th style="min-width: 160px;">Mobile Number</th>
                        <th style="min-width: 120px;">Role</th>
                        <th style="min-width: 100px;">Status</th>
                    </tr>
                </thead>
                <tbody>
                    <asp:Repeater ID="rptRegisteredUsers" runat="server">
                        <ItemTemplate>
                            <tr>
                                <td style="font-weight: 700;"><%# Eval("FullName") %></td>
                                <td><%# Eval("MobileNumber") %></td>
                                <td><%# Eval("Role") %></td>
                                <td>
                                    <span class='<%# "user-status-badge " + (Eval("Status").ToString() == "Active" ? "active-user" : "blocked-user") %>'>
                                        <%# Eval("Status") %>
                                    </span>
                                </td>
                            </tr>
                        </ItemTemplate>
                    </asp:Repeater>
                </tbody>
            </table>
        </div>
    </div>
</asp:Content>
