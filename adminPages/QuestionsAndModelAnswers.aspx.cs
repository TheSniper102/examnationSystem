using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class QuestionsAndModelAnswers : System.Web.UI.Page
{

    protected void Page_Load(object sender, EventArgs e)
    {
        string path = HttpContext.Current.Request.Url.AbsolutePath;
        if (Auth_BLL.userlogged() == false)
            Response.Redirect("~/login.aspx?url=" + path);
        if (Auth_BLL.checkRole(Auth_BLL.currentUserId(), 1) == false)
            Auth_BLL.RouteUser();
    }
    protected void ddl_course_SelectedIndexChanged(object sender, EventArgs e)
    {
        ObjectDataSource obj = new ObjectDataSource();
        obj.TypeName = "ProfileBusinessLayer";
        obj.SelectMethod = "ReportStAnsandModelAns";
        obj.SelectParameters.Clear();
        obj.SelectParameters.Add("crs_id", ddl_course.SelectedValue);
        obj.Select();
        GridView_exams.DataSource = obj;
        GridView_exams.DataBind();
    }
}