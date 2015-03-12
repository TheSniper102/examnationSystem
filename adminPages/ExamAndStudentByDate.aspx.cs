using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class ExamAndStudentByDate : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        string path = HttpContext.Current.Request.Url.AbsolutePath;
        if (Auth_BLL.userlogged() == false)
            Response.Redirect("~/login.aspx?url=" + path);
        if (Auth_BLL.checkRole(Auth_BLL.currentUserId(), 1) == false)
            Auth_BLL.RouteUser();

    }
    protected void txt_date_TextChanged(object sender, EventArgs e)
    {
        ObjectDataSource obj = new ObjectDataSource();
        obj.TypeName = "QuestionBusinnessLayer";
        obj.SelectMethod = "ExamByDate";
        obj.SelectParameters.Clear();
        DateTime d = Convert.ToDateTime(txt_date.Text);
        obj.SelectParameters.Add("d", d.ToString());
        obj.Select();

    }
}