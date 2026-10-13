<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Register.aspx.cs" Inherits="AgriYard.Register" %>
<!DOCTYPE html>
<html lang="en">
<head runat="server">
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Create Account - AgriYard</title>

    <%-- Stylesheets --%>
    <link rel="stylesheet" href="~/Content/site.css" />
    <link rel="stylesheet" href="~/Content/auth.css" />
    <link rel="stylesheet" href="~/Content/validation.css" />
</head>
<body class="auth-page-wrapper">
    <form id="registerForm" runat="server">
        <%-- Top Navigation Bar matching Page 3 of Figma PDF --%>
        <header class="auth-header">
            <a href="<%= ResolveUrl("~/Default.aspx") %>" class="auth-header-brand">
                AgriYard
            </a>
            <a href="<%= ResolveUrl("~/Login.aspx") %>" class="auth-back-link">
                &lt; Back to Login
            </a>
        </header>

        <%-- Centered Create Account Card --%>
        <main class="auth-main">
            <div class="auth-card">
                <h1 class="auth-title">Create Account</h1>
                <p class="auth-subtitle">Fill in the details to get started</p>

                <%-- Demo Confirmation Banner --%>
                <asp:Panel ID="pnlRegisterSuccess" runat="server" Visible="false" CssClass="demo-success-banner">
                    <asp:Literal ID="litRegisterSuccess" runat="server" />
                </asp:Panel>

                <%-- ValidationSummary Control --%>
                <asp:ValidationSummary 
                    ID="valSummaryRegister" 
                    runat="server" 
                    ValidationGroup="RegisterGroup"
                    CssClass="validation-summary" 
                    HeaderText="Please correct the following errors:" 
                    DisplayMode="BulletList" />

                <%-- 1. Full Name Field --%>
                <div class="form-group">
                    <asp:Label ID="lblFullName" runat="server" AssociatedControlID="txtFullName" CssClass="form-label">
                        Full Name
                    </asp:Label>
                    <asp:TextBox 
                        ID="txtFullName" 
                        runat="server" 
                        CssClass="form-control" 
                        placeholder="Enter your full name" />

                    <asp:RequiredFieldValidator 
                        ID="rfvFullName" 
                        runat="server" 
                        ControlToValidate="txtFullName" 
                        ErrorMessage="Full Name is required." 
                        CssClass="validation-error" 
                        Display="Dynamic" 
                        ValidationGroup="RegisterGroup" />
                </div>

                <%-- 2. Mobile Number Field --%>
                <div class="form-group">
                    <asp:Label ID="lblMobileNumber" runat="server" AssociatedControlID="txtMobileNumber" CssClass="form-label">
                        Mobile Number
                    </asp:Label>
                    <asp:TextBox 
                        ID="txtMobileNumber" 
                        runat="server" 
                        CssClass="form-control" 
                        placeholder="Enter your mobile number" 
                        MaxLength="10" />

                    <asp:RequiredFieldValidator 
                        ID="rfvMobileNumber" 
                        runat="server" 
                        ControlToValidate="txtMobileNumber" 
                        ErrorMessage="Mobile Number is required." 
                        CssClass="validation-error" 
                        Display="Dynamic" 
                        ValidationGroup="RegisterGroup" />

                    <%-- RegularExpressionValidator: 10-digit Indian mobile starting with 6-9 --%>
                    <asp:RegularExpressionValidator 
                        ID="revMobileNumber" 
                        runat="server" 
                        ControlToValidate="txtMobileNumber" 
                        ValidationExpression="^[6-9]\d{9}$" 
                        ErrorMessage="Please enter a valid 10-digit mobile number (e.g., 9876543210)." 
                        CssClass="validation-error" 
                        Display="Dynamic" 
                        ValidationGroup="RegisterGroup" />
                </div>

                <%-- 3. Email Field --%>
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

                    <asp:RequiredFieldValidator 
                        ID="rfvEmail" 
                        runat="server" 
                        ControlToValidate="txtEmail" 
                        ErrorMessage="Email is required." 
                        CssClass="validation-error" 
                        Display="Dynamic" 
                        ValidationGroup="RegisterGroup" />

                    <asp:RegularExpressionValidator 
                        ID="revEmail" 
                        runat="server" 
                        ControlToValidate="txtEmail" 
                        ValidationExpression="^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$" 
                        ErrorMessage="Please enter a valid email format." 
                        CssClass="validation-error" 
                        Display="Dynamic" 
                        ValidationGroup="RegisterGroup" />
                </div>

                <%-- 4. Password Field --%>
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

                    <asp:RequiredFieldValidator 
                        ID="rfvPassword" 
                        runat="server" 
                        ControlToValidate="txtPassword" 
                        ErrorMessage="Password is required." 
                        CssClass="validation-error" 
                        Display="Dynamic" 
                        ValidationGroup="RegisterGroup" />
                </div>

                <%-- 5. Confirm Password Field --%>
                <div class="form-group">
                    <asp:Label ID="lblConfirmPassword" runat="server" AssociatedControlID="txtConfirmPassword" CssClass="form-label">
                        Confirm Password
                    </asp:Label>
                    <asp:TextBox 
                        ID="txtConfirmPassword" 
                        runat="server" 
                        CssClass="form-control" 
                        placeholder="Confirm your password" 
                        TextMode="Password" />

                    <asp:RequiredFieldValidator 
                        ID="rfvConfirmPassword" 
                        runat="server" 
                        ControlToValidate="txtConfirmPassword" 
                        ErrorMessage="Confirm Password is required." 
                        CssClass="validation-error" 
                        Display="Dynamic" 
                        ValidationGroup="RegisterGroup" />

                    <%-- 
                        VALIDATOR 3 OF 6: CompareValidator
                        Verifies that Confirm Password matches Password exactly
                    --%>
                    <asp:CompareValidator 
                        ID="cvConfirmPassword" 
                        runat="server" 
                        ControlToValidate="txtConfirmPassword" 
                        ControlToCompare="txtPassword" 
                        Operator="Equal" 
                        Type="String" 
                        ErrorMessage="Passwords do not match." 
                        CssClass="validation-error" 
                        Display="Dynamic" 
                        ValidationGroup="RegisterGroup" />
                </div>

                <%-- Create Account Submit Button --%>
                <asp:Button 
                    ID="btnCreateAccount" 
                    runat="server" 
                    Text="Create Account" 
                    CssClass="auth-submit-btn" 
                    ValidationGroup="RegisterGroup" 
                    OnClick="btnCreateAccount_Click" />

                <%-- Bottom Login Link --%>
                <div class="auth-footer-link">
                    Already have an account? 
                    <a href="<%= ResolveUrl("~/Login.aspx") %>">Login</a>
                </div>
            </div>
        </main>
    </form>
</body>
</html>

