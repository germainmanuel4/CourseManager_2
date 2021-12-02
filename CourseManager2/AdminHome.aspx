<%@ Page Title="" Language="VB" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="AdminHome.aspx.vb" Inherits="Assignment2_Applications_Development._AdminHome" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <h2>&nbsp;</h2>
    <h2 style="font-size: x-large">Admin Home </h2>
    <p>&nbsp;</p>
    <p>
        <asp:HyperLink ID="HyperLink4" runat="server" NavigateUrl="~/AddDeleteUnit.aspx">ADD / DELETE UNIT</asp:HyperLink>
    </p>
    <p>
        <asp:HyperLink ID="HyperLink5" runat="server" NavigateUrl="~/EditDeleteUnit.aspx">EDIT / DELETE UNIT</asp:HyperLink>
    </p>
    <p>
        <asp:HyperLink ID="HyperLink6" runat="server" NavigateUrl="~/ViewEventLogs.aspx">View Event Logs</asp:HyperLink>
    </p>
    <p>
        &nbsp;</p>
    <p>
        <asp:Button ID="Button1" runat="server" Text="Log out" />
    </p>
    <p>&nbsp;</p>
</asp:Content>
