<%@ Page Title="Help & Support" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="HelpSupport.aspx.cs" Inherits="AgriYard.HelpSupport" %>

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
                    <a href="<%= ResolveUrl("~/Rates.aspx") %>" class="profile-menu-item">
                        <div class="profile-item-left">
                            <svg width="18" height="18" viewBox="0 0 24 24" fill="none" stroke="#2e7d32" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" style="display:block;">
                                <circle cx="12" cy="12" r="10"></circle>
                                <line x1="12" y1="16" x2="12" y2="12"></line>
                                <line x1="12" y1="8" x2="12.01" y2="8"></line>
                            </svg>
                            <span>How to check today's market rates</span>
                        </div>
                        <svg width="14" height="14" viewBox="0 0 24 24" fill="none" stroke="#8fa08f" stroke-width="2.5" stroke-linecap="round" stroke-linejoin="round">
                            <polyline points="9 18 15 12 9 6"></polyline>
                        </svg>
                    </a>

                    <%-- 2. Guide to contacting shop owners --%>
                    <a href="<%= ResolveUrl("~/ShopDirectory.aspx") %>" class="profile-menu-item">
                        <div class="profile-item-left">
                            <svg width="18" height="18" viewBox="0 0 24 24" fill="none" stroke="#2e7d32" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" style="display:block;">
                                <path d="M20 21v-2a4 4 0 0 0-4-4H8a4 4 0 0 0-4 4v2"></path>
                                <circle cx="12" cy="7" r="4"></circle>
                            </svg>
                            <span>Guide to contacting shop owners</span>
                        </div>
                        <svg width="14" height="14" viewBox="0 0 24 24" fill="none" stroke="#8fa08f" stroke-width="2.5" stroke-linecap="round" stroke-linejoin="round">
                            <polyline points="9 18 15 12 9 6"></polyline>
                        </svg>
                    </a>

                    <%-- 3. Call Helpline (+91 0281 2456789) --%>
                    <a href="tel:+9102812456789" class="profile-menu-item">
                        <div class="profile-item-left">
                            <svg width="18" height="18" viewBox="0 0 24 24" fill="none" stroke="#2e7d32" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" style="display:block;">
                                <path d="M22 16.92v3a2 2 0 0 1-2.18 2 19.79 19.79 0 0 1-8.63-3.07 19.5 19.5 0 0 1-6-6 19.79 19.79 0 0 1-3.07-8.67A2 2 0 0 1 4.11 2h3a2 2 0 0 1 2 1.72 12.84 12.84 0 0 0 .7 2.81 2 2 0 0 1-.45 2.11L8.09 9.91a16 16 0 0 0 6 6l1.27-1.27a2 2 0 0 1 2.11-.45 12.84 12.84 0 0 0 2.81.7A2 2 0 0 1 22 16.92z"></path>
                            </svg>
                            <span>Call Helpline (+91 0281 2456789)</span>
                        </div>
                        <svg width="14" height="14" viewBox="0 0 24 24" fill="none" stroke="#8fa08f" stroke-width="2.5" stroke-linecap="round" stroke-linejoin="round">
                            <polyline points="9 18 15 12 9 6"></polyline>
                        </svg>
                    </a>

                    <%-- 4. Email us (support@agriyard.com) --%>
                    <a href="mailto:support@agriyard.com" class="profile-menu-item">
                        <div class="profile-item-left">
                            <svg width="18" height="18" viewBox="0 0 24 24" fill="none" stroke="#2e7d32" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" style="display:block;">
                                <path d="M4 4h16c1.1 0 2 .9 2 2v12c0 1.1-.9 2-2 2H4c-1.1 0-2-.9-2-2V6c0-1.1.9-2 2-2z"></path>
                                <polyline points="22,6 12,13 2,6"></polyline>
                            </svg>
                            <span>Email us (support@agriyard.com)</span>
                        </div>
                        <svg width="14" height="14" viewBox="0 0 24 24" fill="none" stroke="#8fa08f" stroke-width="2.5" stroke-linecap="round" stroke-linejoin="round">
                            <polyline points="9 18 15 12 9 6"></polyline>
                        </svg>
                    </a>

                    <%-- 5. Report a bug or issue (Light Pink Alert Card) --%>
                    <asp:LinkButton 
                        ID="btnShowBugReport" 
                        runat="server" 
                        CssClass="profile-menu-item bug-report-row" 
                        OnClick="btnShowBugReport_Click">
                        <div class="profile-item-left">
                            <svg width="18" height="18" viewBox="0 0 24 24" fill="none" stroke="#d32f2f" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" style="display:block;">
                                <path d="M10.29 3.86L1.82 18a2 2 0 0 0 1.71 3h16.94a2 2 0 0 0 1.71-3L13.71 3.86a2 2 0 0 0-3.42 0z"></path>
                                <line x1="12" y1="9" x2="12" y2="13"></line>
                                <line x1="12" y1="17" x2="12.01" y2="17"></line>
                            </svg>
                            <span>Report a bug or issue</span>
                        </div>
                        <svg width="14" height="14" viewBox="0 0 24 24" fill="none" stroke="#8fa08f" stroke-width="2.5" stroke-linecap="round" stroke-linejoin="round">
                            <polyline points="9 18 15 12 9 6"></polyline>
                        </svg>
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

