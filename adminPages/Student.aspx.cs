using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Drawing;

public partial class Student : System.Web.UI.Page
{
    ObjectDataSource obj = new ObjectDataSource();
    protected void Page_Load(object sender, EventArgs e)
    {
        string path = HttpContext.Current.Request.Url.AbsolutePath;
        if (Auth_BLL.userlogged() == false)
            Response.Redirect("~/login.aspx?url=" + path);
        if (Auth_BLL.checkRole(Auth_BLL.currentUserId(), 1) == false)
            Auth_BLL.RouteUser();

        if (!IsPostBack)
        {
            //=============fill drop down list=========================

            ObjectDataSource deptobj = new ObjectDataSource("StudentBusinessLayer", "SelectDept");
            deptobj.Select();
            ddl_dept.DataSource = deptobj;
            ddl_dept.DataTextField = "Dept_Name";
            ddl_dept.DataValueField = "Dept_Id";

            ddl_dept.DataBind();

            //ListItem li = new ListItem("--select department--", "0");
            //ddl_dept.Items.Add(li);
            //StudentBusinessLayer.Fill_DropDownList(ddl_dept);
            //=============fill grid view==============================
            obj.TypeName = "StudentBusinessLayer";
            obj.SelectParameters.Clear();
            obj.SelectMethod = "SelectAllStudent";
            obj.Select();
            Student_GridView.DataSource = obj;
            Student_GridView.DataBind();
            Session.Add("object", obj);


            obj.Inserted += HandleCrud.obj_Inserted;
            obj.Updated += HandleCrud.obj_Updated;
            obj.Deleted += HandleCrud.obj_Deleted;
           // obj.Selected += HandleCrud.obj_selected;
        }
    }
    #region object_eventhandler
    //void obj_Inserted(object sender, ObjectDataSourceStatusEventArgs e)
    //{

    //    e.AffectedRows = (int)e.ReturnValue;

    //}
    //void obj_Updated(object sender, ObjectDataSourceStatusEventArgs e)
    //{

    //    e.AffectedRows = (int)e.ReturnValue;

    //}

    //void obj_Deleted(object sender, ObjectDataSourceStatusEventArgs e)
    //{

    //    e.AffectedRows = (int)e.ReturnValue;

    //} 
    #endregion

    protected void btn_cancel_Click(object sender, EventArgs e)
    {
        txt_address.Text = "";
        txt_age.Text = "";
        txt_email.Text = "";
        txt_name.Text = "";
        txt_phone.Text = "";
        ddl_dept.SelectedIndex = 0;
        MV_Student.SetActiveView(V_Add);
    }
    protected void LinkBtn_Click(object sender, EventArgs e)
    {
        txt_address.Text = "";
        txt_age.Text = "";
        txt_email.Text = "";
        txt_name.Text = "";
        txt_phone.Text = "";
        ddl_dept.SelectedIndex = 0;
        MV_Student.SetActiveView(V_Insert);
    }
    protected void Student_GridView_RowEditing(object sender, GridViewEditEventArgs e)
    {
        Student_GridView.EditIndex = e.NewEditIndex;
        obj = (ObjectDataSource)Session["object"];

        Student_GridView.DataSource = obj;
        Student_GridView.DataBind();
    }
    protected void Student_GridView_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
    {
        Student_GridView.EditIndex = -1;

        obj = (ObjectDataSource)Session["object"];

        Student_GridView.DataSource = obj;
        Student_GridView.DataBind();
    }
    protected void Student_GridView_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {
        obj = (ObjectDataSource)Session["object"];
        obj.DeleteParameters.Clear();
        obj.DeleteMethod = "DeleteStudent";
        Label stid = (Label)Student_GridView.Rows[e.RowIndex].FindControl("lbl_des_stid");
        obj.DeleteParameters.Add("ST_id", stid.Text);
        int deleted = obj.Delete();
        lbl_res.Text = deleted + " rows Deleted";
        img_gvres.Visible = true;
        Student_GridView.DataSource = obj;
        Student_GridView.DataBind();
        Session["object"] = obj;
    }
    protected void Student_GridView_RowUpdating(object sender, GridViewUpdateEventArgs e)
    {
        obj = (ObjectDataSource)Session["object"];
        obj.UpdateParameters.Clear();
        obj.UpdateMethod = "UpdateStudent";
        Label id = (Label)Student_GridView.Rows[e.RowIndex].FindControl("lbl_edit_stid");
        TextBox name = (TextBox)Student_GridView.Rows[e.RowIndex].FindControl("txt_edit_name");
        TextBox age = (TextBox)Student_GridView.Rows[e.RowIndex].FindControl("txt_edit_age");
        TextBox address = (TextBox)Student_GridView.Rows[e.RowIndex].FindControl("txt_edit_address");
        TextBox phone = (TextBox)Student_GridView.Rows[e.RowIndex].FindControl("txt_edit_phone");
        TextBox email = (TextBox)Student_GridView.Rows[e.RowIndex].FindControl("txt_edit_email");

        DropDownList dept = (DropDownList)Student_GridView.Rows[e.RowIndex].FindControl("ddl_edit_dept");

        DropDownList active = (DropDownList)Student_GridView.Rows[e.RowIndex].FindControl("act_ddl");
        obj.UpdateParameters.Add("ST_id", id.Text);
        if (name.Text.Length <= 50)
            obj.UpdateParameters.Add("Name", name.Text);
        else
        {
            lbl_res.Text = "Too long name it must be less than 50 character";
            lbl_res.ForeColor = Color.Red;
            return;
        }
        //========age must be anumber========
        int aage;
        if (int.TryParse(age.Text, out aage))
        {
            obj.UpdateParameters.Add("Age", age.Text);
        }
        else
        {
            lbl_res.Text = "invalid age";
            lbl_res.ForeColor = Color.Red;
            return;
        }
        if (address.Text.Length <= 50)
            obj.UpdateParameters.Add("Address", address.Text);
        else
        {
            lbl_res.Text = "Too long address it must be less than or equel 50 character";
            lbl_res.ForeColor = Color.Red;
            return;
        }
        if (phone.Text.Length <= 12)
            obj.UpdateParameters.Add("phone", phone.Text);
        else
        {
            lbl_res.Text = "Too long phone it must be less  than or equel 11 character";
            lbl_res.ForeColor = Color.Red;
            return;
        }
        if (email.Text.Length <= 50)
        {
            if (email.Text.Contains('@') && email.Text.Contains('.'))
                obj.UpdateParameters.Add("E_Mail", email.Text);
            else
            {
                lbl_res.Text = "invalid email it must be xxx@xxx.xx";
                lbl_res.ForeColor = Color.Red;
                return;
            }

        }
        else
        {
            lbl_res.Text = "Too long email it must be less than or equel 50 character";
            lbl_res.ForeColor = Color.Red;
            return;
        }
        obj.UpdateParameters.Add("DeptNo", dept.Text);
        obj.UpdateParameters.Add("img","null");
        obj.UpdateParameters.Add("active", active.SelectedValue.ToString());
        int updated = obj.Update();
        Student_GridView.EditIndex = -1;
        Student_GridView.DataSource = obj;
        Student_GridView.DataBind();
        Session["object"] = obj;
        if (updated > 0)
        {
            lbl_res.Text = "success";
            lbl_res.ForeColor = Color.Green;
            img_gvres.Visible = true;
        }else
        {
            lbl_res.Text = "update failed";
            lbl_res.ForeColor = Color.Red;
            
        }
    }
    protected void btn_save_Click(object sender, EventArgs e)
    {
        
            if (txt_name.Text.Length <= 50)
            {
                if (txt_address.Text.Contains(','))
                {
                    if (txt_address.Text.Length <= 50)
                    {
                        obj = (ObjectDataSource)Session["object"];
                        obj.InsertParameters.Clear();
                        obj.InsertMethod = "insertStudent";

                        obj.InsertParameters.Add("Name", txt_name.Text);
                        obj.InsertParameters.Add("Age", txt_age.Text);
                        obj.InsertParameters.Add("Address", txt_address.Text);
                        obj.InsertParameters.Add("phone", txt_phone.Text);
                        obj.InsertParameters.Add("E_Mail", txt_email.Text);
                        obj.InsertParameters.Add("Pass",txt_pass.Text);
                        obj.InsertParameters.Add("Gender",ddl_gender.SelectedValue);
                        obj.InsertParameters.Add("SecQues",txt_secq.Text);
                        obj.InsertParameters.Add("SecAns",txt_secans.Text);
                        //=======no dept===========
                        obj.InsertParameters.Add("DeptNo", ddl_dept.SelectedValue);
                        obj.InsertParameters.Add("active", "1");
                        int inserted = obj.Insert();
                        Student_GridView.DataSource = obj;
                        Student_GridView.DataBind();
                        Session["object"] = obj;
                        if (inserted == -1)
                        {
                            lbl_result.Text = "this student already exists";
                            lbl_result.ForeColor = Color.Red;
                        }
                        else if (inserted == 1)
                        {
                            lbl_result.Text = "student saved successfully";
                            lbl_result.ForeColor = Color.Green;
                            img_result.Visible = true;
                        }

                    }
                    else
                    {
                        txt_address.Focus();
                        lbl_result.Text = "address must be less than 50 character";
                        lbl_result.ForeColor = Color.Red;
                    }
                }
                else
                {
                    txt_address.Focus();
                    lbl_result.Text = "address must be mansoura,gehan st";
                    lbl_result.ForeColor = Color.Red;
                }
            }
            else
            {
                txt_name.Focus();
                lbl_result.Text = "name must be less than 50 character";
                lbl_result.ForeColor = Color.Red;
            }
        


    }
    protected void txt_name_TextChanged(object sender, EventArgs e)
    {
        if (!txt_name.Text.Contains(' '))
        {
            txt_name.Focus();
           lbl_name_error.Text = "full name must be like [mohammed ahmed mahmoud] seprated by spaces";
           lbl_name_error.ForeColor = Color.Red;

            return;
        }
        if (txt_name.Text.Length > 50)
        {
            txt_name.Focus();
            lbl_name_error.Text = "full name must be less than or equel 50 character";
            lbl_name_error.ForeColor = Color.Red;
        }
    }
    protected void txt_address_TextChanged(object sender, EventArgs e)
    {
        if (!txt_address.Text.Contains(','))
        {
            txt_address.Focus();
            lbl_address_error.Text = "address must be like [mansoura,Gehan st] seprated by ,";
            lbl_address_error.ForeColor = Color.Red;

            return;
        }
        if (txt_address.Text.Length > 50)
        {
            txt_address.Focus();
            lbl_address_error.Text = "address must be less than or equel 50 character";
            lbl_address_error.ForeColor = Color.Red;
        }
    }
    protected void btn_search_Click(object sender, EventArgs e)
    {
        int id;

        if(ddl_search.SelectedValue=="0")
        {
            if(!int.TryParse(txt_seach.Text,out id))
            {
                lbl_search.Text = "Please enter valid id[interger value]";
                return;
            }
        }
        obj.TypeName = "StudentBusinessLayer";
        obj.SelectParameters.Clear();
        obj.SelectMethod = "SearchStudent";
        obj.SelectParameters.Add("searchtype",ddl_search.SelectedValue);
        obj.SelectParameters.Add("searchword", txt_seach.Text);
        obj.Select();
        Student_GridView.DataSource = obj;
        Student_GridView.DataBind();
        Session.Add("object", obj);

    }
}