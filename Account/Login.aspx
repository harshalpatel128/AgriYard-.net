<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="AgriYard.Account.Login" %>
<!DOCTYPE html>
<html lang="en">
<head runat="server">
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Login - AgriYard</title>

    <%-- Authentication and Validation Stylesheets --%>
    <link rel="stylesheet" href="~/Content/site.css" />
    <link rel="stylesheet" href="~/Content/auth.css" />
    <link rel="stylesheet" href="~/Content/validation.css" />
</head>
<body class="auth-page-wrapper">
    <form id="loginForm" runat="server">
        <%-- Top Minimalist Navigation Bar (Page 1) --%>
        <header class="auth-header">
            <a href="<%= ResolveUrl("~/Default.aspx") %>" class="auth-header-brand">
                AgriYard
            </a>
            <div></div>
        </header>

        <%-- Centered Authentication Container --%>
        <main class="auth-main">
            <div class="auth-card">
                <%-- Main Card Headings --%>
                <h1 class="auth-title">Welcome Back!</h1>
                <p class="auth-subtitle">Login to continue</p>

                <%-- Demo Success/Informational Banner --%>
                <asp:Panel ID="pnlDemoMessage" runat="server" Visible="false" CssClass="demo-success-banner">
                    <asp:Literal ID="litDemoMessage" runat="server" />
                </asp:Panel>

                <%-- 
                    VALIDATOR 6 OF 6: ValidationSummary
                    Consolidates and summarizes all validation errors at the top of the form
                --%>
                <asp:ValidationSummary 
                    ID="valSummaryLogin" 
                    runat="server" 
                    ValidationGroup="LoginGroup"
                    CssClass="validation-summary" 
                    HeaderText="Please correct the following errors:" 
                    DisplayMode="BulletList" />

                <%-- Email Input Field --%>
                <div class="form-group">
                    <asp:Label ID="lblEmail" runat="server" AssociatedControlID="txtEmail" CssClass="form-label">
                        Email
                    </asp:Label>
                    <asp:TextBox 
                        ID="txtEmail" 
                        runat="server" 
                        CssClass="form-control" 
                        placeholder="Enter your email" 
                        TextMode="Email" />

                    <%-- 
                        VALIDATOR 1 OF 6: RequiredFieldValidator
                        Ensures the email input field is not submitted blank
                    --%>
                    <asp:RequiredFieldValidator 
                        ID="rfvEmail" 
                        runat="server" 
                        ControlToValidate="txtEmail" 
                        ErrorMessage="Email address is required." 
                        CssClass="validation-error" 
                        Display="Dynamic" 
                        ValidationGroup="LoginGroup" />

                    <%-- 
                        VALIDATOR 4 OF 6: RegularExpressionValidator
                        Ensures a valid email format is entered (e.g., user@domain.com)
                    --%>
                    <asp:RegularExpressionValidator 
                        ID="revEmail" 
                        runat="server" 
                        ControlToValidate="txtEmail" 
                        ValidationExpression="^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$" 
                        ErrorMessage="Please enter a valid email address format." 
                        CssClass="validation-error" 
                        Display="Dynamic" 
                        ValidationGroup="LoginGroup" />
                </div>

                <%-- Password Input Field --%>
                <div class="form-group">
                    <asp:Label ID="lblPassword" runat="server" AssociatedControlID="txtPassword" CssClass="form-label">
                        Password
                    </asp:Label>
                    <asp:TextBox 
                        ID="txtPassword" 
                        runat="server" 
                        CssClass="form-control" 
                        placeholder="Enter your password" 
                        TextMode="Password" />

                    <%-- 
                        VALIDATOR 1 OF 6: RequiredFieldValidator
                        Ensures the password input field is not submitted blank
                    --%>
                    <asp:RequiredFieldValidator 
                        ID="rfvPassword" 
                        runat="server" 
                        ControlToValidate="txtPassword" 
                        ErrorMessage="Password is required." 
                        CssClass="validation-error" 
                        Display="Dynamic" 
                        ValidationGroup="LoginGroup" />
                </div>

                <%-- Forgot Password Link (Right Aligned) --%>
                <div class="form-extra-row">
                    <a href="<%= ResolveUrl("~/Account/ForgotPassword.aspx") %>" class="forgot-password-link">
                        Forgot Password?
                    </a>
                </div>

                <%-- Login Submit Button --%>
                <asp:Button 
                    ID="btnLogin" 
                    runat="server" 
                    Text="Login" 
                    CssClass="auth-submit-btn" 
                    ValidationGroup="LoginGroup" 
                    OnClick="btnLogin_Click" />

                <%-- Link to Registration / Sign Up --%>
                <div class="auth-footer-link">
                    Don't have an account? 
                    <a href="<%= ResolveUrl("~/Account/Register.aspx") %>">Sign Up</a>
                </div>
            </div>
        </main>
    </form>
</body>
</html>
