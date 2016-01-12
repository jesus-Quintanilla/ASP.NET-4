<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="InsertPost.aspx.cs" Inherits="InsertPost" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder2" Runat="Server">

    <asp:SqlDataSource ID="PostInsertSqlDataSource" runat="server" 
        ConflictDetection="CompareAllValues" 
        ConnectionString="<%$ ConnectionStrings:InsertPostsDataBaseConnectionString %>" 
        InsertCommand="INSERT INTO [Posts] ([E_Mail], [Post], [PostDate]) VALUES (@Post,@PostDate, @E_Mail)" 
        OldValuesParameterFormatString="original_{0}" 
        ProviderName="<%$ ConnectionStrings:InsertPostsDataBaseConnectionString.ProviderName %>" 
        SelectCommand="SELECT [E_Mail], [ID], [Post], [PostDate] FROM [Posts]" 
        UpdateCommand="UPDATE [Posts] SET [Post] = @Post, [PostDate] = @PostDate WHERE [ID] = ? AND (([E_Mail] = @E_Mail) OR ([E_Mail] IS NULL AND ? IS NULL)) AND (([Post] = ?) OR ([Post] IS NULL AND ? IS NULL)) AND (([PostDate] = ?) OR ([PostDate] IS NULL AND ? IS NULL))">
   
        <InsertParameters>
            <asp:Parameter Name="E_Mail" Type ="String" />
            <asp:Parameter Name="Post" Type="String" />
            <asp:Parameter Name="PostDate" Type="DateTime" />
        </InsertParameters>
        
    </asp:SqlDataSource>
    <table class="center","horizontalRule">
    <tr>
    <td>
    <p class="center" style="background-color:Gray; color:White; text-align:center;">Insert A Post!</p>
    </td>
    </tr>
    
    <tr>
    <td><hr /></td>
    </tr>
    
    <tr>
    <td>
    
        <asp:TextBox ID="InsertTextBox" runat="server" Height="20px" Width="315px"></asp:TextBox>
    
    </td>
        <td>
            <asp:RequiredFieldValidator ID="InsertPostRequiredFieldValidation" 
                runat="server" BackColor="Yellow" ControlToValidate="InsertTextBox" 
                Display="Dynamic" ErrorMessage="You Must Enter Text To Show The World !" 
                ForeColor="Red"></asp:RequiredFieldValidator>
        </td>
    </tr>

    <tr>
    <td>
        <table align ="center"> 
        <tr> 
        <td>
        <asp:Button ID="InsertButton" runat="server" Text="Submit The Post!" 
            onclick="InsertButton_Click" />
            </td>
            </tr>
            </table> 
            
            </td>
    </tr>
    <tr>
    <td> </td>
    </tr>
 
    <tr>
    <td >
      <table class ="center">
      <tr> <td>
      <asp:Button ID="ReturnButton" runat="server" Text="Cancel"  
            CausesValidation="false" onclick="ReturnButton_Click"/>
            </td></tr>
            </table> 
     </td>
    </tr>
    </table>

</asp:Content>

