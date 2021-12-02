<%@ Page Title="Admin (Update Unit)" Language="VB" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="EditUnitAdmin.aspx.vb" Inherits="Assignment2_Applications_Development._EditUnitAdmin" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    


    <p>
        &nbsp;&nbsp;
        <br />
    </p>
    <p>
        Edit Unit</p>
    <p>
        &nbsp;</p>
    <p>
        <asp:HyperLink ID="BackAdd" runat="server" NavigateUrl="~/AddUnitsAdmin.aspx">Back to Add Units</asp:HyperLink>
    </p>
    <p>
        <asp:GridView ID="GridView1" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" DataKeyNames="unitcode" DataSourceID="SqlDataSource1">
            <Columns>
                <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" />
                <asp:BoundField DataField="unitcode" HeaderText="unitcode" ReadOnly="True" SortExpression="unitcode" />
                <asp:BoundField DataField="unit_name" HeaderText="unit_name" SortExpression="unit_name" />
                <asp:BoundField DataField="unit_outline" HeaderText="unit_outline" SortExpression="unit_outline" />
                <asp:BoundField DataField="unit_coordinator" HeaderText="unit_coordinator" SortExpression="unit_coordinator" />
            </Columns>
        </asp:GridView>
    </p>
    <p>
        <asp:FormView ID="FormView1" runat="server" DataKeyNames="unitcode" DataSourceID="SqlDataSource1">
            <EditItemTemplate>
                unitcode:
                <asp:Label ID="unitcodeLabel1" runat="server" Text='<%# Eval("unitcode") %>' />
                <br />
                unit_name:
                <asp:TextBox ID="unit_nameTextBox" runat="server" Text='<%# Bind("unit_name") %>' />
                <br />
                unit_outline:
                <asp:TextBox ID="unit_outlineTextBox" runat="server" Text='<%# Bind("unit_outline") %>' />
                <br />
                unit_coordinator:
                <asp:TextBox ID="unit_coordinatorTextBox" runat="server" Text='<%# Bind("unit_coordinator") %>' />
                <br />
                <asp:LinkButton ID="UpdateButton" runat="server" CausesValidation="True" CommandName="Update" Text="Update" />
                &nbsp;<asp:LinkButton ID="UpdateCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel" />
            </EditItemTemplate>
            <InsertItemTemplate>
                unitcode:
                <asp:TextBox ID="unitcodeTextBox" runat="server" Text='<%# Bind("unitcode") %>' />
                <br />
                unit_name:
                <asp:TextBox ID="unit_nameTextBox" runat="server" Text='<%# Bind("unit_name") %>' />
                <br />
                unit_outline:
                <asp:TextBox ID="unit_outlineTextBox" runat="server" Text='<%# Bind("unit_outline") %>' />
                <br />
                unit_coordinator:
                <asp:TextBox ID="unit_coordinatorTextBox" runat="server" Text='<%# Bind("unit_coordinator") %>' />
                <br />
                <asp:LinkButton ID="InsertButton" runat="server" CausesValidation="True" CommandName="Insert" Text="Insert" />
                &nbsp;<asp:LinkButton ID="InsertCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel" />
            </InsertItemTemplate>
            <ItemTemplate>
                unitcode:
                <asp:Label ID="unitcodeLabel" runat="server" Text='<%# Eval("unitcode") %>' />
                <br />
                unit_name:
                <asp:Label ID="unit_nameLabel" runat="server" Text='<%# Bind("unit_name") %>' />
                <br />
                unit_outline:
                <asp:Label ID="unit_outlineLabel" runat="server" Text='<%# Bind("unit_outline") %>' />
                <br />
                unit_coordinator:
                <asp:Label ID="unit_coordinatorLabel" runat="server" Text='<%# Bind("unit_coordinator") %>' />
                <br />
                <asp:LinkButton ID="EditButton" runat="server" CausesValidation="False" CommandName="Edit" Text="Edit" />
                &nbsp;<asp:LinkButton ID="DeleteButton" runat="server" CausesValidation="False" CommandName="Delete" Text="Delete" />
                &nbsp;<asp:LinkButton ID="NewButton" runat="server" CausesValidation="False" CommandName="New" Text="New" />
            </ItemTemplate>
        </asp:FormView>
    </p>
    <p>
        &nbsp;</p>
    <p>
        <asp:FormView ID="FormView2" runat="server">
        </asp:FormView>
    </p>
    <p>
        &nbsp;</p>
    <p>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConflictDetection="CompareAllValues" ConnectionString="<%$ ConnectionStrings:ConnectionString2 %>" DeleteCommand="DELETE FROM [Units] WHERE [unitcode] = @original_unitcode AND [unit_name] = @original_unit_name AND (([unit_outline] = @original_unit_outline) OR ([unit_outline] IS NULL AND @original_unit_outline IS NULL)) AND (([unit_coordinator] = @original_unit_coordinator) OR ([unit_coordinator] IS NULL AND @original_unit_coordinator IS NULL))" InsertCommand="INSERT INTO [Units] ([unitcode], [unit_name], [unit_outline], [unit_coordinator]) VALUES (@unitcode, @unit_name, @unit_outline, @unit_coordinator)" OldValuesParameterFormatString="original_{0}" SelectCommand="SELECT [unitcode], [unit_name], [unit_outline], [unit_coordinator] FROM [Units]" UpdateCommand="UPDATE [Units] SET [unit_name] = @unit_name, [unit_outline] = @unit_outline, [unit_coordinator] = @unit_coordinator WHERE [unitcode] = @original_unitcode AND [unit_name] = @original_unit_name AND (([unit_outline] = @original_unit_outline) OR ([unit_outline] IS NULL AND @original_unit_outline IS NULL)) AND (([unit_coordinator] = @original_unit_coordinator) OR ([unit_coordinator] IS NULL AND @original_unit_coordinator IS NULL))">
            <DeleteParameters>
                <asp:Parameter Name="original_unitcode" Type="String" />
                <asp:Parameter Name="original_unit_name" Type="String" />
                <asp:Parameter Name="original_unit_outline" Type="String" />
                <asp:Parameter Name="original_unit_coordinator" Type="String" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="unitcode" Type="String" />
                <asp:Parameter Name="unit_name" Type="String" />
                <asp:Parameter Name="unit_outline" Type="String" />
                <asp:Parameter Name="unit_coordinator" Type="String" />
            </InsertParameters>
            <UpdateParameters>
                <asp:Parameter Name="unit_name" Type="String" />
                <asp:Parameter Name="unit_outline" Type="String" />
                <asp:Parameter Name="unit_coordinator" Type="String" />
                <asp:Parameter Name="original_unitcode" Type="String" />
                <asp:Parameter Name="original_unit_name" Type="String" />
                <asp:Parameter Name="original_unit_outline" Type="String" />
                <asp:Parameter Name="original_unit_coordinator" Type="String" />
            </UpdateParameters>
        </asp:SqlDataSource>
    </p>
    <p>
        &nbsp;</p>
    <p>
        <asp:Button ID="Button1" runat="server" Text="Log Out" />
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
    </p>
    <p>
    </p>
    <p>
    </p>
    <p>
    </p>
    



   

    
</asp:Content>
