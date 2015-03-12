using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Topic_for_Each_Course : System.Web.UI.Page
{
    ObjectDataSource obj = new ObjectDataSource();
    protected void Page_Load(object sender, EventArgs e)
    {
         string path = HttpContext.Current.Request.Url.AbsolutePath;
         if (Auth_BLL.userlogged() == false)
             Response.Redirect("login.aspx?url=" + path);
         if ((Auth_BLL.checkRole(Auth_BLL.currentUserId(), 1) == false)
               && (Auth_BLL.checkRole(Auth_BLL.currentUserId(), 2) == false))
             Auth_BLL.RouteUser();

        if (!Page.IsPostBack)
        {
            obj = new ObjectDataSource();
            obj.TypeName = "Course_BL";
            obj.SelectMethod = "select_course";
            obj.Select();
            ddl_topic.DataSource = obj;
            ddl_topic.DataTextField = "Crs_Name";
            ddl_topic.DataValueField = "Crs_id";
            ddl_topic.DataBind();
            Session.Add("obj1", obj);
            obj.Inserted += HandleCrud.obj_Inserted;
            obj.Updated += HandleCrud.obj_Updated;
            obj.Deleted += HandleCrud.obj_Deleted;
        }
    }
    protected void ddl_topic_SelectedIndexChanged(object sender, EventArgs e)
    {

    }
    protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
    {

    }
    protected void btn_show_Click(object sender, EventArgs e)
    {
        obj = (ObjectDataSource)Session["obj1"];
        obj.TypeName = "Course_BL";
        obj.SelectMethod = "select_topic_bycourse";
        obj.SelectParameters.Clear();
        obj.SelectParameters.Add("crs_id", ddl_topic.SelectedValue.ToString());
        obj.Select();
        ddl_topic.DataSource = obj;
        GridView1.DataSource = obj;
        GridView1.DataBind();
        Session.Add("obj1", obj);
    }
   
   
}