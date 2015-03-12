using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class adminPages_usersGroups : System.Web.UI.Page
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
            obj.TypeName = "QuestionBusinnessLayer";
            obj.SelectMethod = "selectUserGroup";
            obj.Select();
            GridView2.DataSource = obj;
            GridView2.DataBind();
            Session.Add("obj", obj);
        }

    }
  
    protected void GridView2_RowEditing(object sender, GridViewEditEventArgs e)
    {
        obj = (ObjectDataSource)Session["obj"];
        GridView2.EditIndex = e.NewEditIndex;
        GridView2.DataSource = obj;
        GridView2.DataBind();
    }

    protected void GridView2_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
    {
        obj = (ObjectDataSource)Session["obj"];
        GridView2.EditIndex = -1;
        GridView2.DataSource = obj;
        GridView2.DataBind();
    }
    protected void GridView2_RowUpdating(object sender, GridViewUpdateEventArgs e)
    {
        obj = (ObjectDataSource)Session["obj"];
        obj.UpdateMethod = "updateUserGroup";
        obj.UpdateParameters.Clear();
        Label id = (Label)GridView2.Rows[e.RowIndex].FindControl("lb_userId");
        string group = ((DropDownList)GridView2.Rows[e.RowIndex].FindControl("DDL_group")).SelectedValue.ToString();
        obj.UpdateParameters.Add("user_id", id.Text);
        obj.UpdateParameters.Add("group_id", group);
        obj.Update();
        GridView2.EditIndex = -1;
        GridView2.DataSource = obj;
        GridView2.DataBind();

    }
    protected void GridView2_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {
         obj = (ObjectDataSource)Session["obj"];
        obj.DeleteMethod = "deleteUserGroup";
        obj.DeleteParameters.Clear();
        Label id = (Label)GridView2.Rows[e.RowIndex].FindControl("lb_userId_edit");
        obj.DeleteParameters.Add("user_id", id.Text);
        obj.Delete();
        GridView2.DataSource = obj;
        GridView2.DataBind();
        Session["obj"] = obj;
    }
}