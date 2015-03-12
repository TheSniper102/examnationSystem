using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Topic_for_Each_Course : System.Web.UI.Page
{
    ObjectDataSource obj = new ObjectDataSource();
    protected void Page_Load(object sender, EventArgs e)
    {
        string path = HttpContext.Current.Request.Url.AbsolutePath;
        if (Auth_BLL.userlogged() == false)
            Response.Redirect("~/login.aspx?url=" + path);
        //if not admin or instructor
        if ((Auth_BLL.checkRole(Auth_BLL.currentUserId(), 1) == false) &&
            (Auth_BLL.checkRole(Auth_BLL.currentUserId(), 3) == false))
            Response.Redirect("~/StudentHome.aspx");

        if (!Page.IsPostBack)
        {
            obj = new ObjectDataSource();
            obj.TypeName = "Course_BL";
            obj.SelectMethod = "select_course";
            obj.Select();
            ddl_topic.DataSource = obj;
            ddl_topic.DataTextField = "Crs_Name";
            ddl_topic.DataValueField = "Crs_id";
            ddl_topic.DataBind();
            Session.Add("obj1", obj);
            obj.Inserted += HandleCrud.obj_Inserted;
            obj.Updated += HandleCrud.obj_Updated;
            obj.Deleted += HandleCrud.obj_Deleted;
        }
    }
    protected void ddl_topic_SelectedIndexChanged(object sender, EventArgs e)
    {

    }
    protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
    {

    }
    protected void btn_show_Click(object sender, EventArgs e)
    {
        obj = (ObjectDataSource)Session["obj1"];
        obj.TypeName = "Course_BL";
        obj.SelectMethod = "select_topic_bycourse";
        obj.SelectParameters.Clear();
        obj.SelectParameters.Add("crs_id", ddl_topic.SelectedValue.ToString());
        obj.Select();
        ddl_topic.DataSource = obj;
        GridView1.DataSource = obj;
        GridView1.DataBind();
        Session.Add("obj1", obj);
    }
    protected void GridView1_RowUpdating(object sender, GridViewUpdateEventArgs e)
    {
        obj = (ObjectDataSource)Session["obj1"];
        obj.UpdateMethod = "updateTopic";
        obj.UpdateParameters.Clear();
        Label top_id = (Label)GridView1.Rows[e.RowIndex].FindControl("toplbedt");
        TextBox top_name = (TextBox)GridView1.Rows[e.RowIndex].FindControl("ntoptexedt");
       // TextBox crs_id = (TextBox)GridView1.Rows[e.RowIndex].FindControl("crstexedt");
        string crs_id = ((DropDownList)GridView1.Rows[e.RowIndex].FindControl("DDL_Crs")).SelectedValue.ToString();

        obj.UpdateParameters.Clear();
        obj.UpdateParameters.Add("id", top_id.Text);
        obj.UpdateParameters.Add("Name", top_name.Text);
      //  obj.UpdateParameters.Add("Crs_Id", crs_id.Text);
        obj.UpdateParameters.Add("Crs_Id", crs_id);

        obj.Update();
        GridView1.EditIndex = -1;
        GridView1.DataSource = obj;
        GridView1.DataBind();
        Session["obj1"] = obj;
    }
    protected void GridView1_RowEditing(object sender, GridViewEditEventArgs e)
    {
        obj = (ObjectDataSource)Session["obj1"];
        GridView1.EditIndex = e.NewEditIndex;
        GridView1.DataSource = obj;
        GridView1.DataBind();
    }
    protected void GridView1_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {
        obj = (ObjectDataSource)Session["obj1"];
        obj.DeleteMethod = "DeleteTopic";
        obj.DeleteParameters.Clear();
        Label id = (Label)GridView1.Rows[e.RowIndex].FindControl("toplbdes");
        obj.DeleteParameters.Add("ID", id.Text);
        obj.Delete();
        GridView1.DataSource = obj;
        GridView1.DataBind();
    }
    protected void GridView1_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
    {
        obj = (ObjectDataSource)Session["obj1"];
        GridView1.EditIndex = -1;
        GridView1.DataSource = obj;
        GridView1.DataBind();
    }
    protected void TextBox1_TextChanged(object sender, EventArgs e)
    {

    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        obj = (ObjectDataSource)Session["obj1"];
        obj.InsertMethod = "insertTopic";
        obj.InsertParameters.Clear();   // to clear all old parameters
        obj.InsertParameters.Add("name", TextBox1.Text);


        obj.InsertParameters.Add("Course_id", DropDownList1.SelectedValue);
        int inserted = obj.Insert();
        Session["obj"] = obj;
        GridView1.DataSource = obj;
        GridView1.DataBind();

        if (inserted > 0)
        {

            lbl.Text = "inserted sucessfully";
            lbl.ForeColor = System.Drawing.Color.Green;
        }

    }
}