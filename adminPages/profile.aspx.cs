using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;

public partial class adminPages_profile : System.Web.UI.Page
{
   
    protected void Page_Load(object sender, EventArgs e)
    {

        string path = HttpContext.Current.Request.Url.AbsolutePath;
        if (Auth_BLL.userlogged() == false)
            Response.Redirect("~/login.aspx?url=" + path);
        //if not admin or instructor
        if ((Auth_BLL.checkRole(Auth_BLL.currentUserId(), 1) == false) &&
            (Auth_BLL.checkRole(Auth_BLL.currentUserId(), 3) == false))
            Response.Redirect("~/StudentHome.aspx");
        Session.Add("ins_id", Auth_BLL.currentUserId());   

    }
}