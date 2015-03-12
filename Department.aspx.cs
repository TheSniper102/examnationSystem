using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
public partial class Department : System.Web.UI.Page
{
    ObjectDataSource obj;
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {  
            obj = new ObjectDataSource();
            obj.TypeName = "Department_BLL";
            obj.SelectMethod = "getAllDepts";
            obj.SelectParameters.Clear();
            obj.Select();
            Dept_grd.DataSource = obj;
            Dept_grd.DataBind();
            Session.Add("obj1", obj);
            obj.Updated  += HandleCrud.obj_Updated;
            obj.Deleted  += HandleCrud.obj_Deleted;
            obj.Inserted += HandleCrud.obj_Inserted;
           
        }
        
    }
    protected void Dept_grd_RowEditing(object sender, GridViewEditEventArgs e)
    {
        obj = (ObjectDataSource)Session["obj1"];
        Dept_grd.EditIndex = e.NewEditIndex;
        Dept_grd.DataSource = obj;
        Dept_grd.DataBind();
    }
    //update
    protected void Dept_grd_RowUpdating(object sender, GridViewUpdateEventArgs e)
    {
        obj = (ObjectDataSource)Session["obj1"];
        obj.UpdateMethod = "updateDept";
        obj.UpdateParameters.Clear();
        Label id = (Label)Dept_grd.Rows[e.RowIndex].FindControl("Dept_Id_edit");
        TextBox Dept_name = (TextBox)Dept_grd.Rows[e.RowIndex].FindControl("Dept_Name_edit");
        TextBox Dept_desc = (TextBox)Dept_grd.Rows[e.RowIndex].FindControl("Dept_Desc_edit");
        TextBox location = (TextBox)Dept_grd.Rows[e.RowIndex].FindControl("Dept_Location_edit");
        
        obj.UpdateParameters.Add("deptId", id.Text);
        obj.UpdateParameters.Add("name", Dept_name.Text);
        obj.UpdateParameters.Add("desc", Dept_desc.Text);
        obj.UpdateParameters.Add("loc", location.Text);

       int affectedRows= obj.Update();
       if (affectedRows > 0) txtbx.Text = affectedRows.ToString() + "affeceted row";
       else txtbx.Text = "row not found";

        Dept_grd.EditIndex = -1;
        Dept_grd.DataSource = obj;
        Dept_grd.DataBind();
        Session["obj1"] = obj;
    }
    //delete
    protected void Dept_grd_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {
        obj = (ObjectDataSource)Session["obj1"];
        obj.DeleteMethod = "deleteDept";
        obj.DeleteParameters.Clear();
        Label id = (Label)Dept_grd.Rows[e.RowIndex].FindControl("Dept_Id");
        obj.DeleteParameters.Add("deptId", id.Text);
        int affectedRows = obj.Delete();
       if (affectedRows > 0) txtbx.Text = affectedRows.ToString() + "affeceted row";
       else txtbx.Text = "row not found";
        Dept_grd.DataSource = obj;
        Dept_grd.DataBind();
        Session["obj1"] = obj;
    }
    protected void Dept_grd_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
    {
        obj = (ObjectDataSource)Session["obj1"];
        Dept_grd.EditIndex = -1;
        Dept_grd.DataSource = obj;
        Dept_grd.DataBind();

    }


    protected void saveDept_btn_Click(object sender, EventArgs e)
    {
       
        if(Page.IsValid == true)
        {
            obj = (ObjectDataSource)Session["obj1"];
            obj.InsertMethod = "insertDept";
            obj.InsertParameters.Clear();
            obj.InsertParameters.Add("name", deptName_txt.Text);
            obj.InsertParameters.Add("desc", deptDesc_txt.Text);
            obj.InsertParameters.Add("loc" , deptLoc_txt.Text);

            int affectedRows=obj.Insert();

            if (affectedRows > 0) txtbx.Text = affectedRows.ToString() + "affeceted row";
            else txtbx.Text = "Department with name " + deptName_txt.Text + "\tin " + deptLoc_txt.Text+"\t in system";

            Dept_grd.DataSource = obj;
            Dept_grd.DataBind();

            Session["obj1"] = obj;
        }
    }
    protected void CustomValidator2_ServerValidate(object source, ServerValidateEventArgs args)
    {
        args.IsValid = (args.Value).Length >= 7;
    }
}