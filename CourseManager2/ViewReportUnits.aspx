
<%@ Page Title="View Report" Language="VB" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ViewReportUnits.aspx.vb" Inherits="Assignment2_Applications_Development._ViewReportUnits" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <p>
        &nbsp;</p>
    <h3>
        View Report Units </h3>
    <p>
        &nbsp;</p>
    <p>
        <asp:HyperLink ID="HyperLink5" runat="server" NavigateUrl="~/ResultManagerHome.aspx">RESULT MANAGER HOME</asp:HyperLink>
    </p>
    <p>
        &nbsp;</p>
    <p>
        &nbsp;</p>
    <p>
        &nbsp;</p>
    <p>
        <strong>LIST OF UNITS </strong></p>
    <p>
        <asp:GridView ID="GridView2" runat="server" AutoGenerateColumns="False" DataKeyNames="unitcode" DataSourceID="SqlDataSource2">
            <Columns>
                <asp:BoundField DataField="unitcode" HeaderText="unitcode" ReadOnly="True" SortExpression="unitcode" />
                <asp:BoundField DataField="unit_name" HeaderText="unit_name" SortExpression="unit_name" />
                <asp:BoundField DataField="unit_outline" HeaderText="unit_outline" SortExpression="unit_outline" />
                <asp:BoundField DataField="unit_coordinator" HeaderText="unit_coordinator" SortExpression="unit_coordinator" />
                <asp:TemplateField>
                    <ItemTemplate>
                        <asp:HyperLink ID="HyperLink6" runat="server" NavigateUrl='<%# Eval("unit_outline") %>' Text='<%# Eval("unit_outline") %>'></asp:HyperLink>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField></asp:TemplateField>
            </Columns>
        </asp:GridView>
    </p>
    <p>
        <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString2 %>" SelectCommand="SELECT [unitcode], [unit_name], [unit_outline], [unit_coordinator] FROM [Units]"></asp:SqlDataSource>
    </p>
    <p>
        &nbsp;</p>
    <p>
        &nbsp;&nbsp;<asp:Button ID="Button1" runat="server" Text="Search by Unit" />
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:TextBox ID="SearchBox" runat="server"></asp:TextBox>
    </p>
    <p>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString2 %>" SelectCommand="SELECT * FROM [Results] WHERE ([unitcode] = @unitcode)">
            <SelectParameters>
                <asp:ControlParameter ControlID="SearchBox" Name="unitcode" PropertyName="Text" Type="String" />
            </SelectParameters>
        </asp:SqlDataSource>
    </p>
    <p>
        &nbsp;</p>
    <p>
        &nbsp;</p>
    <p>
        Unit Code: <asp:Label ID="Label1" runat="server" Text="Label" Visible="False"></asp:Label>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Results:&nbsp;
        <asp:Label ID="Label2" runat="server" Text="Label" Visible="False"></asp:Label>
&nbsp;&nbsp;&nbsp;&nbsp; Unit Average:
        <asp:Label ID="Label3" runat="server" Text="Label" Visible="False"></asp:Label>
    </p>
    <p>
        &nbsp;</p>
    <p>
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="unitcode,student_id,year,semester" DataSourceID="SqlDataSource1">
            <Columns>
                <asp:BoundField DataField="unitcode" HeaderText="unitcode" ReadOnly="True" SortExpression="unitcode" />
                <asp:BoundField DataField="student_id" HeaderText="student_id" ReadOnly="True" SortExpression="student_id" />
                <asp:BoundField DataField="assignment_1" HeaderText="assignment_1" SortExpression="assignment_1" />
                <asp:BoundField DataField="assignment_2" HeaderText="assignment_2" SortExpression="assignment_2" />
                <asp:BoundField DataField="exam" HeaderText="exam" SortExpression="exam" />
                <asp:BoundField DataField="year" HeaderText="year" ReadOnly="True" SortExpression="year" />
                <asp:BoundField DataField="semester" HeaderText="semester" ReadOnly="True" SortExpression="semester" />
                <asp:TemplateField HeaderText="Unit Score"></asp:TemplateField>
                <asp:TemplateField HeaderText="Grade"></asp:TemplateField>
            </Columns>
        </asp:GridView>
    </p>
    <p>
        &nbsp;</p>
    <p>
        &nbsp;</p>
    <p>
        <asp:Button ID="Button2" runat="server" Text="Log out" />
    </p>
    <p>
        &nbsp;</p>
    <p>
        &nbsp;</p>
    <p>
        &nbsp;</p>
    <p>
        &nbsp;</p>
    <p>
        &nbsp;</p>
    <p>
        &nbsp;</p>
    <p>
        &nbsp;</p>
    <p>
        &nbsp;</p>
    <p>
        &nbsp;</p>
    <p>
        &nbsp;</p>
    <p>
        &nbsp;</p>
    <p>
        &nbsp;</p>
    <p>
        &nbsp;</p>
    <p>
        &nbsp;</p>
    <p>
        &nbsp;</p>
    <p>
        &nbsp;</p>
    <p>
        &nbsp;</p>
    <p>
        &nbsp;</p>
    <p>
        &nbsp;</p>
    <p>
        &nbsp;</p>
    <p>
        &nbsp;&nbsp;</p>

   

    
</asp:Content>
