<%@ Page Title="User Profile" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="Profile.aspx.cs" Inherits="AgriYard.Profile" %>

<asp:Content ID="HeadContent1" ContentPlaceHolderID="HeadContent" runat="server">
    <link rel="stylesheet" href="~/Content/market.css" />
</asp:Content>

<asp:Content ID="MainContent1" ContentPlaceHolderID="MainContent" runat="server">
    <div class="content-container">
        <%-- Centered Profile Card (Matching Page 15 of Figma PDF) --%>
        <div class="profile-card-wrapper">
            <%-- Top Green Banner with Circular Avatar --%>
            <div class="profile-green-banner">
                <div class="profile-avatar-circle">
                    <img src="<%= ResolveUrl("~/Images/avatar.svg") %>" alt="User Profile Avatar" />
                </div>
            </div>

            <%-- Profile Body Details --%>
            <div class="profile-body-content">
                <h1 class="profile-user-name"><%= AgriYard.Data.SampleData.CurrentUser.FullName %></h1>
                <p class="profile-user-phone"><%= AgriYard.Data.SampleData.CurrentUser.MobileNumber %></p>
                <p class="profile-user-email"><%= AgriYard.Data.SampleData.CurrentUser.Email %></p>

                <%-- Profile Navigation Links --%>
                <div class="profile-menu-list">
                    <a href="<%= ResolveUrl("~/PersonalInfo.aspx") %>" class="profile-menu-item">
                        <div class="profile-item-left">
                            <svg width="18" height="18" viewBox="0 0 24 24" fill="none" stroke="#2e7d32" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" style="display:block;">
                                <path d="M20 21v-2a4 4 0 0 0-4-4H8a4 4 0 0 0-4 4v2"></path>
                                <circle cx="12" cy="7" r="4"></circle>
                            </svg>
                            <span>Personal Information</span>
                        </div>
                        <svg width="14" height="14" viewBox="0 0 24 24" fill="none" stroke="#8fa08f" stroke-width="2.5" stroke-linecap="round" stroke-linejoin="round">
                            <polyline points="9 18 15 12 9 6"></polyline>
                        </svg>
                    </a>

                    <a href="<%= ResolveUrl("~/ChangePassword.aspx") %>" class="profile-menu-item">
                        <div class="profile-item-left">
                            <svg width="18" height="18" viewBox="0 0 24 24" fill="none" stroke="#2e7d32" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" style="display:block;">
                                <rect x="3" y="11" width="18" height="11" rx="2" ry="2"></rect>
                                <path d="M7 11V7a5 5 0 0 1 10 0v4"></path>
                            </svg>
                            <span>Change Password</span>
                        </div>
                        <svg width="14" height="14" viewBox="0 0 24 24" fill="none" stroke="#8fa08f" stroke-width="2.5" stroke-linecap="round" stroke-linejoin="round">
                            <polyline points="9 18 15 12 9 6"></polyline>
                        </svg>
                    </a>

                    <a href="<%= ResolveUrl("~/HelpSupport.aspx") %>" class="profile-menu-item">
                        <div class="profile-item-left">
                            <svg width="18" height="18" viewBox="0 0 24 24" fill="none" stroke="#2e7d32" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" style="display:block;">
                                <circle cx="12" cy="12" r="10"></circle>
                                <path d="M9.09 9a3 3 0 0 1 5.83 1c0 2-3 3-3 3"></path>
                                <line x1="12" y1="17" x2="12.01" y2="17"></line>
                            </svg>
                            <span>Help &amp; Support</span>
                        </div>
                        <svg width="14" height="14" viewBox="0 0 24 24" fill="none" stroke="#8fa08f" stroke-width="2.5" stroke-linecap="round" stroke-linejoin="round">
                            <polyline points="9 18 15 12 9 6"></polyline>
                        </svg>
                    </a>

                    <%-- Logout Button (Light Pink Styled Row) --%>
                    <asp:LinkButton 
                        ID="btnLogout" 
                        runat="server" 
                        CssClass="profile-menu-item logout-row" 
                        OnClick="btnLogout_Click">
                        <div class="profile-item-left">
                            <svg width="18" height="18" viewBox="0 0 24 24" fill="none" stroke="#d32f2f" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" style="display:block;">
                                <path d="M9 21H5a2 2 0 0 1-2-2V5a2 2 0 0 1 2-2h4"></path>
                                <polyline points="16 17 21 12 16 7"></polyline>
                                <line x1="21" y1="12" x2="9" y2="12"></line>
                            </svg>
                            <span>Logout</span>
                        </div>
                        <span></span>
                    </asp:LinkButton>
                </div>
            </div>
        </div>
    </div>
</asp:Content>

