using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;

public partial class InsUpdateData : System.Web.UI.Page
{
    /* 
     *@todo change current user to be only instructor
     */
    ObjectDataSource obj;
    DataSet ds;
    protected void Page_Load(object sender, EventArgs e)
    {
        string path = HttpContext.Current.Request.Url.AbsolutePath;
        if (Auth_BLL.userlogged() == false)
            Response.Redirect("~/login.aspx?url=" + path);
        if (Auth_BLL.checkRole(Auth_BLL.currentUserId(), 1) == false)
            Auth_BLL.RouteUser();

        if (!Page.IsPostBack)
        {
            obj = new ObjectDataSource();
            obj.TypeName = "Update_Ins_Data";
            obj.SelectMethod = "select_all_by_Id";
            obj.SelectParameters.Clear();
            obj.SelectParameters.Add("Ins_Id", Auth_BLL.currentUserId().ToString());
            obj.Select();
            GridView1.DataSource = obj;
            GridView1.DataBind();
            Session.Add("object", obj);
        }
        
        
    }


    protected void drp_Ins_Data_SelectedIndexChanged(object sender, EventArgs e)
    {
       
    }
   
    protected void GridView1_RowUpdating(object sender, GridViewUpdateEventArgs e)
    {
        obj = new ObjectDataSource();
        obj = (ObjectDataSource)Session["object"];
        obj.TypeName = "Update_Ins_Data";
        obj.UpdateMethod = "update_Ins_Data";
        obj.UpdateParameters.Clear();
        Label id = (Label)GridView1.Rows[0].FindControl("Ins_Id");
        TextBox name = (TextBox)GridView1.Rows[e.RowIndex].FindControl("txt_edit_InsName");
        TextBox address = (TextBox)GridView1.Rows[e.RowIndex].FindControl("txt_edit_InsAddress");
        TextBox email = (TextBox)GridView1.Rows[e.RowIndex].FindControl("txt_edit_InsEmail");
        TextBox phone = (TextBox)GridView1.Rows[e.RowIndex].FindControl("txt_edit_InsPhone");
        DropDownList dept_id = (DropDownList)GridView1.Rows[e.RowIndex].FindControl("edit_drp_IdNam");
        obj.UpdateParameters.Add("Ins_Id", id.Text);
        obj.UpdateParameters.Add("Ins_Name", name.Text);
        obj.UpdateParameters.Add("Ins_Address", address.Text);
        obj.UpdateParameters.Add("Ins_Email", email.Text);
        obj.UpdateParameters.Add("Ins_Phone", phone.Text);
        obj.UpdateParameters.Add("Dept_id", dept_id.SelectedValue.ToString());
        obj.Update();
       
        GridView1.EditIndex = -1;
        GridView1.DataSource = obj;
        GridView1.DataBind();
        Session["object"] = obj;

    }
    protected void GridView1_RowEditing(object sender, GridViewEditEventArgs e)
    {
        obj = new ObjectDataSource();
        obj = (ObjectDataSource)Session["object"];
        GridView1.EditIndex = e.NewEditIndex;
        GridView1.DataSource = obj;
        GridView1.DataBind();
    }
    protected void GridView1_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
    {
        obj = new ObjectDataSource();
        obj = (ObjectDataSource)Session["object"];
        GridView1.EditIndex = -1;
        GridView1.DataSource = obj;
        GridView1.DataBind();
    }
    protected void GridView1_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        obj = new ObjectDataSource();
        obj = (ObjectDataSource)Session["object"];
        GridView1.PageIndex = e.NewPageIndex;
        GridView1.DataSource = obj;
        GridView1.DataBind();
    }
    protected void btn_ins_change_pass_Click(object sender, EventArgs e)
    {
        Response.Redirect("~/changePassword.aspx");
    }
}