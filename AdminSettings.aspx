<%@ Page Title="Admin Settings" Language="C#" MasterPageFile="~/Admin.Master" AutoEventWireup="true" CodeBehind="AdminSettings.aspx.cs" Inherits="AgriYard.AdminSettings" %>

<asp:Content ID="AdminHead1" ContentPlaceHolderID="AdminHeadContent" runat="server">
    <link rel="stylesheet" href="~/Content/admin.css" />
    <link rel="stylesheet" href="~/Content/validation.css" />
</asp:Content>

<asp:Content ID="AdminMain1" ContentPlaceHolderID="AdminMainContent" runat="server">
    <%-- Page Heading (Matching Page 20 of Figma PDF) --%>
    <h1 class="admin-page-title">Settings</h1>

    <%-- Feedback Banner --%>
    <asp:Panel ID="pnlSettingsNotice" runat="server" Visible="false" CssClass="demo-success-banner">
        <asp:Literal ID="litSettingsNotice" runat="server" />
    </asp:Panel>

    <%-- Settings Card Container --%>
    <div class="admin-settings-card">
        <div class="admin-settings-list">
            <%-- Row 1: Change Admin Password --%>
            <asp:LinkButton ID="btnOpenPasswordModal" runat="server" CssClass="admin-settings-row" OnClick="btnOpenPasswordModal_Click">
                <span>Change Admin Password</span>
                <span>
                    <svg width="16" height="16" viewBox="0 0 24 24" fill="none" stroke="#90a4ae" stroke-width="2.5" stroke-linecap="round" stroke-linejoin="round"><polyline points="9 18 15 12 9 6"></polyline></svg>
                </span>
            </asp:LinkButton>

            <%-- Inline Expandable Password Form --%>
            <asp:Panel ID="pnlAdminPasswordForm" runat="server" Visible="false" Style="padding: 16px; background-color: #f7faf7; border-radius: 8px; margin: 10px 0;">
                <h4 style="font-size: 15px; font-weight: 700; color: #1b5e20; margin-bottom: 12px;">Update Admin Password</h4>
                <asp:ValidationSummary ID="valSummaryAdminPass" runat="server" ValidationGroup="AdminPassGroup" CssClass="validation-summary" />
                
                <div class="form-group">
                    <asp:Label ID="lblAdminNewPass" runat="server" CssClass="form-label">New Admin Password</asp:Label>
                    <asp:TextBox ID="txtAdminNewPass" runat="server" CssClass="form-control" TextMode="Password" />
                    <asp:RequiredFieldValidator ID="rfvAdminNewPass" runat="server" ControlToValidate="txtAdminNewPass" ErrorMessage="New password is required." CssClass="validation-error" ValidationGroup="AdminPassGroup" />
                </div>
                <div class="form-group">
                    <asp:Label ID="lblAdminConfirmPass" runat="server" CssClass="form-label">Confirm Admin Password</asp:Label>
                    <asp:TextBox ID="txtAdminConfirmPass" runat="server" CssClass="form-control" TextMode="Password" />
                    <asp:RequiredFieldValidator ID="rfvAdminConfirmPass" runat="server" ControlToValidate="txtAdminConfirmPass" ErrorMessage="Confirm password is required." CssClass="validation-error" ValidationGroup="AdminPassGroup" />
                    <asp:CompareValidator ID="cvAdminPass" runat="server" ControlToValidate="txtAdminConfirmPass" ControlToCompare="txtAdminNewPass" Operator="Equal" ErrorMessage="Passwords do not match." CssClass="validation-error" ValidationGroup="AdminPassGroup" />
                </div>
                <div style="display: flex; gap: 10px;">
                    <asp:Button ID="btnSaveAdminPass" runat="server" Text="Update Password" CssClass="btn btn-primary" ValidationGroup="AdminPassGroup" OnClick="btnSaveAdminPass_Click" />
                    <asp:Button ID="btnCancelAdminPass" runat="server" Text="Cancel" CssClass="btn btn-outline" OnClick="btnCancelAdminPass_Click" />
                </div>
            </asp:Panel>

            <%-- Row 2: Update Helpline Number --%>
            <asp:LinkButton ID="btnOpenHelplineModal" runat="server" CssClass="admin-settings-row" OnClick="btnOpenHelplineModal_Click">
                <span>Update Helpline Number</span>
                <span>
                    <svg width="16" height="16" viewBox="0 0 24 24" fill="none" stroke="#90a4ae" stroke-width="2.5" stroke-linecap="round" stroke-linejoin="round"><polyline points="9 18 15 12 9 6"></polyline></svg>
                </span>
            </asp:LinkButton>

            <%-- Inline Expandable Helpline Form --%>
            <asp:Panel ID="pnlHelplineForm" runat="server" Visible="false" Style="padding: 16px; background-color: #f7faf7; border-radius: 8px; margin: 10px 0;">
                <h4 style="font-size: 15px; font-weight: 700; color: #1b5e20; margin-bottom: 12px;">Update Support Helpline</h4>
                <div class="form-group">
                    <asp:Label ID="lblHelplinePhone" runat="server" CssClass="form-label">Helpline Phone Number</asp:Label>
                    <asp:TextBox ID="txtHelplinePhone" runat="server" CssClass="form-control" Text="+91 9624042246" />
                    <asp:RequiredFieldValidator ID="rfvHelpline" runat="server" ControlToValidate="txtHelplinePhone" ErrorMessage="Phone number is required." CssClass="validation-error" ValidationGroup="HelplineGroup" />
                </div>
                <div style="display: flex; gap: 10px;">
                    <asp:Button ID="btnSaveHelpline" runat="server" Text="Save Helpline" CssClass="btn btn-primary" ValidationGroup="HelplineGroup" OnClick="btnSaveHelpline_Click" />
                    <asp:Button ID="btnCancelHelpline" runat="server" Text="Cancel" CssClass="btn btn-outline" OnClick="btnCancelHelpline_Click" />
                </div>
            </asp:Panel>

            <%-- Row 3: Edit Privacy & Terms --%>
            <a href="<%= ResolveUrl("~/HelpSupport.aspx") %>" class="admin-settings-row">
                <span>Edit Privacy &amp; Terms</span>
                <span>
                    <svg width="16" height="16" viewBox="0 0 24 24" fill="none" stroke="#90a4ae" stroke-width="2.5" stroke-linecap="round" stroke-linejoin="round"><polyline points="9 18 15 12 9 6"></polyline></svg>
                </span>
            </a>

            <%-- Row 4: Force App Update / Version --%>
            <div class="admin-settings-row">
                <span>Force App Update / Version</span>
                <div style="display: flex; align-items: center; gap: 8px;">
                    <span class="admin-version-tag">v1.0.0</span>
                    <svg width="16" height="16" viewBox="0 0 24 24" fill="none" stroke="#90a4ae" stroke-width="2.5" stroke-linecap="round" stroke-linejoin="round"><polyline points="9 18 15 12 9 6"></polyline></svg>
                </div>
            </div>
        </div>
    </div>

    <%-- Logout from Admin (Red Outline Button) --%>
    <asp:LinkButton 
        ID="btnLogoutAdmin" 
        runat="server" 
        CssClass="btn btn-danger-outline btn-block" 
        Style="padding: 14px;" 
        OnClick="btnLogoutAdmin_Click">
        Logout from Admin
    </asp:LinkButton>
</asp:Content>

