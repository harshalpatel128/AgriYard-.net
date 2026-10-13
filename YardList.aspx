<%@ Page Title="Marketing Yards" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="YardList.aspx.cs" Inherits="AgriYard.YardList" %>

<asp:Content ID="HeadContent1" ContentPlaceHolderID="HeadContent" runat="server">
    <link rel="stylesheet" href="~/Content/dashboard.css" />
    <link rel="stylesheet" href="~/Content/market.css" />
</asp:Content>

<asp:Content ID="MainContent1" ContentPlaceHolderID="MainContent" runat="server">
    <div class="content-container">
        <div class="market-page-header">
            <div class="market-title-group">
                <h1 style="color: #1b5e20;">Major APMC Marketing Yards</h1>
                <p class="market-subtitle">Premier agricultural commodity auction yards across Saurashtra &amp; Gujarat</p>
            </div>
        </div>

        <div class="yards-grid" style="grid-template-columns: repeat(2, 1fr); gap: 24px;">
            <asp:Repeater ID="rptAllYards" runat="server">
                <ItemTemplate>
                    <div class="yard-card" style="padding-bottom: 16px;">
                        <img src='<%# ResolveUrl(Eval("ImageUrl").ToString()) %>' alt='<%# Eval("YardName") %>' class="yard-card-image" style="height: 180px;" />
                        <div class="yard-card-body">
                            <h3 class="yard-card-title" style="font-size: 18px;"><%# Eval("YardName") %></h3>
                            <p class="yard-card-location" style="margin-bottom: 12px;"><%# Eval("Address") %></p>
                            <p style="font-size: 13px; color: #5c6f5c; margin-bottom: 16px;">
                                <strong>Contact:</strong> <%# Eval("ContactNumber") %> | <strong>Shops:</strong> <%# Eval("TotalShops") %> | <strong>Est:</strong> <%# Eval("EstablishedYear") %>
                            </p>
                            <a href='<%# ResolveUrl("~/YardDetails.aspx?id=" + Eval("YardId")) %>' class="btn btn-primary" style="padding: 8px 18px; font-size: 13.5px;">
                                View Yard Details &rarr;
                            </a>
                        </div>
                    </div>
                </ItemTemplate>
            </asp:Repeater>
        </div>
    </div>
</asp:Content>

