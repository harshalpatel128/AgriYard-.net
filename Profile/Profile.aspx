<%@ Page Title="User Profile" Language="C#" MasterPageFile="~/Shared/Main.Master" AutoEventWireup="true" CodeBehind="Profile.aspx.cs" Inherits="AgriYard.Profile.Profile" %>

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
                <h1 class="profile-user-name">Harshal Dobariya</h1>
                <p class="profile-user-phone">+91 98765 43210</p>
                <p class="profile-user-email">harshal.dobariya@example.com</p>

                <%-- Profile Navigation Links --%>
                <div class="profile-menu-list">
                    <a href="<%= ResolveUrl("~/Profile/PersonalInfo.aspx") %>" class="profile-menu-item">
                        <div class="profile-item-left">
                            <span>⚪</span>
                            <span>Personal Information</span>
                        </div>
                        <span>❯</span>
                    </a>

                    <a href="<%= ResolveUrl("~/Profile/ChangePassword.aspx") %>" class="profile-menu-item">
                        <div class="profile-item-left">
                            <span>🔒</span>
                            <span>Change Password</span>
                        </div>
                        <span>❯</span>
                    </a>

                    <a href="<%= ResolveUrl("~/Support/HelpSupport.aspx") %>" class="profile-menu-item">
                        <div class="profile-item-left">
                            <span>❔</span>
                            <span>Help &amp; Support</span>
                        </div>
                        <span>❯</span>
                    </a>

                    <%-- Logout Button (Light Pink Styled Row) --%>
                    <asp:LinkButton 
                        ID="btnLogout" 
                        runat="server" 
                        CssClass="profile-menu-item logout-row" 
                        OnClick="btnLogout_Click">
                        <div class="profile-item-left">
                            <span>🚪</span>
                            <span>Logout</span>
                        </div>
                        <span></span>
                    </asp:LinkButton>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
