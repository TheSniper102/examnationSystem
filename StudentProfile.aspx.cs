using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

public partial class StudentProfile : System.Web.UI.Page
{
    ObjectDataSource obj = new ObjectDataSource();
    int stid;
    protected void Page_Load(object sender, EventArgs e)
    {
        string path = HttpContext.Current.Request.Url.AbsolutePath;
        if (Auth_BLL.userlogged() == false)
            Response.Redirect("login.aspx?url=" + path);
        if ((Auth_BLL.checkRole(Auth_BLL.currentUserId(), 1) == false)
              && (Auth_BLL.checkRole(Auth_BLL.currentUserId(), 2) == false))
            Auth_BLL.RouteUser();

        stid = Auth_BLL.currentUserId();
        

        if (!Page.IsPostBack)
        {
            FillPersonal();
            Session.Add("obj", obj);

            ObjectDataSource ob = new ObjectDataSource();
            ob.TypeName = "ProfileBusinessLayer";
            ob.SelectMethod = "StudentProfileCourses";
            ob.SelectParameters.Clear();
            ob.SelectParameters.Add("st_id", stid.ToString());
            ob.Select();
            DataList_Courses.DataSource = ob;
            DataList_Courses.DataBind();

            ObjectDataSource obb = new ObjectDataSource();
            obb.TypeName = "ProfileBusinessLayer";
            obb.SelectMethod = "StudentProfileExams";
            obb.SelectParameters.Clear();
            obb.SelectParameters.Add("st_id", stid.ToString());
            obb.Select();
            DataList_Exames.DataSource = obb;
            DataList_Exames.DataBind();
        }



    }
    protected void lbtn_edit_Click(object sender, EventArgs e)
    {
        ddl_dept.DataBind();
        MV_Personal.SetActiveView(V_editPersonal);
       
        DataSet info = ShowInfo(stid);
        txt_fullname.Text = info.Tables[0].Rows[0]["Name"].ToString();
        txt_address.Text = info.Tables[0].Rows[0]["Address"].ToString();
        txt_age.Text = info.Tables[0].Rows[0]["Age"].ToString();
        txt_phone.Text = info.Tables[0].Rows[0]["phone"].ToString();
        txt_email.Text = info.Tables[0].Rows[0]["E_Mail"].ToString();
        ddl_dept.ClearSelection();

        ddl_dept.Items.FindByValue(info.Tables[0].Rows[0]["Dept_Id"].ToString()).Selected = true;

    }
    protected void LinkButton1_Click(object sender, EventArgs e)
    {
        SaveChanges();
        FillPersonal();
        MV_Personal.SetActiveView(V_ShowPersonal);


    }
    protected DataSet ShowInfo(int st_id)
    {
        obj.TypeName = "ProfileBusinessLayer";
        obj.SelectMethod = "StudentProfileInfo";
        obj.SelectParameters.Clear();
        obj.SelectParameters.Add("st_id", st_id.ToString());

        var data = (DataView)obj.Select();
        DataSet info = new DataSet();

        info.Tables.Add(data.ToTable());
        return info;
    }
    protected void FillPersonal()
    {
        DataSet info = ShowInfo(stid);
        lbl_fullname.Text = info.Tables[0].Rows[0]["Name"].ToString();
        lbl_address.Text = info.Tables[0].Rows[0]["Address"].ToString();
        lbl_age.Text = info.Tables[0].Rows[0]["Age"].ToString();
        lbl_phone.Text = info.Tables[0].Rows[0]["phone"].ToString();
        lbl_email.Text = info.Tables[0].Rows[0]["E_Mail"].ToString();
        lbl_dept.Text = info.Tables[0].Rows[0]["Dept_Name"].ToString();
        lbl_desc.Text = info.Tables[0].Rows[0]["Dept_Desc"].ToString();

        lbl_loc.Text = info.Tables[0].Rows[0]["Dept_Location"].ToString();
    }


    protected void SaveChanges()
    {
        obj = (ObjectDataSource)Session["obj"];
        obj.TypeName = "StudentBusinessLayer";
        obj.UpdateMethod = "UpdateStudent";
        obj.Updated += HandleCrud.obj_Updated;
        obj.UpdateParameters.Clear();
        obj.UpdateParameters.Add("ST_id", stid.ToString());
        obj.UpdateParameters.Add("Name", txt_fullname.Text);
        obj.UpdateParameters.Add("Address", txt_address.Text);
        obj.UpdateParameters.Add("Age", txt_age.Text);
        obj.UpdateParameters.Add("phone", txt_phone.Text);
        obj.UpdateParameters.Add("E_Mail", txt_email.Text);
        if (ddl_dept.SelectedValue != "")
        {
            obj.UpdateParameters.Add("DeptNo", ddl_dept.SelectedValue);
        }
        else
        {
            obj.UpdateParameters.Add("DeptNo", "0");
        }

        int updated = obj.Update();
        if (updated > 0)
        {
            lbl_editRes.Text = "Changes Saved Successfully";
        }
        Session["obj"] = obj;
    }
}