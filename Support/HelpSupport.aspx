<%@ Page Title="Help & Support" Language="C#" MasterPageFile="~/Shared/Main.Master" AutoEventWireup="true" CodeBehind="HelpSupport.aspx.cs" Inherits="AgriYard.Support.HelpSupport" %>

<asp:Content ID="HeadContent1" ContentPlaceHolderID="HeadContent" runat="server">
    <link rel="stylesheet" href="~/Content/market.css" />
    <link rel="stylesheet" href="~/Content/validation.css" />
</asp:Content>

<asp:Content ID="MainContent1" ContentPlaceHolderID="MainContent" runat="server">
    <div class="content-container">
        <%-- Centered Help & Support Card (Matching Page 21 of Figma PDF) --%>
        <div class="profile-card-wrapper" style="max-width: 520px;">
            <%-- Top Green Banner with Circular Help Icon --%>
            <div class="profile-green-banner">
                <div class="profile-avatar-circle">
                    <img src="<%= ResolveUrl("~/Images/help_icon.svg") %>" alt="Help and Support Icon" />
                </div>
            </div>

            <%-- Card Body --%>
            <div class="profile-body-content">
                <h1 class="profile-user-name">Help &amp; Support</h1>
                <p class="profile-user-email" style="margin-bottom: 24px;">
                    Find answers or reach out to our support team
                </p>

                <%-- Action Notice if bug report was submitted --%>
                <asp:Panel ID="pnlHelpNotice" runat="server" Visible="false" CssClass="demo-success-banner">
                    <asp:Literal ID="litHelpNotice" runat="server" />
                </asp:Panel>

                <%-- Support Navigation List --%>
                <div class="profile-menu-list">
                    <%-- 1. How to check today's market rates --%>
                    <a href="<%= ResolveUrl("~/Market/Rates.aspx") %>" class="profile-menu-item">
                        <div class="profile-item-left">
                            <span style="font-size: 16px;">ⓘ</span>
                            <span>How to check today's market rates</span>
                        </div>
                        <span>❯</span>
                    </a>

                    <%-- 2. Guide to contacting shop owners --%>
                    <a href="<%= ResolveUrl("~/Shops/ShopDirectory.aspx") %>" class="profile-menu-item">
                        <div class="profile-item-left">
                            <span style="font-size: 16px;">👤</span>
                            <span>Guide to contacting shop owners</span>
                        </div>
                        <span>❯</span>
                    </a>

                    <%-- 3. Call Helpline (+91 0281 2456789) --%>
                    <a href="tel:+9102812456789" class="profile-menu-item">
                        <div class="profile-item-left">
                            <span style="font-size: 16px;">📱</span>
                            <span>Call Helpline (+91 0281 2456789)</span>
                        </div>
                        <span>❯</span>
                    </a>

                    <%-- 4. Email us (support@agriyard.com) --%>
                    <a href="mailto:support@agriyard.com" class="profile-menu-item">
                        <div class="profile-item-left">
                            <span style="font-size: 16px;">✉</span>
                            <span>Email us (support@agriyard.com)</span>
                        </div>
                        <span>❯</span>
                    </a>

                    <%-- 5. Report a bug or issue (Light Pink Alert Card) --%>
                    <asp:LinkButton 
                        ID="btnShowBugReport" 
                        runat="server" 
                        CssClass="profile-menu-item bug-report-row" 
                        OnClick="btnShowBugReport_Click">
                        <div class="profile-item-left">
                            <span style="font-size: 16px;">⚠</span>
                            <span>Report a bug or issue</span>
                        </div>
                        <span>❯</span>
                    </asp:LinkButton>
                </div>

                <%-- Expandable Bug Report Form --%>
                <asp:Panel ID="pnlBugForm" runat="server" Visible="false" Style="margin-top: 24px; text-align: left; padding-top: 18px; border-top: 1px solid #f0f4f0;">
                    <h3 style="font-size: 16px; font-weight: 700; color: #1a271a; margin-bottom: 12px;">Submit a Bug Report</h3>

                    <asp:ValidationSummary 
                        ID="valSummaryBug" 
                        runat="server" 
                        ValidationGroup="BugGroup" 
                        CssClass="validation-summary" 
                        HeaderText="Please fix the following:" />

                    <div class="form-group">
                        <asp:Label ID="lblBugTitle" runat="server" AssociatedControlID="txtBugTitle" CssClass="form-label">
                            Issue Subject
                        </asp:Label>
                        <asp:TextBox ID="txtBugTitle" runat="server" CssClass="form-control" placeholder="e.g. Price display mismatch" />
                        <asp:RequiredFieldValidator 
                            ID="rfvBugTitle" 
                            runat="server" 
                            ControlToValidate="txtBugTitle" 
                            ErrorMessage="Issue subject is required." 
                            CssClass="validation-error" 
                            Display="Dynamic" 
                            ValidationGroup="BugGroup" />
                    </div>

                    <div class="form-group">
                        <asp:Label ID="lblBugDesc" runat="server" AssociatedControlID="txtBugDesc" CssClass="form-label">
                            Description
                        </asp:Label>
                        <asp:TextBox ID="txtBugDesc" runat="server" CssClass="form-control" TextMode="MultiLine" Rows="3" placeholder="Describe what occurred..." />
                        <asp:RequiredFieldValidator 
                            ID="rfvBugDesc" 
                            runat="server" 
                            ControlToValidate="txtBugDesc" 
                            ErrorMessage="Description is required." 
                            CssClass="validation-error" 
                            Display="Dynamic" 
                            ValidationGroup="BugGroup" />
                    </div>

                    <asp:Button 
                        ID="btnSubmitBug" 
                        runat="server" 
                        Text="Send Report" 
                        CssClass="btn btn-primary btn-block" 
                        ValidationGroup="BugGroup" 
                        OnClick="btnSubmitBug_Click" />
                </asp:Panel>
            </div>
        </div>
    </div>
</asp:Content>
