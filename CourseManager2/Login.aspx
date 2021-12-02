<%@ Page Title="Login " Language="VB" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Login.aspx.vb" Inherits="Assignment2_Applications_Development._Login" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <p>
        &nbsp;</p>
    <p>&nbsp;</p>
    <p style="font-size: x-large">Log In</p>
    <p>&nbsp;</p>
    <p>Username</p>
    <p>
        <asp:TextBox ID="TextBoxUsername" runat="server" BackColor="#FFFFCC" ForeColor="Black"></asp:TextBox>
    </p>
    <p>
        &nbsp;</p>
    <p>
        Password</p>
    <p>
        <asp:TextBox ID="TextBoxPassword" runat="server" BackColor="#FFFFCC" ForeColor="Black"></asp:TextBox>
    </p>
    <p>
        &nbsp;</p>
    <p>
        <asp:Button ID="ButtonTry" runat="server" Text="Log In" />
    </p>
    <p>
        &nbsp;</p>
    <p>
        &nbsp;</p>
    <p>
        &nbsp;&nbsp;</p>

   

    
</asp:Content>