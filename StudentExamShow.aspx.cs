using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class StudentExamShow : System.Web.UI.Page
{
    ObjectDataSource obj = new ObjectDataSource();
    protected void Page_Load(object sender, EventArgs e)
    {
        //==========check session============
        string path = HttpContext.Current.Request.Url.AbsolutePath;
        if (Auth_BLL.userlogged() == false)
            Response.Redirect("login.aspx?url=" + path);
        if(Auth_BLL.checkRole(Auth_BLL.currentUserId(),2)== false)
            Auth_BLL.RouteUser();

        
        int stid = Auth_BLL.currentUserId();
        if (!Page.IsPostBack)
        {
            obj.TypeName = "ExamBusinessLayer";
            obj.SelectMethod = "CurrentExames";
            obj.SelectParameters.Add("st_id", stid.ToString());
            obj.Select();
            DataList_ShowExam.DataSource = obj;
            DataList_ShowExam.DataBind();
            if (DataList_ShowExam.Items.Count == 0)
            {
                lbl.Text = "YOU HAVE NO EXAMES RIGHT NOW.........";
            }
            foreach (DataListItem item in DataList_ShowExam.Items)
            {
                Label lbl = (Label)item.FindControl("lbl_ex");
                int crs=int.Parse(lbl.Text);
                HyperLink hl = (HyperLink)item.FindControl("hl_exam");
                hl.NavigateUrl = "TakeExam.aspx?crsid=" + crs;
            }

        }
    }
}