using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;

public partial class studentExamsByID : System.Web.UI.Page
{
    ObjectDataSource ob;
    DataSet ds;
    protected void Page_Load(object sender, EventArgs e)
    {
        string path = HttpContext.Current.Request.Url.AbsolutePath;
        if (Auth_BLL.userlogged() == false)
            Response.Redirect("~/login.aspx?url=" + path);
        if (Auth_BLL.checkRole(Auth_BLL.currentUserId(), 1) == false)
            Auth_BLL.RouteUser();

        if(!Page.IsPostBack)
        {
            ObjectDataSource obj=new ObjectDataSource("TopicBusinessLayer","studentid");
            DropDownList1.DataTextField = "Name";
            DropDownList1.DataValueField = "ST_id";
            DropDownList1.DataSource = obj;
            DropDownList1.DataBind();
            Session.Add("oo",obj);
            DropDownList1_SelectedIndexChanged(DropDownList1, new EventArgs());

        }

    }
    protected void DropDownList1_SelectedIndexChanged(object sender, EventArgs e)
    {
        ob=(ObjectDataSource)Session["oo"];
        ob = new ObjectDataSource("TopicBusinessLayer", "studentExamById");
        ob.SelectParameters.Add("ST_id", DropDownList1.SelectedValue.ToString());
        ob.Select();
        GridView1.DataSource = ob;
        GridView1.DataBind();
        //Session["oo"] = ob;

    }
    protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
    {

    }
}