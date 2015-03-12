using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Show_Contact_Message_ : System.Web.UI.Page
{
    ObjectDataSource obj = new ObjectDataSource();
    protected void Page_Load(object sender, EventArgs e)
    {
        string path = HttpContext.Current.Request.Url.AbsolutePath;
        if (Auth_BLL.userlogged() == false)
            Response.Redirect("~/login.aspx?url=" + path);
        if (Auth_BLL.checkRole(Auth_BLL.currentUserId(), 1) == false)
            Auth_BLL.RouteUser();

        obj = new ObjectDataSource();
        obj.TypeName = "ContactUs_BL";
        obj.SelectMethod = "Contactus";
        obj.Select();
        GridView1.DataSource = obj;
        GridView1.DataBind();
        Session.Add("obj1", obj);
        //obj.Inserted += HandleCrud.obj_Inserted;
    }
    protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
    {

    }
    protected void GridView1_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {

        obj=(ObjectDataSource)Session["obj1"];
        obj.DeleteMethod = "DeleteContactUs";
        obj.DeleteParameters.Clear();
        Label id = (Label)GridView1.Rows[e.RowIndex].FindControl("lbliddes");
        obj.DeleteParameters.Add("Id", id.Text);
        obj.Delete();
        GridView1.DataSource = obj;
        GridView1.DataBind();
    }
    
    protected void Button1_Click(object sender, EventArgs e)
    {
        if(GridView1.SelectedValue!=null)
        {
            int conid = (int)GridView1.SelectedValue;

            obj.TypeName = "";
        }
    }
}