<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="MemberHome.aspx.cs" Inherits="MemberHome" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
   
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder2" Runat="Server">
    <asp:SqlDataSource ID="MemberSqlDataSource" runat="server" 
    ConnectionString="<%$ ConnectionStrings:MemberDataBaseConnectionString %>" 
    ProviderName="<%$ ConnectionStrings:MemberDataBaseConnectionString.ProviderName %>" 
    
        SelectCommand="SELECT [E_Mail], [First_Name] FROM [Members] WHERE ([E_Mail] = ?)">
        <SelectParameters>
            <asp:QueryStringParameter Name="E_Mail" QueryStringField="eMail" 
                Type="String" />
        </SelectParameters>
</asp:SqlDataSource>
<asp:SqlDataSource runat="server" ID="PostSqlDataSource" 
        ConnectionString="<%$ ConnectionStrings:PostsDataBaseConnectionString %>" 
        ProviderName="<%$ ConnectionStrings:PostsDataBaseConnectionString.ProviderName %>" 
        SelectCommand="SELECT [Post], [PostDate] FROM [Posts]"></asp:SqlDataSource>
    <asp:SqlDataSource ID="FriendsSqlDataSource" runat="server" 
        ConnectionString="<%$ ConnectionStrings:FriendsDataBaseConnectionString %>" 
        ProviderName="<%$ ConnectionStrings:FriendsDataBaseConnectionString.ProviderName %>" SelectCommand="SELECT  Members.Last_Name + ' ' + Members.First_Name AS MemberName,Friends.My_E_Mail, Friends.Friend_E_Mail ,Members.First_Name 

FROM (Members INNER JOIN Friends ON Members.E_Mail = Friends.My_E_Mail AND Members.E_Mail = Friends.Friend_E_Mail AND Members.E_Mail = Friends.My_E_Mail)

WHERE Members.E_Mail = Friends.Friend_E_Mail"></asp:SqlDataSource>

    <table align ="center">
<tr>
<td style="width: 50px"> 
    <table align ="center">
    <tr> <td>
        <table align = "center">
       <tr><td><asp:Button ID="LogOutButton" runat="server" Height="27px" Text="Log Out" 
        Width="79px" onclick="LogOutButton_Click" /></td></tr> 
        </table>
        </td></tr>
        </table>
 </td>
</tr>
<tr>
<td style="width: 134px" bgcolor="#996633">

    <table align ="center">
    <tr>
    
    <td><font color = "White"><b>Member Home Page!</b></font></td>
    
    </tr>
    </table>
    </td>
</tr>
<tr>
<td style="width: 134px">

<table align = "center">
<tr> <td>
    <asp:DetailsView ID="DetailsView1" runat="server" AutoGenerateRows="False" 
        DataKeyNames="E_Mail" DataSourceID="MemberSqlDataSource" Height="50px" 
        Width="125px" CellPadding="4" 
        ForeColor="#333333" GridLines="None">
        <AlternatingRowStyle BackColor="White" />
        <CommandRowStyle BackColor="#D1DDF1" Font-Bold="True" />
        <EditRowStyle BackColor="#2461BF" />
        <FieldHeaderStyle BackColor="#DEE8F5" Font-Bold="True" BorderStyle="Solid" 
            HorizontalAlign="Center" VerticalAlign="Top" />
        <Fields>
            <asp:BoundField DataField="E_Mail" HeaderText="E_Mail" ReadOnly="True" 
                SortExpression="E_Mail" />
            <asp:ImageField DataImageUrlField="First_Name" 
                DataImageUrlFormatString="images/{0}.jpg" ReadOnly="True">
            </asp:ImageField>
            <asp:BoundField DataField="First_Name" HeaderText="First_Name" 
                SortExpression="First_Name" />
        </Fields>
        <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
        <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
        <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
        <RowStyle BackColor="#EFF3FB" />
    </asp:DetailsView>
    </td></tr>
    </table>
</td>

</tr>
<tr>
<td><hr /></td>
</tr>
<tr>
<td>
<table align = "center">
<tr> <td>

<asp:GridView runat="server" CellPadding="4" DataSourceID="PostSqlDataSource" 
        EmptyDataText="You Have No Post" 
        Font-Bold="False" 
        Font-Names="Arial" 
        Font-Size="Medium" 
        Font-Strikeout="False" 
        Font-Underline="False" 
        ForeColor="#333333" 
        GridLines="Horizontal" 
        onselectedindexchanged="PostsGridView_SelectedIndexChanged" 
        ShowFooter="True" 
        ShowHeaderWhenEmpty="True" 
        ID="PostsGridView" EmptyDataRowStyle-ForeColor="DarkOrange" EmptyDataRowStyle-CssClass="horizontalRule">
    <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
    <EditRowStyle BackColor="#999999" />

<EmptyDataRowStyle CssClass="horizontalRule" ForeColor="Yellow" BackColor="#663300"></EmptyDataRowStyle>

    <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
    <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
    <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
    <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
    <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
    <SortedAscendingCellStyle BackColor="#E9E7E2" />
    <SortedAscendingHeaderStyle BackColor="#506C8C" />
    <SortedDescendingCellStyle BackColor="#FFFDF8" />
    <SortedDescendingHeaderStyle BackColor="#6F8DAE" />
    </asp:GridView></td></tr> 
    </table>
    </td></tr>

    
<tr>
<td>
    <table align = "center">
    <tr> <td>
    <asp:Button ID="PostButton" runat="server" Text="Click To Add Post!" 
            onclick="PostButton_Click" /> 
    </td></tr>
    </table>
    </td>
</tr>
<tr>
<td>
<hr />
</td>
</tr>
<tr>
<td>
<table align ="center">
<tr> <td>
    <asp:GridView ID="FriendsGridView" runat="server" CellPadding="4" 
        DataSourceID="FriendsSqlDataSource" EmptyDataText="You Have No Friends" 
        ForeColor="#333333" GridLines="None" 
        onselectedindexchanged="FriendsGridView_SelectedIndexChanged" 
        ShowHeaderWhenEmpty="True" AutoGenerateColumns="False">
        <AlternatingRowStyle BackColor="White" />
        <Columns>
            <asp:TemplateField HeaderText="MemberName" SortExpression="MemberName">
                <EditItemTemplate>
                    <asp:Label ID="Label1" runat="server" Text='<%# Eval("MemberName") %>'></asp:Label>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:HyperLink ID="NameHyperLink" runat="server" 
                        NavigateUrl="~/FriendInfo.aspx" Text='<%# Eval("MemberName", "{0}") %>'></asp:HyperLink>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:BoundField DataField="My_E_Mail" HeaderText="My_E_Mail" 
                SortExpression="My_E_Mail" />
            <asp:BoundField DataField="Friend_E_Mail" HeaderText="Friend_E_Mail" 
                SortExpression="Friend_E_Mail" />
            <asp:BoundField DataField="First_Name" HeaderText="First_Name" 
                SortExpression="First_Name" />
        </Columns>
        <EditRowStyle BackColor="#2461BF" />
        <EmptyDataRowStyle BackColor="#333300" ForeColor="Yellow" 
            HorizontalAlign="Center" VerticalAlign="Middle" />
        <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
        <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
        <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
        <RowStyle BackColor="#EFF3FB" />
        <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
        <SortedAscendingCellStyle BackColor="#F5F7FB" />
        <SortedAscendingHeaderStyle BackColor="#6D95E1" />
        <SortedDescendingCellStyle BackColor="#E9EBEF" />
        <SortedDescendingHeaderStyle BackColor="#4870BE" />

    </asp:GridView>
    </td></tr>
    </table>
</td>
</tr>
<tr>
<td>

<table align ="center">
<tr>
<td>
<asp:Button runat="server" ID ="AddFriendButton" onclick="AddFriendButton_Click" 
        Text="Click Here To Add A Friend!"/>
</td>
</tr>

</table>
</td>

</tr>
<!--NOTE TO SELF ~~~THIS IS THE END OF MAIN TABLE ALL TD/TR TAGS MUST BE ABOVE THIS~~~~ -->
</table>

</asp:Content>

