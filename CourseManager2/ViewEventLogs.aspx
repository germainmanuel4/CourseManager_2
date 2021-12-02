
<%@ Page Title="Admin (View Event Logs)" Language="VB" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ViewEventLogs.aspx.vb" Inherits="Assignment2_Applications_Development._ViewEventLogs" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    
   

    
    <p>
        <br />
    </p>
    <p>
    </p>
    <p style="font-size: x-large">
        Event Logs</p>
    <p>
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource1">
            <Columns>
                <asp:BoundField DataField="event_name" HeaderText="event_name" SortExpression="event_name" />
                <asp:BoundField DataField="event_description" HeaderText="event_description" SortExpression="event_description" />
                <asp:BoundField DataField="event_time" HeaderText="event_time" SortExpression="event_time" />
            </Columns>
        </asp:GridView>
    </p>
    <p>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString2 %>" SelectCommand="SELECT [event_name], [event_description], [event_time] FROM [LoggingEvents]"></asp:SqlDataSource>
    </p>
    <p>
        <asp:Button ID="Button1" runat="server" Text="Log out" />
    </p>
    <p>
    </p>
    
   

    
</asp:Content>