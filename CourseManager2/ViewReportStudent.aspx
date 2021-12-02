
<%@ Page Title="View Report" Language="VB" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ViewReportStudent.aspx.vb" Inherits="Assignment2_Applications_Development._ViewReportStudent" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <p>
        &nbsp;</p>
    <h3>
        View Report</h3>
    <p>
        &nbsp;</p>
    <p>
        <asp:HyperLink ID="HyperLink4" runat="server" NavigateUrl="~/ResultManagerHome.aspx">RESULT MANAGER HOME</asp:HyperLink>
    </p>
    <p>
        &nbsp;</p>
    <p>
        &nbsp;</p>
    <p>
        &nbsp;</p>
    <p>
        <asp:GridView ID="GridView2" runat="server" AutoGenerateColumns="False" DataKeyNames="student_id" DataSourceID="SqlDataSource5">
            <Columns>
                <asp:BoundField DataField="student_id" HeaderText="student_id" ReadOnly="True" SortExpression="student_id" />
                <asp:BoundField DataField="firstname" HeaderText="firstname" SortExpression="firstname" />
                <asp:BoundField DataField="lastname" HeaderText="lastname" SortExpression="lastname" />
            </Columns>
        </asp:GridView>
    </p>
    <p>
        <asp:SqlDataSource ID="SqlDataSource5" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString2 %>" SelectCommand="SELECT [student_id], [firstname], [lastname] FROM [Students]"></asp:SqlDataSource>
    </p>
    <p>
        &nbsp;</p>
    <p>
        <strong>Search by Student ID</strong></p>
    <p>
        <asp:Button ID="SearchButton" runat="server" Text="Search  Student ID" Width="187px" />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:TextBox ID="SearchBox" runat="server"></asp:TextBox>
    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    </p>
    <p>
        &nbsp;</p>
    <p>
        &nbsp;&nbsp; Student ID&nbsp; :&nbsp;
        <asp:Label ID="Label1" runat="server" style="font-size: large" Text="Label" Visible="False"></asp:Label>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Results :&nbsp;
        <asp:Label ID="Label2" runat="server" style="font-size: large" Text="Label" Visible="False"></asp:Label>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Course Average :&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:Label ID="Label3" runat="server" style="font-size: large" Text="Label" Visible="False"></asp:Label>
    </p>
    <p>
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="unitcode,student_id,year,semester" DataSourceID="SqlDataSource4" Height="142px" Width="1292px">
            <Columns>
                <asp:BoundField DataField="unitcode" HeaderText="unitcode" ReadOnly="True" SortExpression="unitcode" />
                <asp:BoundField DataField="student_id" HeaderText="student_id" ReadOnly="True" SortExpression="student_id" />
                <asp:BoundField DataField="assignment_1" HeaderText="assignment_1" SortExpression="assignment_1" />
                <asp:BoundField DataField="assignment_2" HeaderText="assignment_2" SortExpression="assignment_2" />
                <asp:BoundField DataField="exam" HeaderText="exam" SortExpression="exam" />
                <asp:BoundField DataField="year" HeaderText="year" ReadOnly="True" SortExpression="year" />
                <asp:BoundField DataField="semester" HeaderText="semester" ReadOnly="True" SortExpression="semester" />
                <asp:TemplateField HeaderText="Unit score"></asp:TemplateField>
                <asp:TemplateField HeaderText="Grade"></asp:TemplateField>
            </Columns>
        </asp:GridView>
    </p>
    <p>
        <asp:SqlDataSource ID="SqlDataSource4" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString2 %>" SelectCommand="SELECT [unitcode], [student_id], [assignment_1], [assignment_2], [exam], [year], [semester] FROM [Results] WHERE ([student_id] = @student_id)">
            <SelectParameters>
                <asp:ControlParameter ControlID="SearchBox" Name="student_id" PropertyName="Text" Type="Int32" />
            </SelectParameters>
        </asp:SqlDataSource>
    </p>
    <p>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </p>
    <p>
        <asp:Button ID="Button1" runat="server" Height="44px" Text="Log out" />
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
        &nbsp;</p>
    <p>
        &nbsp;</p>
    <p>
        &nbsp;</p>
    <p>
        &nbsp;&nbsp;</p>

   

    
</asp:Content>
