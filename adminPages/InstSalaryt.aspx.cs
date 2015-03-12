using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
public partial class InstSalaryt : System.Web.UI.Page
{
    ObjectDataSource obj;
   
    
    protected void Page_Load(object sender, EventArgs e)
    {
        string path = HttpContext.Current.Request.Url.AbsolutePath;
        if (Auth_BLL.userlogged() == false)
            Response.Redirect("~/login.aspx?url=" + path);
        if (Auth_BLL.checkRole(Auth_BLL.currentUserId(), 1) == false)
            Auth_BLL.RouteUser();

        if(!IsPostBack)
        {
            obj = new ObjectDataSource();
            obj.TypeName = "Salary_Ins_BLL";
            obj.SelectMethod = "select_Salary";
            obj.Select();
            Salary_Ins.DataSource = obj;
            Salary_Ins.DataBind();
            Session.Add("object", obj);


        }
    }
}