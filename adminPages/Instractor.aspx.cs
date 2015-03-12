using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

public partial class Instractor : System.Web.UI.Page
{
    ObjectDataSource obj;
    #region PageLoading
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
            obj.TypeName = "B_Instractor";
            obj.SelectMethod = "seletallIns";
            obj.Select();
            GridView1.DataSource = obj;
            GridView1.DataBind();
            Session.Add("object", obj);
        }
    }
    #endregion

    #region Button_Inserted_Data_Ins
    protected void Insert_Instr_Click(object sender, EventArgs e)
    {
        if (txt_ins_Salary.Text == "" && txt_ins_Name.Text == "" && txt_ins_Email.Text == "" && txt_ins_address.Text == "" & txt_ins_Phone.Text == "")
        {
            messag_added.Text = "Please Complete Fields First";

        }
        else
        {
            obj = new ObjectDataSource();
            obj = (ObjectDataSource)Session["object"];
            obj.InsertMethod = "insert_ins";
            obj.InsertParameters.Clear();
            obj.InsertParameters.Add("Ins_Name", txt_ins_Name.Text);
            obj.InsertParameters.Add("Ins_Address", txt_ins_address.Text);
            obj.InsertParameters.Add("Ins_Email", txt_ins_Email.Text);
            obj.InsertParameters.Add("Ins_Phone", txt_ins_Phone.Text);
            obj.InsertParameters.Add("Salary", txt_ins_Salary.Text);
            obj.InsertParameters.Add("Dept_id", drp_Dept_Id.SelectedValue.ToString());
            obj.Insert();
            GridView1.DataSource = obj;
            GridView1.DataBind();
            Session["object"] = obj;
            txt_ins_Name.Text = txt_ins_Email.Text = txt_ins_address.Text = txt_ins_Phone.Text = txt_ins_Salary.Text = "";
            messag_added.Text = "Data Inserted";
        }


    }
#endregion
  
    protected void GridView1_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {
        obj = new ObjectDataSource();
        obj=(ObjectDataSource)Session["object"];
        obj.DeleteMethod = "Deleted_Ins";
        obj.DeleteParameters.Clear();
        Label id = (Label)GridView1.Rows[e.RowIndex].FindControl("Label2");
        obj.DeleteParameters.Add("Ins_Id",id.Text);
        obj.Delete();
        GridView1.DataSource = obj;
        GridView1.DataBind();
        Session["object"] = obj;


    }
    protected void GridView1_RowEditing(object sender, GridViewEditEventArgs e)
    {
        obj = new ObjectDataSource();
        obj=(ObjectDataSource)Session["object"];
        GridView1.EditIndex = e.NewEditIndex;
        GridView1.DataSource = obj;
        GridView1.DataBind();

    }
    protected void GridView1_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
    {
        obj = new ObjectDataSource();
        obj=(ObjectDataSource)Session["object"];
        GridView1.EditIndex = -1;
        GridView1.DataSource = obj;
        GridView1.DataBind();
    }

    protected void GridView1_RowUpdating(object sender, GridViewUpdateEventArgs e)
    {
        obj = new ObjectDataSource();
        obj = (ObjectDataSource)Session["object"];
        obj.TypeName = "B_Instractor";
        obj.UpdateMethod = "Update_Ins";
        obj.UpdateParameters.Clear();
        Label id = (Label)GridView1.Rows[e.RowIndex].FindControl("edit_ins_id");
        TextBox Ins_Name = (TextBox)GridView1.Rows[e.RowIndex].FindControl("edit_ins_name");
        TextBox Ins_Address = (TextBox)GridView1.Rows[e.RowIndex].FindControl("edit_ins_addrs");
        TextBox Ins_Email = (TextBox)GridView1.Rows[e.RowIndex].FindControl("edit_ins_email");
        TextBox Ins_Phone = (TextBox)GridView1.Rows[e.RowIndex].FindControl("edit_ins_phone");
        TextBox Ins_Salary = (TextBox)GridView1.Rows[e.RowIndex].FindControl("edit_ins_salary");
        DropDownList Detp_ID = (DropDownList)GridView1.Rows[e.RowIndex].FindControl("edit_ins_deptid");
        obj.UpdateParameters.Add("Ins_Id", id.Text);
        obj.UpdateParameters.Add("Ins_Name", Ins_Name.Text);
        obj.UpdateParameters.Add("Ins_Address", Ins_Address.Text);
        obj.UpdateParameters.Add("Ins_Email", Ins_Email.Text);
        obj.UpdateParameters.Add("Ins_Phone", Ins_Phone.Text);
        obj.UpdateParameters.Add("Salary", Ins_Salary.Text);
        obj.UpdateParameters.Add("Dept_id", Detp_ID.SelectedValue.ToString());
        obj.Update();

        GridView1.EditIndex = -1;
        GridView1.DataSource = obj;
        GridView1.DataBind();
        Session["object"] = obj;

    }
    protected void GridView1_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        obj = new ObjectDataSource();
        obj = (ObjectDataSource)Session["object"];
        GridView1.PageIndex = e.NewPageIndex;
        GridView1.DataSource = obj;
        GridView1.DataBind();
    }
}