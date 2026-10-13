<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ForgotPassword.aspx.cs" Inherits="AgriYard.Account.ForgotPassword" %>
<!DOCTYPE html>
<html lang="en">
<head runat="server">
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Forgot Password - AgriYard</title>

    <%-- Stylesheets --%>
    <link rel="stylesheet" href="~/Content/site.css" />
    <link rel="stylesheet" href="~/Content/auth.css" />
    <link rel="stylesheet" href="~/Content/validation.css" />
</head>
<body class="auth-page-wrapper">
    <form id="forgotForm" runat="server">
        <%-- Top Navigation Bar matching Page 2 of Figma PDF --%>
        <header class="auth-header">
            <a href="<%= ResolveUrl("~/Default.aspx") %>" class="auth-header-brand">
                AgriYard
            </a>
            <a href="<%= ResolveUrl("~/Account/Login.aspx") %>" class="auth-back-link">
                &lt; Back to Login
            </a>
        </header>

        <%-- Centered Forgot Password Card --%>
        <main class="auth-main">
            <div class="auth-card">
                <%-- Circular Green Lock Icon Badge --%>
                <div class="auth-icon-badge">
                    <img src="<%= ResolveUrl("~/Images/lock_icon.svg") %>" alt="Lock Security Icon" />
                </div>

                <h1 class="auth-title">Forgot Password</h1>
                <h2 style="font-size: 17px; font-weight: 700; color: #1e291e; margin-bottom: 8px;">Reset Your Password</h2>
                <p class="auth-description">
                    Enter your registered email or mobile number.<br />
                    We will send you a reset link or OTP.
                </p>

                <%-- Informational Demo Result Message --%>
                <asp:Panel ID="pnlForgotNotice" runat="server" Visible="false" CssClass="demo-success-banner">
                    <asp:Literal ID="litForgotNotice" runat="server" />
                </asp:Panel>

                <%-- ValidationSummary Control --%>
                <asp:ValidationSummary 
                    ID="valSummaryForgot" 
                    runat="server" 
                    ValidationGroup="ForgotGroup"
                    CssClass="validation-summary" 
                    HeaderText="Please correct the following errors:" 
                    DisplayMode="BulletList" />

                <%-- Email or Mobile Number Input --%>
                <div class="form-group">
                    <asp:Label ID="lblIdentifier" runat="server" AssociatedControlID="txtIdentifier" CssClass="form-label">
                        Email or Mobile Number
                    </asp:Label>
                    <asp:TextBox 
                        ID="txtIdentifier" 
                        runat="server" 
                        CssClass="form-control" 
                        placeholder="Enter email or mobile" />

                    <%-- RequiredFieldValidator --%>
                    <asp:RequiredFieldValidator 
                        ID="rfvIdentifier" 
                        runat="server" 
                        ControlToValidate="txtIdentifier" 
                        ErrorMessage="Email or mobile number is required." 
                        CssClass="validation-error" 
                        Display="Dynamic" 
                        ValidationGroup="ForgotGroup" />

                    <%-- RegularExpressionValidator: Validates either a 10-digit mobile number OR a valid email --%>
                    <asp:RegularExpressionValidator 
                        ID="revIdentifier" 
                        runat="server" 
                        ControlToValidate="txtIdentifier" 
                        ValidationExpression="^([6-9]\d{9}|[\w-\.]+@([\w-]+\.)+[\w-]{2,4})$" 
                        ErrorMessage="Please enter a valid 10-digit mobile number or email address." 
                        CssClass="validation-error" 
                        Display="Dynamic" 
                        ValidationGroup="ForgotGroup" />
                </div>

                <%-- Submit Button --%>
                <asp:Button 
                    ID="btnSendReset" 
                    runat="server" 
                    Text="Send Reset Link" 
                    CssClass="auth-submit-btn" 
                    ValidationGroup="ForgotGroup" 
                    OnClick="btnSendReset_Click" />

                <%-- Bottom Back to Login Link --%>
                <div class="auth-footer-link">
                    <a href="<%= ResolveUrl("~/Account/Login.aspx") %>">&lt; Back to Login</a>
                </div>
            </div>
        </main>
    </form>
</body>
</html>
