<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Login.aspx.cs" Inherits="Login" %>


<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

    <asp:SqlDataSource ID="EmailSqlDataSource" runat="server" 
        ConnectionString="<%$ ConnectionStrings:Final Project DataBaseConnectionString %>" 
        ProviderName="<%$ ConnectionStrings:Final Project DataBaseConnectionString.ProviderName %>" 
        SelectCommand="SELECT [E_Mail] FROM [Members] ORDER BY [E_Mail]">
    </asp:SqlDataSource>
    <table runat="server" align = "center">
    <tr>
    <td>
    
    </td>
    </tr>
    <tr>
    <td>
    <asp:Label ID="loginLable" runat ="server" Text="<center><b>Log In!</b></center>" 
            ForeColor="White"></asp:Label>
    </td>
    </tr>
    <tr>
    <td>
    <asp:DropDownList ID="Email_DropDownList1" runat="server" 
        DataSourceID="EmailSqlDataSource" DataTextField="E_Mail" 
        DataValueField="E_Mail">
    </asp:DropDownList>
    </td>
    </tr>
     <tr>
    <td>
    
    </td>
    </tr>
     <tr>
    <td>
    
    </td>
    </tr>
     <tr>
    <td>
        <center>        
        <asp:Button ID="LogInButton" runat="server" Height="28px" 
            onclick="LogInButton_Click" Text="Submit" Width="89px" />
        </center>
    </td>
    </tr>
    </table>
</asp:Content>
<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">

</asp:Content>

