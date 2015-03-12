using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class newCourse : System.Web.UI.Page
{
    ObjectDataSource obj;
    protected void Page_Load(object sender, EventArgs e)
    {
        string path = HttpContext.Current.Request.Url.AbsolutePath;
        if (Auth_BLL.userlogged() == false)
            Response.Redirect("~/login.aspx?url=" + path);
        if (Auth_BLL.checkRole(Auth_BLL.currentUserId(), 1) == false)
            Auth_BLL.RouteUser();
        
           if (Page.IsPostBack == false)
        {
            obj = new ObjectDataSource();
            obj.TypeName = "Course_BL";
            obj.SelectMethod = "SelectAllCourses";
            obj.Select();
            GridView1.DataSource = obj;
            GridView1.DataBind();
            Session.Add("obj1", obj);
        }
    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        
            obj = (ObjectDataSource)Session["obj1"];
            obj.InsertMethod = "insertcourse";
            obj.InsertParameters.Clear();   // to clear all old parameters
            obj.InsertParameters.Add("name", Txtn1.Text);
            obj.InsertParameters.Add("Duration", Txtd2.Text);
            obj.Insert();
            Session["obj"] = obj;
            GridView1.DataSource = obj;
            GridView1.DataBind();

    }
    protected void GridView1_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {
        obj = (ObjectDataSource)Session["obj1"];
        obj.DeleteMethod = "DeleteCourse";
        obj.DeleteParameters.Clear();
        Label id = (Label)GridView1.Rows[e.RowIndex].FindControl("crsidlbldes");
        obj.DeleteParameters.Add("ID", id.Text);
        obj.Delete();
        GridView1.DataSource = obj;
        GridView1.DataBind();
    }
    protected void GridView1_RowEditing(object sender, GridViewEditEventArgs e)
    {
        obj = (ObjectDataSource)Session["obj1"];
        GridView1.EditIndex = e.NewEditIndex;
        GridView1.DataSource = obj;
        GridView1.DataBind();
    }
    protected void GridView1_RowUpdating(object sender, GridViewUpdateEventArgs e)
    {
        obj = (ObjectDataSource)Session["obj1"];
        obj.UpdateMethod = "updatecourse";
        obj.UpdateParameters.Clear();
        Label crs_id = (Label)GridView1.Rows[e.RowIndex].FindControl("crslbledt");
        TextBox crs_name = (TextBox)GridView1.Rows[e.RowIndex].FindControl("crsnameedt");
        TextBox crs_duration = (TextBox)GridView1.Rows[e.RowIndex].FindControl("crsduratedt");
        obj.UpdateParameters.Clear();
        obj.UpdateParameters.Add("id", crs_id.Text);
        obj.UpdateParameters.Add("Name", crs_name.Text);
        obj.UpdateParameters.Add("Duration", crs_duration.Text);
        obj.Update();
        GridView1.EditIndex = -1;
        GridView1.DataSource = obj;
        GridView1.DataBind();
        Session["obj1"] = obj;
    }
    protected void GridView1_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
    {
        obj = (ObjectDataSource)Session["obj1"];
        GridView1.EditIndex = -1;
        GridView1.DataSource = obj;
        GridView1.DataBind();
    }
}