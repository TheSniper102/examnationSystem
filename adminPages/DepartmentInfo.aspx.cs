using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class DepartmentInfo : System.Web.UI.Page
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
            obj.TypeName = "Department_BLL";
            obj.SelectMethod = "getDeptById";
            obj.SelectParameters.Clear();
            obj.SelectParameters.Add("deptId", "0");
            obj.Select();
            DeptInfo_grd.DataSource = obj;
            DeptInfo_grd.DataBind();
            
        }
    }
    protected void deptShow_btn_Click(object sender, EventArgs e)
    {
        
            obj = new ObjectDataSource();
            obj.TypeName = "Department_BLL";
            obj.SelectMethod = "getDeptById";
            obj.SelectParameters.Clear();
            obj.SelectParameters.Add("deptId", dept_ddl.SelectedValue.ToString());
            obj.Select();
            DeptInfo_grd.DataSource = obj;
            DeptInfo_grd.DataBind();

        
    }
}