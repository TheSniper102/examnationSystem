using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;

public partial class AllInstractor : System.Web.UI.Page
{
    ObjectDataSource obj;
    protected void Page_Load(object sender, EventArgs e)
    {
        string path = HttpContext.Current.Request.Url.AbsolutePath;
        if (Auth_BLL.userlogged() == false)
            Response.Redirect("~/login.aspx?url=" + path);
        if (Auth_BLL.checkRole(Auth_BLL.currentUserId(), 1) == false)
            Auth_BLL.RouteUser();
 

        if (!IsPostBack)
        {
            obj = new ObjectDataSource();
            obj.TypeName = "B_Instractor";
            obj.SelectMethod = "seletallIns";
            obj.Select();
            GridView1.DataSource = obj;
            GridView1.DataBind();
            Session.Add("object", obj);
        }
    }
}