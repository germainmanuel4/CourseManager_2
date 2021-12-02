
<%@ Page Title="Admin (Add Delete Unit)" Language="VB" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="AddDeleteUnit.aspx.vb" Inherits="Assignment2_Applications_Development._AddDeleteUnit" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <p>
        &nbsp;</p>
    <p style="font-size: x-large">
        <strong>Admin (Add / Delete)</strong></p>
    <p>
        &nbsp;</p>
    <p>
        <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="~/AdminHome.aspx">BACK TO ADMIN HOME</asp:HyperLink>
    </p>
    <p>
        <asp:HyperLink ID="HyperLink2" runat="server" NavigateUrl="~/EditDeleteUnit.aspx">EDIT / DELETE UNIT</asp:HyperLink>
    </p>
    <p>
        <asp:HyperLink ID="HyperLink3" runat="server" NavigateUrl="~/ViewEventLogs.aspx">View Event Logs</asp:HyperLink>
    </p>
    <p>
        &nbsp;</p>
    <p><strong>LIST OF UNITS THAT CANNOT BE ADDED AGAIN / DELETE</strong></p>
    <p>
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="unitcode" DataSourceID="SqlDataSource1">
            <Columns>
               
                
                
                 <asp:TemplateField ShowHeader="False">


                    <ItemTemplate>
                        <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="False" CommandName="Delete" Text="Delete" OnClientClick="return confirm('Are you sure you want to delete this unit?');" ></asp:LinkButton>
                    </ItemTemplate>



                </asp:TemplateField>





                <asp:BoundField DataField="unitcode" HeaderText="unitcode" ReadOnly="True" SortExpression="unitcode" />
                <asp:BoundField DataField="unit_name" HeaderText="unit_name" SortExpression="unit_name" />
                <asp:BoundField DataField="unit_outline" HeaderText="unit_outline" SortExpression="unit_outline" />
                <asp:BoundField DataField="unit_coordinator" HeaderText="unit_coordinator" SortExpression="unit_coordinator" />
            </Columns>
        </asp:GridView>
    </p>
    <p style="font-size: small">
        <em>Note: unit outline document can be viewed in view reports for Result Manager</em></p>
    <p>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConflictDetection="CompareAllValues" ConnectionString="<%$ ConnectionStrings:ConnectionString2 %>" DeleteCommand="DELETE FROM [Units] WHERE [unitcode] = @original_unitcode" InsertCommand="INSERT INTO [Units] ([unitcode], [unit_name], [unit_outline], [unit_coordinator]) VALUES (@unitcode, @unit_name, @unit_outline, @unit_coordinator)" OldValuesParameterFormatString="original_{0}" SelectCommand="SELECT * FROM [Units]" UpdateCommand="UPDATE [Units] SET [unit_name] = @unit_name, [unit_outline] = @unit_outline, [unit_coordinator] = @unit_coordinator WHERE [unitcode] = @original_unitcode AND [unit_name] = @original_unit_name AND (([unit_outline] = @original_unit_outline) OR ([unit_outline] IS NULL AND @original_unit_outline IS NULL)) AND (([unit_coordinator] = @original_unit_coordinator) OR ([unit_coordinator] IS NULL AND @original_unit_coordinator IS NULL))">
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
        <strong>ADD UNIT</strong></p>
    <p>
        Unit Code&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:TextBox ID="AddUnitCode" runat="server" BackColor="#FFFFCC"></asp:TextBox>
    &nbsp;<em><span style="font-size: small">*Mandatory</span></em></p>
    <p>
        Unit Name&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:TextBox ID="AddUnitName" runat="server" BackColor="#FFFFCC"></asp:TextBox>
    &nbsp;<span style="font-size: small"><em>*</em></span><em><span style="font-size: small">Mandatory</span></em></p>
    <p>
        Unit Coordinator&nbsp; <asp:TextBox ID="AddUnitCoordinator" runat="server" BackColor="#FFFFCC"></asp:TextBox>
    </p>
    <p>
        Unit Outline&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;
        <asp:FileUpload ID="FileUpload1" runat="server" BorderColor="#FFFF66" />
    </p>
    <p>
        &nbsp;</p>
    <p>
        <asp:Button ID="AddButton" runat="server" Text="Add" />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:Button ID="Cancel" runat="server" Text="Cancel" />
    </p>
    <p>
        &nbsp;</p>
    <p>
        &nbsp;</p>
    <p>
        &nbsp;&nbsp;<strong><asp:Button ID="Button1" runat="server" Text="Log Out" />
        </strong></p>

   

    
</asp:Content>