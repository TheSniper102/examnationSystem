using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class MasterPage2 : System.Web.UI.MasterPage
{
    protected void Page_Load(object sender, EventArgs e)
    {


        if (Auth_BLL.userlogged() == false)
            Response.Redirect("~/login.aspx");
        //if not admin or instructor
        if ((Auth_BLL.checkRole(Auth_BLL.currentUserId(), 1) == false) && (Auth_BLL.checkRole(Auth_BLL.currentUserId(), 3) == false))
        { Response.Redirect("~/Home.aspx"); }

        if(Auth_BLL.checkRole(Auth_BLL.currentUserId(),1)==  true)
         Panel1.Visible = true;
        else
            Panel1.Visible = false;
    }
    //protected void LinkButton1_Click(object sender, EventArgs e)
    // {
    //     Auth_BLL.logout();
    // }
}
