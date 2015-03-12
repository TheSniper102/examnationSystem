using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class instructor_per_course : System.Web.UI.Page
{
    ObjectDataSource obj=new ObjectDataSource();
    protected void Page_Load(object sender, EventArgs e)
    {
        string path = HttpContext.Current.Request.Url.AbsolutePath;
        if (Auth_BLL.userlogged() == false)
            Response.Redirect("~/login.aspx?url=" + path);
        if (Auth_BLL.checkRole(Auth_BLL.currentUserId(), 1) == false)
            Auth_BLL.RouteUser();

        if (!Page.IsPostBack)
        {
            obj = new ObjectDataSource();
            obj.TypeName = "Course_BL";
            obj.SelectMethod = "select_course";
            obj.Select();
            ddl_course.DataSource = obj;
            ddl_course.DataTextField = "Crs_Name";
            ddl_course.DataValueField = "Crs_id";
            ddl_course.DataBind();
            Session.Add("obj1", obj);
        }

    }
    protected void btn_show_Click(object sender, EventArgs e)
    {
        obj = new ObjectDataSource();
        obj.TypeName = "Course_BL";
        obj.SelectMethod = "select_instructor_bycourse";
        obj.SelectParameters.Add("crs_id", ddl_course.SelectedValue);
        obj.Select();
        ddl_course.DataSource = obj;
        GridView_instructor.DataSource = obj;
        GridView_instructor.DataBind();
        Session.Add("obj1", obj);
    }
    protected void GridView_instructor_SelectedIndexChanged(object sender, EventArgs e)
    {

    }
}