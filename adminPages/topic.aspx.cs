using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

public partial class topic : System.Web.UI.Page
{
    ObjectDataSource obj;

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
           
            obj.TypeName = "TopicBusinessLayer";// repres name of class elly hyt3aml m3ah
            obj.SelectMethod = "SelectAllTopic";
            obj.Select();
            GridView1.DataSource = obj;
            GridView1.DataBind();
            obj.Inserted += HandleCrud.obj_Inserted;
            obj.Deleted += HandleCrud.obj_Deleted;
            obj.Updated += HandleCrud.obj_Updated;
            Session.Add("ob", obj);

            ObjectDataSource obje = new ObjectDataSource("TopicBusinessLayer", "SelectCourse");
            obje.Select();
            ddl_crsid.DataSource = obje;
            ddl_crsid.DataTextField = "Crs_Name";
            ddl_crsid.DataValueField = "Crs_Id";
            ddl_crsid.DataBind();
         

        }

    }
    protected void GridView1_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {
        obj = (ObjectDataSource)Session["ob"];
        obj.DeleteParameters.Clear();
        Label lid = (Label)GridView1.Rows[e.RowIndex].FindControl("lbl_design_id");
        Label cid = (Label)GridView1.Rows[e.RowIndex].FindControl("lbl_design_crsid");
        obj.DeleteParameters.Add("Top_Id", lid.Text);
        obj.DeleteParameters.Add("Crs_id", cid.Text);
        obj.DeleteMethod = "DeleteTopic";
        int delete = obj.Delete();
        GridView1.DataSource = obj;
        GridView1.DataBind();
        lbl_res.Text = delete + "row deleted";
        Session.Add("ob", obj);
    }
    protected void GridView1_RowEditing(object sender, GridViewEditEventArgs e)
    {
        obj = (ObjectDataSource)Session["ob"];
        GridView1.EditIndex = e.NewEditIndex; // مسكت اول row for editing
        GridView1.DataSource = obj;
        GridView1.DataBind();



    }
    protected void GridView1_RowUpdating(object sender, GridViewUpdateEventArgs e)
    {
        obj = (ObjectDataSource)Session["ob"];
        obj.UpdateParameters.Clear();
        obj.UpdateMethod = "editTopic";
        Label id = (Label)GridView1.Rows[e.RowIndex].FindControl("lbl_edit_id");
        TextBox name = (TextBox)GridView1.Rows[e.RowIndex].FindControl("txt_edit_name");
        DropDownList crsid = (DropDownList)GridView1.Rows[e.RowIndex].FindControl("ddl_edit_crsid");

        obj.UpdateParameters.Add("Top_Id", id.Text);
        obj.UpdateParameters.Add("Top_Name", name.Text);
        obj.UpdateParameters.Add("Crs_id", crsid.Text);

        int affected = obj.Update();
        GridView1.EditIndex = -1;
        GridView1.DataSource = obj;
        GridView1.DataBind();
        Session["ob"] = obj;

        lbl_res.Text = affected + "rows update";



    }
    protected void GridView1_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
    {
        obj = (ObjectDataSource)Session["ob"];
        GridView1.EditIndex = -1; ;//هنا بحول من edit to design mode
        GridView1.DataSource = obj;
        GridView1.DataBind();
    }
    protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
    {

    }
    protected void btn_insert_Click(object sender, EventArgs e)
    {
        obj = (ObjectDataSource)Session["ob"];// last value of object data source
        obj.InsertParameters.Clear();
        obj.InsertMethod = "insertTopic";

        //obj.InsertParameters.Add("Top_Id",txt_id.Text); //pass value
        obj.InsertParameters.Add("Top_Name", txt_name.Text);
        obj.InsertParameters.Add("Crs_id", ddl_crsid.SelectedValue);


        int affected = obj.Insert();
        GridView1.DataSource = obj;
        GridView1.DataBind();
        Session["ob"] = obj;
        lbl_res.Text = affected + "rows inserted";
        txt_name.Text = "";
        ddl_crsid.SelectedIndex = 0;



    }

    protected void txt_id_TextChanged(object sender, EventArgs e)
    {

    }

    //protected void btn_insert_Click1(object sender, EventArgs e)
    //{

    //    obj = (ObjectDataSource)Session["ob"];// last value of object data source
    //    obj.InsertParameters.Clear();
    //    obj.InsertMethod = "insertTopic";

    //    obj.InsertParameters.Add("Top_Name", txt_name.Text);
    //    obj.InsertParameters.Add("Crs_id", ddl_crsid.SelectedValue);


    //    int affected = obj.Insert();
    //    GridView1.DataSource = obj;
    //    GridView1.DataBind();
    //    Session["ob"] = obj;
    //    lbl_res.Text = affected + "rows inserted";
    //    txt_name.Text = "";
    //    ddl_crsid.SelectedIndex = 0;

    //}
}