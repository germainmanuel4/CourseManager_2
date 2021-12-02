<%@ Page Title="Result Manager" Language="VB" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="EditDeleteResult.aspx.vb" Inherits="Assignment2_Applications_Development._EditDeleteResult" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <p>
        &nbsp;</p>
    <h3>
        Manage Result (Edit / Delete)</h3>
    <p>
        &nbsp;</p>
    <p>
        <asp:HyperLink ID="HyperLink2" runat="server" NavigateUrl="~/ResultManagerHome.aspx">BACK TO RESULT MANAGER HOME</asp:HyperLink>
    </p>
    <p>
        <asp:HyperLink ID="HyperLink3" runat="server" NavigateUrl="~/AddDeleteResult.aspx">ADD / DELETE RESULT</asp:HyperLink>
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
        <strong>LIST OF RESULTS AVAILABLE FOR EDITING / DELETE</strong></p>
    <p>
        <asp:GridView ID="GridView5" runat="server" AutoGenerateColumns="False" DataKeyNames="unitcode,student_id,year,semester" DataSourceID="SqlDataSource5" Width="1203px">
            <Columns>
                <asp:TemplateField ShowHeader="False">
                    <ItemTemplate>
                        <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="False" CommandName="Delete" Text="Delete" OnClientClick="return confirm('Are you sure you want to delete this result?');" ></asp:LinkButton>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:BoundField DataField="unitcode" HeaderText="unitcode" ReadOnly="True" SortExpression="unitcode" />
                <asp:BoundField DataField="student_id" HeaderText="student_id" ReadOnly="True" SortExpression="student_id" />
                <asp:BoundField DataField="assignment_1" HeaderText="assignment_1" SortExpression="assignment_1" />
                <asp:BoundField DataField="assignment_2" HeaderText="assignment_2" SortExpression="assignment_2" />
                <asp:BoundField DataField="exam" HeaderText="exam" SortExpression="exam" />
                <asp:BoundField DataField="year" HeaderText="year" ReadOnly="True" SortExpression="year" />
                <asp:BoundField DataField="semester" HeaderText="semester" ReadOnly="True" SortExpression="semester" />
            </Columns>
        </asp:GridView>
    </p>
    <p>
        &nbsp;</p>
    <p>
        &nbsp;</p>
    <h3>
        <strong>EDIT RESULT</strong></h3>
    <p>
        &nbsp;Unit Code&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:TextBox ID="UnitCodeEdit" runat="server" BackColor="#FFFFCC"></asp:TextBox>
    &nbsp; *&nbsp; <em>&nbsp;<span style="font-size: x-small">Mandatory Field</span></em></p>
    <p>
        &nbsp;Student ID&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;<asp:TextBox ID="StudentIDEdit" runat="server" BackColor="#FFFFCC"></asp:TextBox>
    &nbsp;*&nbsp;&nbsp; <em><span style="font-size: x-small">Mandatory Field</span></em></p>
    <p>
        Year&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:TextBox ID="yearOfStudy" runat="server" Width="128px" BackColor="#FFFFCC"></asp:TextBox>
    &nbsp;*&nbsp; <em><span style="font-size: x-small">Mandatory Field</span></em></p>
    <p>
        &nbsp;Semester&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp; <asp:TextBox ID="SemEdit" runat="server" Width="61px" BackColor="#FFFFCC"></asp:TextBox>
    &nbsp;*&nbsp;&nbsp; <em><span style="font-size: x-small">Mandatory Field</span></em></p>
    <p>
        &nbsp;Assignment 1&nbsp;
        <asp:TextBox ID="Assignment1Edit" runat="server" Width="43px" BackColor="#FFFFCC"></asp:TextBox>
    </p>
    <p>
        Assignment 2&nbsp;&nbsp;&nbsp;
        <asp:TextBox ID="Assignment2Edit" runat="server" Width="39px" BackColor="#FFFFCC"></asp:TextBox>
    </p>
    <p>
        Exam&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:TextBox ID="ExamEdit" runat="server" Width="38px" BackColor="#FFFFCC"></asp:TextBox>
    </p>
    <p style="font-size: small">
        <em>View result list above and input the 4 mandatory keys, View available results to see what to update</em></p>
    <p>
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
    </p>
    <p>
        <asp:Button ID="EditButton" runat="server" Text="Edit" />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:Button ID="CancelButton" runat="server" Text="Cancel" />
    </p>
    <p>
        &nbsp;</p>
    <p>
        &nbsp;</p>
    <p>
        <asp:Button ID="Button1" runat="server" Height="42px" Text="Log out" />
    </p>
    <p>
    </p>
    <p>
        &nbsp;</p>
    <p>&nbsp;</p>

   

    
</asp:Content>