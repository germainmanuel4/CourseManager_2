<%@ Page Title="" Language="VB" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ResultManagerHome.aspx.vb" Inherits="Assignment2_Applications_Development._ResultManagerHome" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <h2><%: Title %></h2>

     <p style="font-size: x-large">Result Manager Home </p>
     <p>&nbsp;</p>
    <p>
        <asp:HyperLink ID="HyperLink4" runat="server" NavigateUrl="~/AddDeleteResult.aspx">ADD / DELETE RESULT</asp:HyperLink>
    </p>
    <p>
        <asp:HyperLink ID="HyperLink5" runat="server" NavigateUrl="~/EditDeleteResult.aspx">EDIT / DELETE RESULT</asp:HyperLink>
    </p>
    <p>
        <asp:HyperLink ID="HyperLink9" runat="server" NavigateUrl="~/ViewEventLogs.aspx">VIEW EVENT LOGS</asp:HyperLink>
    </p>
    <p>
        &nbsp;</p>
    <p>
        <asp:HyperLink ID="HyperLink6" runat="server" NavigateUrl="~/ViewReportStudent.aspx">VIEW STUDENT REPORTS</asp:HyperLink>
    </p>
    <p>
        <asp:HyperLink ID="HyperLink7" runat="server" NavigateUrl="~/ViewReportUnits.aspx">VIEW UNITS REPORT</asp:HyperLink>
    </p>
    <p>
        <asp:HyperLink ID="HyperLink8" runat="server" NavigateUrl="~/ViewReportsByCombination.aspx">VIEW UNITS BY UNITCODE / SEM / YEAR</asp:HyperLink>
    </p>
    <p>
        &nbsp;</p>
    <p>
        <asp:Button ID="Button1" runat="server" Text="Log out" />
    </p>
    <p>&nbsp;</p>
</asp:Content>
