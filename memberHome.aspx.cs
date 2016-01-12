using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class MemberHome : System.Web.UI.Page
{
    String eMail;
    
    
    protected void Page_Load(object sender, EventArgs e)
    {
        String e_mail = Request.QueryString["eMail"].ToString();
        eMail = e_mail;
       
    }
    protected void LogOutButton_Click(object sender, EventArgs e)
    {
        Response.Redirect("~/Login.aspx");
    }
    protected void PostsGridView_SelectedIndexChanged(object sender, EventArgs e)
    {

    }
    protected void PostButton_Click(object sender, EventArgs e)
    {
        // this needs 
        Response.Redirect("~/InsertPost.aspx?eMail="+eMail);
    }
    protected void FriendsGridView_SelectedIndexChanged(object sender, EventArgs e)
    {

    }
    protected void AddFriendButton_Click(object sender, EventArgs e)
    {
        Response.Redirect("~/InsertFriend.aspx?eMail="+eMail);
    }
}
