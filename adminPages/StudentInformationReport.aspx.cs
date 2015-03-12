using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class StudentInformationReport : System.Web.UI.Page
{
    ObjectDataSource obj = new ObjectDataSource();

    protected void Page_Load(object sender, EventArgs e)
    {
        string path = HttpContext.Current.Request.Url.AbsolutePath;
        if (Auth_BLL.userlogged() == false)
            Response.Redirect("~/login.aspx?url=" + path);
        if (Auth_BLL.checkRole(Auth_BLL.currentUserId(), 1) == false)
            Auth_BLL.RouteUser();

        if (!Page.IsPostBack)
        {

            obj.TypeName = "StudentBusinessLayer";

            obj.SelectParameters.Clear();
            obj.SelectMethod = "SelectStudentIdName";
            obj.Select();
            ddl_stId.DataSource = obj;
            ddl_stId.DataTextField = "Name";
            ddl_stId.DataValueField = "ST_id";
            ddl_stId.DataBind();
            Session.Add("object", obj);
        }
    }
    protected void ddl_stId_SelectedIndexChanged(object sender, EventArgs e)
    {
        obj.TypeName = "StudentBusinessLayer";
        obj.SelectParameters.Clear();
        obj.SelectMethod = "SelectReportStudent";
        obj.SelectParameters.Add("St_Id", ddl_stId.SelectedValue);
        obj.Select();
        St_GridView.DataSource = obj;
        St_GridView.DataBind();
        Session.Add("object", obj);
    }
}