<%@ Page Title="Personal Information" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="PersonalInfo.aspx.cs" Inherits="AgriYard.PersonalInfo" %>

<asp:Content ID="HeadContent1" ContentPlaceHolderID="HeadContent" runat="server">
    <link rel="stylesheet" href="~/Content/auth.css" />
    <link rel="stylesheet" href="~/Content/validation.css" />
    <style>
        .profile-page-wrapper {
            max-width: 680px;
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
        .profile-avatar-circle {
            width: 76px;
            height: 76px;
            border-radius: 50%;
            background-color: #e8f5e9;
            display: flex;
            align-items: center;
            justify-content: center;
            margin: 0 auto 12px;
        }
        .form-grid-two-col {
            display: grid;
            grid-template-columns: 1fr 1fr;
            gap: 20px;
            margin-bottom: 20px;
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
            .form-grid-two-col {
                grid-template-columns: 1fr;
                gap: 16px;
                margin-bottom: 16px;
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
                Personal Information
            </h1>

            <%-- White Information Card Container --%>
            <div class="profile-card-form">
                <%-- Feedback Banner --%>
                <asp:Panel ID="pnlProfileUpdated" runat="server" Visible="false" CssClass="demo-success-banner" style="margin-bottom: 20px;">
                    <asp:Literal ID="litProfileUpdated" runat="server" />
                </asp:Panel>

                <asp:ValidationSummary 
                    ID="valSummaryProfile" 
                    runat="server" 
                    ValidationGroup="ProfileGroup" 
                    CssClass="validation-summary" 
                    HeaderText="Please check the following:" />

                <%-- Centered Avatar & Full Name --%>
                <div style="text-align: center; margin-bottom: 28px;">
                    <div class="profile-avatar-circle">
                        <svg width="40" height="40" viewBox="0 0 24 24" fill="#2e7d32">
                            <path d="M12 12c2.21 0 4-1.79 4-4s-1.79-4-4-4-4 1.79-4 4 1.79 4 4 4zm0 2c-2.67 0-8 1.34-8 4v2h16v-2c0-2.66-5.33-4-8-4z"/>
                        </svg>
                    </div>
                    <h3 style="font-size: 18px; font-weight: 700; color: #1a271a; margin: 0;">
                        <asp:Literal ID="litCardFullName" runat="server">Harshal Dobariya</asp:Literal>
                    </h3>
                </div>

                <%-- Row 1: Full Name & Mobile Number (Two Columns) --%>
                <div class="form-grid-two-col">
                    <div>
                        <label class="custom-form-label">Full Name</label>
                        <asp:TextBox ID="txtFullName" runat="server" CssClass="custom-input" placeholder="Harshal Dobariya" />
                        <asp:RequiredFieldValidator 
                            ID="rfvFullName" 
                            runat="server" 
                            ControlToValidate="txtFullName" 
                            ErrorMessage="Full Name is required." 
                            CssClass="validation-error" 
                            Display="Dynamic" 
                            ValidationGroup="ProfileGroup" />
                    </div>
                    <div>
                        <label class="custom-form-label">Mobile Number</label>
                        <asp:TextBox ID="txtMobileNumber" runat="server" CssClass="custom-input" placeholder="+91 98765 43210" />
                        <asp:RequiredFieldValidator 
                            ID="rfvMobileNumber" 
                            runat="server" 
                            ControlToValidate="txtMobileNumber" 
                            ErrorMessage="Mobile Number is required." 
                            CssClass="validation-error" 
                            Display="Dynamic" 
                            ValidationGroup="ProfileGroup" />
                    </div>
                </div>

                <%-- Row 2: Email Address & User Category (Two Columns) --%>
                <div class="form-grid-two-col">
                    <div>
                        <label class="custom-form-label">Email Address</label>
                        <asp:TextBox ID="txtEmailAddress" runat="server" CssClass="custom-input" placeholder="hdobariya343@rku.ac.in" />
                        <asp:RequiredFieldValidator 
                            ID="rfvEmailAddress" 
                            runat="server" 
                            ControlToValidate="txtEmailAddress" 
                            ErrorMessage="Email Address is required." 
                            CssClass="validation-error" 
                            Display="Dynamic" 
                            ValidationGroup="ProfileGroup" />
                    </div>
                    <div>
                        <label class="custom-form-label">User Category</label>
                        <asp:TextBox ID="txtUserCategory" runat="server" CssClass="custom-input" Text="Farmer (ખેડૂત)" />
                    </div>
                </div>

                <%-- Row 3: City / Location (Full Width) --%>
                <div style="margin-bottom: 28px;">
                    <label class="custom-form-label">City / Location</label>
                    <asp:TextBox ID="txtCityLocation" runat="server" CssClass="custom-input" Text="Junagadh, Gujarat" />
                </div>

                <%-- Save Changes Button --%>
                <asp:Button 
                    ID="btnSaveProfile" 
                    runat="server" 
                    Text="Save Changes" 
                    CssClass="btn-save-green" 
                    ValidationGroup="ProfileGroup" 
                    OnClick="btnSaveProfile_Click" />
            </div>
        </div>
    </div>
</asp:Content>
