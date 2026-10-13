<%@ Page Title="Change Password" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="ChangePassword.aspx.cs" Inherits="AgriYard.ChangePassword" %>

<asp:Content ID="HeadContent1" ContentPlaceHolderID="HeadContent" runat="server">
    <link rel="stylesheet" href="~/Content/auth.css" />
    <link rel="stylesheet" href="~/Content/validation.css" />
    <style>
        .profile-page-wrapper {
            max-width: 600px;
            margin: 0 auto;
            padding-top: 10px;
        }
        .profile-card-form {
            background: #ffffff;
            border-radius: 20px;
            padding: 40px 48px;
            border: 1px solid #eef2ee;
            box-shadow: 0 4px 20px rgba(0, 0, 0, 0.03);
        }
        .profile-lock-circle {
            width: 68px;
            height: 68px;
            border-radius: 50%;
            background-color: #e8f5e9;
            display: flex;
            align-items: center;
            justify-content: center;
            margin: 0 auto 14px;
        }
        .custom-form-label {
            font-size: 13px;
            font-weight: 600;
            color: #4a5568;
            margin-bottom: 6px;
            display: block;
        }
        .custom-input {
            width: 100%;
            background-color: #ffffff;
            border: 1px solid #dce4dc;
            border-radius: 8px;
            padding: 10px 14px;
            font-size: 14px;
            color: #1e291e;
            outline: none;
            transition: border-color 0.15s ease, box-shadow 0.15s ease;
            box-sizing: border-box;
        }
        .custom-input:focus {
            border-color: var(--primary-green, #2e7d32);
            box-shadow: 0 0 0 3px rgba(46, 125, 50, 0.12);
        }
        .btn-save-green {
            width: 100%;
            background-color: var(--primary-green, #2e7d32);
            color: #ffffff;
            font-weight: 700;
            font-size: 15px;
            padding: 13px;
            border-radius: 8px;
            border: none;
            cursor: pointer;
            transition: background-color 0.15s ease;
        }
        .btn-save-green:hover {
            background-color: var(--primary-green-dark, #1b5e20);
        }
        @media (max-width: 600px) {
            .profile-card-form {
                padding: 28px 20px;
            }
        }
    </style>
</asp:Content>

<asp:Content ID="MainContent1" ContentPlaceHolderID="MainContent" runat="server">
    <div class="content-container">
        <div class="profile-page-wrapper">
            <%-- Back Link to Profile (Outside Card) --%>
            <div style="margin-bottom: 6px;">
                <a href="<%= ResolveUrl("~/Profile.aspx") %>" style="display: inline-flex; align-items: center; gap: 6px; font-weight: 700; color: #1b5e20; text-decoration: none; font-size: 13.5px;">
                    &lt; Back to Profile
                </a>
            </div>

            <%-- Page Heading (Outside Card) --%>
            <h1 style="font-size: 26px; font-weight: 800; color: #1b5e20; margin: 0 0 24px 0; letter-spacing: -0.3px;">
                Change Password
            </h1>

            <%-- White Information Card Container --%>
            <div class="profile-card-form">
                <%-- Demo Success Notice --%>
                <asp:Panel ID="pnlChangeSuccess" runat="server" Visible="false" CssClass="demo-success-banner" style="margin-bottom: 20px;">
                    <asp:Literal ID="litChangeSuccess" runat="server" />
                </asp:Panel>

                <asp:ValidationSummary 
                    ID="valSummaryChangePassword" 
                    runat="server" 
                    ValidationGroup="ChangePasswordGroup" 
                    CssClass="validation-summary" 
                    HeaderText="Please check the following:" />

                <%-- Centered Green Lock Badge & Subtitle --%>
                <div style="text-align: center; margin-bottom: 24px;">
                    <div class="profile-lock-circle">
                        <svg width="32" height="32" viewBox="0 0 24 24" fill="none" stroke="#2e7d32" stroke-width="2.3" stroke-linecap="round" stroke-linejoin="round">
                            <rect x="3" y="11" width="18" height="11" rx="2" ry="2"></rect>
                            <path d="M7 11V7a5 5 0 0 1 10 0v4"></path>
                        </svg>
                    </div>
                    <p style="font-size: 13.5px; color: #6b7280; margin: 0; line-height: 1.45;">
                        Your new password must be different from previous used passwords.
                    </p>
                </div>

                <%-- 1. Current Password Field --%>
                <div style="margin-bottom: 20px;">
                    <label class="custom-form-label">Current Password</label>
                    <asp:TextBox 
                        ID="txtCurrentPassword" 
                        runat="server" 
                        CssClass="custom-input" 
                        placeholder="••••••••" 
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
                <div style="margin-bottom: 20px;">
                    <label class="custom-form-label">New Password</label>
                    <asp:TextBox 
                        ID="txtNewPassword" 
                        runat="server" 
                        CssClass="custom-input" 
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
                    <asp:RegularExpressionValidator 
                        ID="revNewPassword" 
                        runat="server" 
                        ControlToValidate="txtNewPassword" 
                        ValidationExpression="^.{6,25}$" 
                        ErrorMessage="New password must be at least 6 characters long." 
                        CssClass="validation-error" 
                        Display="Dynamic" 
                        ValidationGroup="ChangePasswordGroup" />
                    <asp:CustomValidator 
                        ID="cvDifferentPassword" 
                        runat="server" 
                        ControlToValidate="txtNewPassword" 
                        OnServerValidate="cvDifferentPassword_ServerValidate" 
                        ErrorMessage="New password cannot be identical to current password." 
                        CssClass="validation-error" 
                        Display="Dynamic" 
                        ValidationGroup="ChangePasswordGroup" />
                </div>

                <%-- 3. Confirm New Password Field --%>
                <div style="margin-bottom: 28px;">
                    <label class="custom-form-label">Confirm New Password</label>
                    <asp:TextBox 
                        ID="txtConfirmNewPassword" 
                        runat="server" 
                        CssClass="custom-input" 
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
                    CssClass="btn-save-green" 
                    ValidationGroup="ChangePasswordGroup" 
                    OnClick="btnSaveChanges_Click" />
            </div>
        </div>
    </div>
</asp:Content>
