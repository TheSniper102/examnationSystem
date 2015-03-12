using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Question : System.Web.UI.Page
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
            obj.TypeName = "QuestionBusinnessLayer";
            obj.SelectMethod = "selectAllQuestion";
            obj.Select();
            GridView1.DataSource = obj;
            GridView1.DataBind();
            Session.Add("obj", obj);
        }

        MultiView1.SetActiveView(View1);
    }
    protected void GridView1_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {
        obj = (ObjectDataSource)Session["obj"];
        obj.DeleteMethod = "deleteQuestion";
        obj.DeleteParameters.Clear();
        Label id = (Label)GridView1.Rows[e.RowIndex].FindControl("lb_id");
        obj.DeleteParameters.Add("ID", id.Text);
        obj.Delete();
        GridView1.DataSource = obj;
        GridView1.DataBind();
        Session["obj"] = obj;
    }
 
    protected void GridView1_RowEditing(object sender, GridViewEditEventArgs e)
    {
        obj = (ObjectDataSource)Session["obj"];
        GridView1.EditIndex = e.NewEditIndex;
        GridView1.DataSource = obj;
        GridView1.DataBind();
    }
    protected void GridView1_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
    {
        obj = (ObjectDataSource)Session["obj"];
        GridView1.EditIndex = -1;
        GridView1.DataSource = obj;
        GridView1.DataBind();
    }

    protected void GridView1_RowUpdating(object sender, GridViewUpdateEventArgs e)
    {

        obj = (ObjectDataSource)Session["obj"];
        obj.UpdateMethod = "updateQuestion";
        obj.UpdateParameters.Clear();

        Label id = (Label)GridView1.Rows[e.RowIndex].FindControl("lb_d");
        TextBox desc = (TextBox)GridView1.Rows[e.RowIndex].FindControl("txt_desc");
        TextBox type = (TextBox)GridView1.Rows[e.RowIndex].FindControl("txt_type");
        TextBox cha = (TextBox)GridView1.Rows[e.RowIndex].FindControl("txt_A");
        TextBox chb = (TextBox)GridView1.Rows[e.RowIndex].FindControl("txt_B");
        TextBox chc = (TextBox)GridView1.Rows[e.RowIndex].FindControl("txt_C");
        TextBox chd = (TextBox)GridView1.Rows[e.RowIndex].FindControl("txt_D");
        //  TextBox ans = (TextBox)GridViewQuestion.Rows[e.RowIndex].FindControl("txtAns_edit");

        string tf = ((DropDownList)GridView1.Rows[e.RowIndex].FindControl("DDL_TF")).SelectedValue.ToString();
        string choice = ((DropDownList)GridView1.Rows[e.RowIndex].FindControl("DDL_Choice")).SelectedValue.ToString();

        string crs = ((DropDownList)GridView1.Rows[e.RowIndex].FindControl("DDL_Crs")).SelectedValue.ToString();

        obj.UpdateParameters.Add("ID", id.Text);
        obj.UpdateParameters.Add("Describtion", desc.Text);
        obj.UpdateParameters.Add("CNo", crs);
        if (type.Text == "T/F")            //"True/False":"Multi Choice"
        {
            obj.UpdateParameters.Add("Type", "2");
            obj.UpdateParameters.Add("Answer", tf);

        }
        else if (type.Text == "Choice")//T/F":"Choice
        {
            obj.UpdateParameters.Add("Type", "1");
            obj.UpdateParameters.Add("Answer", choice);
        }

        obj.UpdateParameters.Add("A", cha.Text);
        obj.UpdateParameters.Add("B", chb.Text);
        obj.UpdateParameters.Add("C", chc.Text);
        obj.UpdateParameters.Add("D", chd.Text);


        obj.Update();
        GridView1.EditIndex = -1;
        GridView1.DataSource = obj;
        GridView1.DataBind();

    }
    protected void btn_newQuestion_Click(object sender, EventArgs e)
    {
        //MultiView1.SetActiveView(View2);
        MultiView1.ActiveViewIndex = 1;
        div_choice.Visible = false;
        div_true.Visible = false;
        DDL_Type.SelectedValue = "0";
    }


    protected void DDL_Type_SelectedIndexChanged(object sender, EventArgs e)
    {
        if (DDL_Type.SelectedValue == "1")
        {
            div_choice.Visible = true;
            div_true.Visible = false;
            MultiView1.SetActiveView(View2);
        }
        else if (DDL_Type.SelectedValue == "2")
        {
            div_true.Visible = true;
            div_choice.Visible = false;
            MultiView1.SetActiveView(View2);
        }
        else {
            div_true.Visible = false;
            div_choice.Visible = false;
            MultiView1.SetActiveView(View2);
        }
    }
    protected void btn_canCH_Click(object sender, EventArgs e)
    {

         txt_desc.Text = "";
        txt_a.Text = "";
        txt_b.Text = "";
        txt_c.Text = "";
        txt_d.Text = "";
        DDL_Type.SelectedValue = "0";
        MultiView1.SetActiveView(View1);
    }
    protected void btn_canTF_Click(object sender, EventArgs e)
    {
        DDL_Type.SelectedValue = "0";
        MultiView1.SetActiveView(View1);
    }

    public void save() 
    {
        obj = (ObjectDataSource)Session["obj"];
        obj.InsertMethod = "InsertQuestion";
        obj.InsertParameters.Clear();


        obj.InsertParameters.Add("Describtion", txt_desc.Text);
        //question type multi chooice
        if (DDL_Type.SelectedValue == "1")
            obj.InsertParameters.Add("Answer", DDl_Ans.SelectedValue);
        // question type true/false
        if (DDL_Type.SelectedValue == "2")
            obj.InsertParameters.Add("Answer", trueFalseRadio.SelectedValue);


        obj.InsertParameters.Add("Type", DDL_Type.SelectedValue.ToString());
        obj.InsertParameters.Add("CNo", DDL_Crs.SelectedValue);
        //if question type multiChoice

        obj.InsertParameters.Add("A", txt_a.Text);
        obj.InsertParameters.Add("B", txt_b.Text);
        obj.InsertParameters.Add("C", txt_c.Text);
        obj.InsertParameters.Add("D", txt_d.Text);
        obj.Insert();

        GridView1.DataSource = obj;
        GridView1.DataBind();
        Session["obj"] = obj;
        txt_desc.Text = "";
        txt_a.Text = "";
        txt_b.Text = "";
        txt_c.Text = "";
        txt_d.Text = "";
       
        MultiView1.SetActiveView(View2);
        DDL_Type.SelectedValue = "0";
    }
    protected void btn_saveCH_Click(object sender, EventArgs e)
    {
        save();
        lb_msg.Visible = true;

    }
    protected void btn_saveTF_Click(object sender, EventArgs e)
    {
        save();
     
        lb_msg.Visible = true;
        
    }
}