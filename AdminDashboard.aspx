<%@ Page Title="Admin Dashboard" Language="C#" MasterPageFile="~/Admin.Master" AutoEventWireup="true" CodeBehind="AdminDashboard.aspx.cs" Inherits="AgriYard.AdminDashboard" %>

<asp:Content ID="AdminHead1" ContentPlaceHolderID="AdminHeadContent" runat="server">
    <link rel="stylesheet" href="~/Content/admin.css" />
    <link rel="stylesheet" href="~/Content/validation.css" />
</asp:Content>

<asp:Content ID="AdminMain1" ContentPlaceHolderID="AdminMainContent" runat="server">
    <%-- Page Heading (Matching Page 17 of Figma PDF) --%>
    <h1 class="admin-page-title">Admin Dashboard</h1>

    <%-- Two Statistic Metric Cards --%>
    <div class="admin-metrics-row">
        <div class="admin-stat-card">
            <div class="admin-stat-label">Total Users</div>
            <div class="admin-stat-number">14,520</div>
        </div>
        <div class="admin-stat-card">
            <div class="admin-stat-label">Active Yards</div>
            <div class="admin-stat-number">24</div>
        </div>
    </div>

    <%-- Quick Price Update Form Card --%>
    <div class="admin-form-card">
        <h3 class="admin-section-heading">Quick Price Update</h3>

        <%-- Feedback Banner --%>
        <asp:Panel ID="pnlUpdateFeedback" runat="server" Visible="false" CssClass="demo-success-banner">
            <asp:Literal ID="litUpdateFeedback" runat="server" />
        </asp:Panel>

        <%-- 
            VALIDATOR 6 OF 6: ValidationSummary
            Displays error summary for rate update fields
        --%>
        <asp:ValidationSummary 
            ID="valSummaryRateUpdate" 
            runat="server" 
            ValidationGroup="RateUpdateGroup"
            CssClass="validation-summary" 
            HeaderText="Please resolve the following rate errors:" 
            DisplayMode="BulletList" />

        <%-- Select Yard and Crop Row --%>
        <div class="admin-fields-row">
            <div class="form-group">
                <asp:Label ID="lblSelectYard" runat="server" AssociatedControlID="ddlSelectYard" CssClass="form-label">
                    Select Yard
                </asp:Label>
                <asp:DropDownList ID="ddlSelectYard" runat="server" CssClass="form-control" AutoPostBack="true" OnSelectedIndexChanged="ddlCropOrYard_Changed">
                    <asp:ListItem Value="rajkot" Selected="True">Rajkot Marketing Yard</asp:ListItem>
                    <asp:ListItem Value="junagadh">Junagadh Marketing Yard</asp:ListItem>
                    <asp:ListItem Value="gondal">Gondal Marketing Yard</asp:ListItem>
                    <asp:ListItem Value="mendarda">Mendarda Marketing Yard</asp:ListItem>
                </asp:DropDownList>
            </div>

            <div class="form-group">
                <asp:Label ID="lblSelectCrop" runat="server" AssociatedControlID="ddlSelectCrop" CssClass="form-label">
                    Select Crop
                </asp:Label>
                <asp:DropDownList ID="ddlSelectCrop" runat="server" CssClass="form-control" AutoPostBack="true" OnSelectedIndexChanged="ddlCropOrYard_Changed">
                    <asp:ListItem Value="wheat" Selected="True">Wheat (Ghau)</asp:ListItem>
                    <asp:ListItem Value="soyabean">Soyabean</asp:ListItem>
                    <asp:ListItem Value="chana">Chana</asp:ListItem>
                    <asp:ListItem Value="cotton">Cotton (Kapas)</asp:ListItem>
                    <asp:ListItem Value="tuver">Tuver</asp:ListItem>
                    <asp:ListItem Value="garlic">Garlic (Lasan)</asp:ListItem>
                </asp:DropDownList>
            </div>

            <div class="form-group">
                <asp:Label ID="lblDate" runat="server" CssClass="form-label">Date</asp:Label>
                <asp:TextBox ID="txtDateDisplay" runat="server" CssClass="form-control" Text="21 May 2025 (Today)" ReadOnly="true" />
            </div>
        </div>

        <%-- Active Crop Subheading --%>
        <div class="admin-sub-commodity-title">
            <asp:Literal ID="litCropSubhead" runat="server">Wheat (Ghau)</asp:Literal>
        </div>

        <%-- Four-Column Numerical Rate Inputs --%>
        <div class="admin-rates-four-col">
            <%-- 1. Arrival Bags Input --%>
            <div class="form-group">
                <asp:Label ID="lblArrival" runat="server" AssociatedControlID="txtArrival" CssClass="form-label">
                    Arrival:
                </asp:Label>
                <asp:TextBox ID="txtArrival" runat="server" CssClass="form-control" Text="980" />

                <%-- RequiredFieldValidator --%>
                <asp:RequiredFieldValidator 
                    ID="rfvArrival" 
                    runat="server" 
                    ControlToValidate="txtArrival" 
                    ErrorMessage="Arrival quantity is required." 
                    CssClass="validation-error" 
                    Display="Dynamic" 
                    ValidationGroup="RateUpdateGroup" />

                <%-- 
                    VALIDATOR 2 OF 6: RangeValidator
                    Verifies Arrival quantity is between 1 and 100,000 bags
                --%>
                <asp:RangeValidator 
                    ID="rvArrival" 
                    runat="server" 
                    ControlToValidate="txtArrival" 
                    Type="Integer" 
                    MinimumValue="1" 
                    MaximumValue="100000" 
                    ErrorMessage="Arrival bags must be between 1 and 100,000." 
                    CssClass="validation-error" 
                    Display="Dynamic" 
                    ValidationGroup="RateUpdateGroup" />
            </div>

            <%-- 2. Minimum Price Input --%>
            <div class="form-group">
                <asp:Label ID="lblMinPrice" runat="server" AssociatedControlID="txtMinPrice" CssClass="form-label">
                    Min &#8377;:
                </asp:Label>
                <asp:TextBox ID="txtMinPrice" runat="server" CssClass="form-control" Text="620" />

                <asp:RequiredFieldValidator 
                    ID="rfvMinPrice" 
                    runat="server" 
                    ControlToValidate="txtMinPrice" 
                    ErrorMessage="Minimum price is required." 
                    CssClass="validation-error" 
                    Display="Dynamic" 
                    ValidationGroup="RateUpdateGroup" />

                <asp:RangeValidator 
                    ID="rvMinPrice" 
                    runat="server" 
                    ControlToValidate="txtMinPrice" 
                    Type="Double" 
                    MinimumValue="1" 
                    MaximumValue="50000" 
                    ErrorMessage="Minimum price must be between &#8377;1 and &#8377;50,000." 
                    CssClass="validation-error" 
                    Display="Dynamic" 
                    ValidationGroup="RateUpdateGroup" />
            </div>

            <%-- 3. Average Price Input --%>
            <div class="form-group">
                <asp:Label ID="lblAvgPrice" runat="server" AssociatedControlID="txtAvgPrice" CssClass="form-label">
                    Avg &#8377;:
                </asp:Label>
                <asp:TextBox ID="txtAvgPrice" runat="server" CssClass="form-control" Text="670" />

                <asp:RequiredFieldValidator 
                    ID="rfvAvgPrice" 
                    runat="server" 
                    ControlToValidate="txtAvgPrice" 
                    ErrorMessage="Average price is required." 
                    CssClass="validation-error" 
                    Display="Dynamic" 
                    ValidationGroup="RateUpdateGroup" />

                <asp:RangeValidator 
                    ID="rvAvgPrice" 
                    runat="server" 
                    ControlToValidate="txtAvgPrice" 
                    Type="Double" 
                    MinimumValue="1" 
                    MaximumValue="50000" 
                    ErrorMessage="Average price must be between &#8377;1 and &#8377;50,000." 
                    CssClass="validation-error" 
                    Display="Dynamic" 
                    ValidationGroup="RateUpdateGroup" />
            </div>

            <%-- 4. Maximum Price Input --%>
            <div class="form-group">
                <asp:Label ID="lblMaxPrice" runat="server" AssociatedControlID="txtMaxPrice" CssClass="form-label">
                    Max &#8377;:
                </asp:Label>
                <asp:TextBox ID="txtMaxPrice" runat="server" CssClass="form-control" Text="720" />

                <asp:RequiredFieldValidator 
                    ID="rfvMaxPrice" 
                    runat="server" 
                    ControlToValidate="txtMaxPrice" 
                    ErrorMessage="Maximum price is required." 
                    CssClass="validation-error" 
                    Display="Dynamic" 
                    ValidationGroup="RateUpdateGroup" />

                <asp:RangeValidator 
                    ID="rvMaxPrice" 
                    runat="server" 
                    ControlToValidate="txtMaxPrice" 
                    Type="Double" 
                    MinimumValue="1" 
                    MaximumValue="50000" 
                    ErrorMessage="Maximum price must be between &#8377;1 and &#8377;50,000." 
                    CssClass="validation-error" 
                    Display="Dynamic" 
                    ValidationGroup="RateUpdateGroup" />
            </div>
        </div>

        <%-- 
            VALIDATOR 5 OF 6: CustomValidator
            Server-side custom validation enforcing agricultural business rules:
            Minimum Price <= Average Price AND Average Price <= Maximum Price
        --%>
        <asp:CustomValidator 
            ID="cvPriceHierarchy" 
            runat="server" 
            OnServerValidate="cvPriceHierarchy_ServerValidate" 
            ErrorMessage="Business rule violation: Minimum price must not exceed Average price, and Average price must not exceed Maximum price." 
            CssClass="validation-error" 
            Display="Dynamic" 
            ValidationGroup="RateUpdateGroup" />

        <%-- Circular Green Checkmark Submit Button --%>
        <div style="display: flex; justify-content: flex-end; margin-top: 16px;">
            <asp:LinkButton 
                ID="btnSubmitPriceUpdate" 
                runat="server" 
                CssClass="admin-floating-check-btn" 
                ValidationGroup="RateUpdateGroup" 
                OnClick="btnSubmitPriceUpdate_Click" 
                ToolTip="Save Price Update">
                <svg width="22" height="22" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="3" stroke-linecap="round" stroke-linejoin="round" style="vertical-align: middle;"><polyline points="20 6 9 17 4 12"></polyline></svg>
            </asp:LinkButton>
        </div>
    </div>
</asp:Content>

