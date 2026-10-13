<%@ Page Title="Personal Information" Language="C#" MasterPageFile="~/Shared/Main.Master" AutoEventWireup="true" CodeBehind="PersonalInfo.aspx.cs" Inherits="AgriYard.Profile.PersonalInfo" %>

<asp:Content ID="HeadContent1" ContentPlaceHolderID="HeadContent" runat="server">
    <link rel="stylesheet" href="~/Content/auth.css" />
    <link rel="stylesheet" href="~/Content/validation.css" />
</asp:Content>

<asp:Content ID="MainContent1" ContentPlaceHolderID="MainContent" runat="server">
    <div class="content-container" style="max-width: 580px;">
        <a href="<%= ResolveUrl("~/Profile/Profile.aspx") %>" class="back-nav-link">
            &lt; Back to Profile
        </a>

        <div class="auth-card" style="max-width: 100%; margin: 0 auto; text-align: left;">
            <h1 class="auth-title" style="text-align: center;">Personal Information</h1>
            <p class="auth-subtitle" style="text-align: center;">Update your farmer profile details</p>

            <asp:Panel ID="pnlProfileUpdated" runat="server" Visible="false" CssClass="demo-success-banner">
                <asp:Literal ID="litProfileUpdated" runat="server" />
            </asp:Panel>

            <asp:ValidationSummary 
                ID="valSummaryProfile" 
                runat="server" 
                ValidationGroup="ProfileGroup"
                CssClass="validation-summary" 
                HeaderText="Please review the following fields:" 
                DisplayMode="BulletList" />

            <div class="form-group">
                <asp:Label ID="lblProfileName" runat="server" AssociatedControlID="txtProfileName" CssClass="form-label">
                    Full Name
                </asp:Label>
                <asp:TextBox ID="txtProfileName" runat="server" CssClass="form-control" Text="Harshal Dobariya" />
                <asp:RequiredFieldValidator 
                    ID="rfvProfileName" 
                    runat="server" 
                    ControlToValidate="txtProfileName" 
                    ErrorMessage="Full Name is required." 
                    CssClass="validation-error" 
                    Display="Dynamic" 
                    ValidationGroup="ProfileGroup" />
            </div>

            <div class="form-group">
                <asp:Label ID="lblProfilePhone" runat="server" AssociatedControlID="txtProfilePhone" CssClass="form-label">
                    Mobile Number
                </asp:Label>
                <asp:TextBox ID="txtProfilePhone" runat="server" CssClass="form-control" Text="9876543210" MaxLength="10" />
                <asp:RequiredFieldValidator 
                    ID="rfvProfilePhone" 
                    runat="server" 
                    ControlToValidate="txtProfilePhone" 
                    ErrorMessage="Mobile Number is required." 
                    CssClass="validation-error" 
                    Display="Dynamic" 
                    ValidationGroup="ProfileGroup" />
                <asp:RegularExpressionValidator 
                    ID="revProfilePhone" 
                    runat="server" 
                    ControlToValidate="txtProfilePhone" 
                    ValidationExpression="^[6-9]\d{9}$" 
                    ErrorMessage="Please enter a valid 10-digit mobile number." 
                    CssClass="validation-error" 
                    Display="Dynamic" 
                    ValidationGroup="ProfileGroup" />
            </div>

            <div class="form-group">
                <asp:Label ID="lblProfileEmail" runat="server" AssociatedControlID="txtProfileEmail" CssClass="form-label">
                    Email
                </asp:Label>
                <asp:TextBox ID="txtProfileEmail" runat="server" CssClass="form-control" Text="harshal.dobariya@example.com" TextMode="Email" />
                <asp:RequiredFieldValidator 
                    ID="rfvProfileEmail" 
                    runat="server" 
                    ControlToValidate="txtProfileEmail" 
                    ErrorMessage="Email address is required." 
                    CssClass="validation-error" 
                    Display="Dynamic" 
                    ValidationGroup="ProfileGroup" />
                <asp:RegularExpressionValidator 
                    ID="revProfileEmail" 
                    runat="server" 
                    ControlToValidate="txtProfileEmail" 
                    ValidationExpression="^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$" 
                    ErrorMessage="Please enter a valid email format." 
                    CssClass="validation-error" 
                    Display="Dynamic" 
                    ValidationGroup="ProfileGroup" />
            </div>

            <div class="form-group">
                <asp:Label ID="lblDefaultYard" runat="server" AssociatedControlID="ddlDefaultYard" CssClass="form-label">
                    Preferred Marketing Yard
                </asp:Label>
                <asp:DropDownList ID="ddlDefaultYard" runat="server" CssClass="form-control">
                    <asp:ListItem Value="rajkot" Selected="True">Rajkot Marketing Yard</asp:ListItem>
                    <asp:ListItem Value="junagadh">Junagadh Marketing Yard</asp:ListItem>
                    <asp:ListItem Value="gondal">Gondal Marketing Yard</asp:ListItem>
                    <asp:ListItem Value="mendarda">Mendarda Marketing Yard</asp:ListItem>
                </asp:DropDownList>
            </div>

            <asp:Button 
                ID="btnSaveProfile" 
                runat="server" 
                Text="Save Profile" 
                CssClass="auth-submit-btn" 
                ValidationGroup="ProfileGroup" 
                OnClick="btnSaveProfile_Click" />
        </div>
    </div>
</asp:Content>
