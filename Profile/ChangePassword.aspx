<%@ Page Title="Change Password" Language="C#" MasterPageFile="~/Shared/Main.Master" AutoEventWireup="true" CodeBehind="ChangePassword.aspx.cs" Inherits="AgriYard.Profile.ChangePassword" %>

<asp:Content ID="HeadContent1" ContentPlaceHolderID="HeadContent" runat="server">
    <link rel="stylesheet" href="~/Content/auth.css" />
    <link rel="stylesheet" href="~/Content/validation.css" />
</asp:Content>

<asp:Content ID="MainContent1" ContentPlaceHolderID="MainContent" runat="server">
    <div class="content-container" style="max-width: 580px;">
        <%-- Back Link to Profile (Page 16 of PDF) --%>
        <a href="<%= ResolveUrl("~/Profile/Profile.aspx") %>" class="back-nav-link">
            &lt; Back to Profile
        </a>

        <%-- Centered Change Password Card --%>
        <div class="auth-card" style="max-width: 100%; margin: 0 auto;">
            <h1 class="auth-title">Change Password</h1>
            <p class="auth-description">
                Your new password must be different from previous used passwords.
            </p>

            <%-- Demo Success Notice --%>
            <asp:Panel ID="pnlChangeSuccess" runat="server" Visible="false" CssClass="demo-success-banner">
                <asp:Literal ID="litChangeSuccess" runat="server" />
            </asp:Panel>

            <%-- ValidationSummary Control --%>
            <asp:ValidationSummary 
                ID="valSummaryChangePassword" 
                runat="server" 
                ValidationGroup="ChangePasswordGroup"
                CssClass="validation-summary" 
                HeaderText="Please correct the following errors:" 
                DisplayMode="BulletList" />

            <%-- 1. Current Password Field --%>
            <div class="form-group">
                <asp:Label ID="lblCurrentPassword" runat="server" AssociatedControlID="txtCurrentPassword" CssClass="form-label">
                    Current Password
                </asp:Label>
                <asp:TextBox 
                    ID="txtCurrentPassword" 
                    runat="server" 
                    CssClass="form-control" 
                    placeholder="Enter current password" 
                    TextMode="Password" />

                <asp:RequiredFieldValidator 
                    ID="rfvCurrentPassword" 
                    runat="server" 
                    ControlToValidate="txtCurrentPassword" 
                    ErrorMessage="Current Password is required." 
                    CssClass="validation-error" 
                    Display="Dynamic" 
                    ValidationGroup="ChangePasswordGroup" />
            </div>

            <%-- 2. New Password Field --%>
            <div class="form-group">
                <asp:Label ID="lblNewPassword" runat="server" AssociatedControlID="txtNewPassword" CssClass="form-label">
                    New Password
                </asp:Label>
                <asp:TextBox 
                    ID="txtNewPassword" 
                    runat="server" 
                    CssClass="form-control" 
                    placeholder="Enter new password" 
                    TextMode="Password" />

                <asp:RequiredFieldValidator 
                    ID="rfvNewPassword" 
                    runat="server" 
                    ControlToValidate="txtNewPassword" 
                    ErrorMessage="New Password is required." 
                    CssClass="validation-error" 
                    Display="Dynamic" 
                    ValidationGroup="ChangePasswordGroup" />

                <%-- RegularExpressionValidator: Minimum 6 characters --%>
                <asp:RegularExpressionValidator 
                    ID="revNewPassword" 
                    runat="server" 
                    ControlToValidate="txtNewPassword" 
                    ValidationExpression="^.{6,25}$" 
                    ErrorMessage="New password must be at least 6 characters long." 
                    CssClass="validation-error" 
                    Display="Dynamic" 
                    ValidationGroup="ChangePasswordGroup" />

                <%-- 
                    VALIDATOR 5 OF 6: CustomValidator
                    Server-side validation verifying New Password is NOT identical to Current Password
                --%>
                <asp:CustomValidator 
                    ID="cvDifferentPassword" 
                    runat="server" 
                    ControlToValidate="txtNewPassword" 
                    OnServerValidate="cvDifferentPassword_ServerValidate" 
                    ErrorMessage="New password cannot be identical to the current password." 
                    CssClass="validation-error" 
                    Display="Dynamic" 
                    ValidationGroup="ChangePasswordGroup" />
            </div>

            <%-- 3. Confirm New Password Field --%>
            <div class="form-group">
                <asp:Label ID="lblConfirmNewPassword" runat="server" AssociatedControlID="txtConfirmNewPassword" CssClass="form-label">
                    Confirm New Password
                </asp:Label>
                <asp:TextBox 
                    ID="txtConfirmNewPassword" 
                    runat="server" 
                    CssClass="form-control" 
                    placeholder="Confirm new password" 
                    TextMode="Password" />

                <asp:RequiredFieldValidator 
                    ID="rfvConfirmNewPassword" 
                    runat="server" 
                    ControlToValidate="txtConfirmNewPassword" 
                    ErrorMessage="Confirm New Password is required." 
                    CssClass="validation-error" 
                    Display="Dynamic" 
                    ValidationGroup="ChangePasswordGroup" />

                <%-- CompareValidator: Ensures confirm matches new password --%>
                <asp:CompareValidator 
                    ID="cvConfirmNewPassword" 
                    runat="server" 
                    ControlToValidate="txtConfirmNewPassword" 
                    ControlToCompare="txtNewPassword" 
                    Operator="Equal" 
                    Type="String" 
                    ErrorMessage="Passwords do not match." 
                    CssClass="validation-error" 
                    Display="Dynamic" 
                    ValidationGroup="ChangePasswordGroup" />
            </div>

            <%-- Save Changes Button --%>
            <asp:Button 
                ID="btnSaveChanges" 
                runat="server" 
                Text="Save Changes" 
                CssClass="auth-submit-btn" 
                ValidationGroup="ChangePasswordGroup" 
                OnClick="btnSaveChanges_Click" />
        </div>
    </div>
</asp:Content>
