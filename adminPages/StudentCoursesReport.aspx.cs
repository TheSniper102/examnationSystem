using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class StudentCoursesReport : System.Web.UI.Page
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
            ddl_searchtype_SelectedIndexChanged(ddl_searchtype, new EventArgs());
            ddl_seachword_SelectedIndexChanged(ddl_seachword, new EventArgs());
        }
           
    }
    protected void ddl_searchtype_SelectedIndexChanged(object sender, EventArgs e)
    {
        if (ddl_searchtype.SelectedValue == "0")//student
        {

            ddl_seachword.Items.Clear();
            obj.TypeName = "StudentBusinessLayer";

            obj.SelectParameters.Clear();
            obj.SelectMethod = "SelectStudentIdName";
            obj.Select();
            ddl_seachword.DataSource = obj;
            ddl_seachword.DataTextField = "Name";
            ddl_seachword.DataValueField = "ST_id";
            ddl_seachword.DataBind();
            Session.Add("object", obj);

            lbl_search.Text = "choose student";
            ddl_seachword_SelectedIndexChanged(ddl_seachword, new EventArgs());


        }
        else if(ddl_searchtype.SelectedValue=="1")//===courses
        {
            ddl_seachword.Items.Clear();
            obj.TypeName = "StudentBusinessLayer";

            obj.SelectParameters.Clear();
            obj.SelectMethod = "selectCourseIdName";
            obj.Select();
            ddl_seachword.DataSource = obj;//Crs_Id,Crs_Name
            ddl_seachword.DataTextField = "Crs_Name";
            ddl_seachword.DataValueField = "Crs_Id";
            ddl_seachword.DataBind();
            Session.Add("object", obj);
            lbl_search.Text = "choose course";
            ddl_seachword_SelectedIndexChanged(ddl_seachword, new EventArgs());

        }
    }
    protected void ddl_seachword_SelectedIndexChanged(object sender, EventArgs e)
    {
        obj.TypeName = "StudentBusinessLayer";
        obj.SelectParameters.Clear();
        obj.SelectMethod = "SearchStudentcourse";
        obj.SelectParameters.Add("searchkey", ddl_searchtype.SelectedValue);
        obj.SelectParameters.Add("searchword", ddl_seachword.Text);
        obj.Select();
        st_crs_GridView.DataSource = obj;
        st_crs_GridView.DataBind();
        Session.Add("object", obj);
    }
}