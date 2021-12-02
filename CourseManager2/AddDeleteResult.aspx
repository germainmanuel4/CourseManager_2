<%@ Page Title="Result Manager" Language="VB" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="AddDeleteResult.aspx.vb" Inherits="Assignment2_Applications_Development._AddDeleteResult" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <p>
        &nbsp;</p>
    <h3>
        Manage Result (Add / Delete)</h3>
    <p>
        &nbsp;</p>
    <p>
        <asp:HyperLink ID="HyperLink2" runat="server" NavigateUrl="~/ResultManagerHome.aspx">BACK TO RESULT MANAGER HOME</asp:HyperLink>
    </p>
    <p>
        <asp:HyperLink ID="HyperLink3" runat="server" NavigateUrl="~/EditDeleteResult.aspx">EDIT / DELETE RESULT</asp:HyperLink>
    </p>
    <p>
        <asp:HyperLink ID="HyperLink5" runat="server" NavigateUrl="~/ViewReportStudent.aspx">VIEW STUDENTS REPORT</asp:HyperLink>
    </p>
    <p>
        <asp:HyperLink ID="HyperLink6" runat="server" NavigateUrl="~/ViewReportUnits.aspx">VIEW UNIT REPORTS</asp:HyperLink>
    </p>
    <p>
        <asp:HyperLink ID="HyperLink7" runat="server" NavigateUrl="~/ViewReportsByCombination.aspx">VIEW UNIT BY UNITCODE / SEM / YEAR</asp:HyperLink>
    </p>
    <p>
        &nbsp;</p>
    <p>
        &nbsp;</p>
    &nbsp;
    <b>
        LIST OF UNITS</b>
    <p>
        <asp:GridView ID="GridView3" runat="server" AutoGenerateColumns="False" DataKeyNames="unitcode" DataSourceID="SqlDataSource3">
            <Columns>
                <asp:BoundField DataField="unitcode" HeaderText="unitcode" ReadOnly="True" SortExpression="unitcode" />
                <asp:BoundField DataField="unit_name" HeaderText="unit_name" SortExpression="unit_name" />
                <asp:BoundField DataField="unit_outline" HeaderText="unit_outline" SortExpression="unit_outline" />
                <asp:BoundField DataField="unit_coordinator" HeaderText="unit_coordinator" SortExpression="unit_coordinator" />
            </Columns>
        </asp:GridView>
    </p>
    <p>
        <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString2 %>" SelectCommand="SELECT * FROM [Units]"></asp:SqlDataSource>
    </p>
    <p>
        &nbsp;</p>
    <b>
        LIST OF STUDENTS</b>
    <p>
        <asp:GridView ID="GridView4" runat="server" AutoGenerateColumns="False" DataKeyNames="student_id" DataSourceID="SqlDataSource4">
            <Columns>
                <asp:BoundField DataField="student_id" HeaderText="student_id" ReadOnly="True" SortExpression="student_id" />
                <asp:BoundField DataField="firstname" HeaderText="firstname" SortExpression="firstname" />
                <asp:BoundField DataField="lastname" HeaderText="lastname" SortExpression="lastname" />
            </Columns>
        </asp:GridView>
    </p>
    <p>
        <asp:SqlDataSource ID="SqlDataSource4" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString2 %>" OldValuesParameterFormatString="original_{0}" SelectCommand="SELECT [student_id], [firstname], [lastname] FROM [Students]"></asp:SqlDataSource>
    </p>
    <p>
        &nbsp;</p>
    <p>
        <strong>LIST OF RESULTS THAT CANNOT BE ADDED AGAIN / DELETE</strong></p>
    <p>
        <asp:GridView ID="GridView5" runat="server" DataSourceID="SqlDataSource5" Width="845px">
            <Columns>
                <asp:TemplateField ShowHeader="False">
                    <ItemTemplate>
                        <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="False" CommandName="Delete" Text="Delete" OnClientClick="return confirm('Are you sure you want to delete this Student Result?');" ></asp:LinkButton>
                    </ItemTemplate>
                </asp:TemplateField>
            </Columns>
        </asp:GridView>
    </p>
    <p style="font-size: small">
        &nbsp;</p>
    <p>
        &nbsp;</p>
    <h3>
        <strong>ADD RESULT</strong></h3>
    <p>
        &nbsp;Unit Code&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:TextBox ID="UnitCode" runat="server" BackColor="#FFFFCC"></asp:TextBox>
        &nbsp;&nbsp;*&nbsp;&nbsp; <em><span style="font-size: x-small">Mandatory Field</span></em></p>
    <p>
        &nbsp;Student ID&nbsp;&nbsp;&nbsp; &nbsp; <asp:TextBox ID="StudentID" runat="server" BackColor="#FFFFCC"></asp:TextBox>
        &nbsp;&nbsp;*&nbsp;&nbsp; <em><span style="font-size: x-small">Mandatory Field</span></em></p>
    <p>
        Year&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <asp:TextBox ID="yearOfStudy" runat="server" Width="72px" BackColor="#FFFFCC"></asp:TextBox>
    &nbsp;&nbsp;*&nbsp;&nbsp; <em><span style="font-size: x-small">Mandatory Field</span></em></p>
    <p>
        Semester&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <asp:TextBox ID="Semester" runat="server" Width="47px" BackColor="#FFFFCC"></asp:TextBox>
    &nbsp;&nbsp;*&nbsp;&nbsp; <em><span style="font-size: x-small">Mandatory Field</span></em></p>
    <p>
        Assignmet 1&nbsp;&nbsp; &nbsp;<asp:TextBox ID="Assignment1" runat="server" Width="48px" BackColor="#FFFFCC"></asp:TextBox>
    &nbsp;</p>
    <p>
        &nbsp;Assignment 2&nbsp;<asp:TextBox ID="Assignment2" runat="server" Width="39px" BackColor="#FFFFCC"></asp:TextBox>
    </p>
    <p>
        &nbsp;Exam&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp; <asp:TextBox ID="Exam" runat="server" Width="41px" BackColor="#FFFFCC"></asp:TextBox>
    </p>
    <p style="font-size: small">
        <em>Note: if&nbsp; a result has the same unitcode, student-id, year&nbsp; and semester they cannot be added again unless deleted first.</em></p>
    <p style="font-size: small">
        See above list for results not available to add</p>
    <asp:SqlDataSource ID="SqlDataSource5" runat="server" ConflictDetection="CompareAllValues" ConnectionString="<%$ ConnectionStrings:ConnectionString2 %>" DeleteCommand="DELETE FROM [Results] WHERE [unitcode] = @original_unitcode AND [student_id] = @original_student_id AND [year] = @original_year AND [semester] = @original_semester AND (([assignment_1] = @original_assignment_1) OR ([assignment_1] IS NULL AND @original_assignment_1 IS NULL)) AND (([assignment_2] = @original_assignment_2) OR ([assignment_2] IS NULL AND @original_assignment_2 IS NULL)) AND (([exam] = @original_exam) OR ([exam] IS NULL AND @original_exam IS NULL))" InsertCommand="INSERT INTO [Results] ([unitcode], [student_id], [assignment_1], [assignment_2], [exam], [year], [semester]) VALUES (@unitcode, @student_id, @assignment_1, @assignment_2, @exam, @year, @semester)" OldValuesParameterFormatString="original_{0}" SelectCommand="SELECT * FROM [Results]" UpdateCommand="UPDATE [Results] SET [assignment_1] = @assignment_1, [assignment_2] = @assignment_2, [exam] = @exam WHERE [unitcode] = @original_unitcode AND [student_id] = @original_student_id AND [year] = @original_year AND [semester] = @original_semester AND (([assignment_1] = @original_assignment_1) OR ([assignment_1] IS NULL AND @original_assignment_1 IS NULL)) AND (([assignment_2] = @original_assignment_2) OR ([assignment_2] IS NULL AND @original_assignment_2 IS NULL)) AND (([exam] = @original_exam) OR ([exam] IS NULL AND @original_exam IS NULL))">
            <DeleteParameters>
                <asp:Parameter Name="original_unitcode" Type="String" />
                <asp:Parameter Name="original_student_id" Type="Int32" />
                <asp:Parameter Name="original_year" Type="Int32" />
                <asp:Parameter Name="original_semester" Type="Int32" />
                <asp:Parameter Name="original_assignment_1" Type="Int32" />
                <asp:Parameter Name="original_assignment_2" Type="Int32" />
                <asp:Parameter Name="original_exam" Type="Int32" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="unitcode" Type="String" />
                <asp:Parameter Name="student_id" Type="Int32" />
                <asp:Parameter Name="assignment_1" Type="Int32" />
                <asp:Parameter Name="assignment_2" Type="Int32" />
                <asp:Parameter Name="exam" Type="Int32" />
                <asp:Parameter Name="year" Type="Int32" />
                <asp:Parameter Name="semester" Type="Int32" />
            </InsertParameters>
            <UpdateParameters>
                <asp:Parameter Name="assignment_1" Type="Int32" />
                <asp:Parameter Name="assignment_2" Type="Int32" />
                <asp:Parameter Name="exam" Type="Int32" />
                <asp:Parameter Name="original_unitcode" Type="String" />
                <asp:Parameter Name="original_student_id" Type="Int32" />
                <asp:Parameter Name="original_year" Type="Int32" />
                <asp:Parameter Name="original_semester" Type="Int32" />
                <asp:Parameter Name="original_assignment_1" Type="Int32" />
                <asp:Parameter Name="original_assignment_2" Type="Int32" />
                <asp:Parameter Name="original_exam" Type="Int32" />
            </UpdateParameters>
        </asp:SqlDataSource>
    <p>
        <asp:Button ID="AddButton" runat="server" Text="Add" />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:Button ID="CancelButton" runat="server" Text="Cancel" />
    </p>
    <p>
        &nbsp;</p>
    <p>
        &nbsp;</p>
    <p>
        &nbsp;</p>
    <p>
        <asp:Button ID="Button1" runat="server" Text="Log out" />
    </p>
    <p>
        &nbsp;</p>
    <p>
        &nbsp;</p>
    <p>&nbsp;</p>

   

    
</asp:Content>