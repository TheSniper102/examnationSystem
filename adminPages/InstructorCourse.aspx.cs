using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class InstructorCourse : System.Web.UI.Page
{
    ObjectDataSource obj = new ObjectDataSource();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
            string path = HttpContext.Current.Request.Url.AbsolutePath;
            if (Auth_BLL.userlogged() == false)
                Response.Redirect("~/login.aspx?url=" + path);
            if (Auth_BLL.checkRole(Auth_BLL.currentUserId(), 1) == false)
                Auth_BLL.RouteUser();

            obj.TypeName = "InstructorBusinessLayer";

            obj.SelectParameters.Clear();
            obj.SelectMethod = "SelectInstructorIdName";
            obj.Select();
            ddl_inst.DataSource = obj;
            ddl_inst.DataTextField = "Ins_Name";
            ddl_inst.DataValueField = "Ins_Id";
            ddl_inst.DataBind();

            obj.TypeName = "StudentBusinessLayer";
            obj.SelectParameters.Clear();
            obj.SelectMethod = "selectCourseIdName";
            obj.Select();
            lbx_crs.DataSource = obj;//Crs_Id,Crs_Name
            lbx_crs.DataTextField = "Crs_Name";
            lbx_crs.DataValueField = "Crs_Id";
            lbx_crs.DataBind();
            Session.Add("object", obj);


            obj.Inserted += HandleCrud.obj_Inserted;
        }
    }
    protected void btn_save_Click(object sender, EventArgs e)
    {
        string crs = "";
        if (lbx_crs.SelectedItem != null)
        {
            foreach (ListItem li in lbx_crs.Items)
            {
                if (li.Selected)
                {
                    crs += li.Value + ",";
                }
            }

            obj = (ObjectDataSource)Session["object"];
            obj.InsertParameters.Clear();

            obj.TypeName = "InstructorBusinessLayer";
            obj.InsertMethod = "insertInstructorCourses";
            obj.InsertParameters.Add("insid", ddl_inst.SelectedValue);
            obj.InsertParameters.Add("crs", crs);
            int inserted = obj.Insert();
            Session["object"] = obj;
            if (inserted > 0)
            {
                lbl_res.Text = "saved successfully";
                img_result.Visible = true;
            }
        }
    }
}