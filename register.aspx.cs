using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class register : System.Web.UI.Page
{
    ObjectDataSource obj;
    protected void Page_Load(object sender, EventArgs e)
    {
        obj = new ObjectDataSource();
        obj.TypeName = "Auth_BLL";
        obj.Inserted += HandleCrud.obj_Inserted;
        Session.Add("obj2", obj);
    }
    protected void register_btn_Click(object sender, EventArgs e)
    {

        if (Page.IsValid == true)
        {
            obj = (ObjectDataSource)Session["obj2"];
            obj.InsertMethod = "Register";

            obj.InsertParameters.Clear();
            #region passingparamter
            obj.InsertParameters.Add("username", username_txt.Text);
            obj.InsertParameters.Add("pass", pass_txt.Text);
            obj.InsertParameters.Add("deptId", dept_ddl.SelectedValue);
            obj.InsertParameters.Add("sq", sq_txt.Text);
            obj.InsertParameters.Add("ans", answ_txt.Text);
            obj.InsertParameters.Add("phone", phone_txt.Text);
            obj.InsertParameters.Add("email", email_txt.Text);
            obj.InsertParameters.Add("address", address_txt.Text);
            obj.InsertParameters.Add("gender", gndr_ddl.SelectedValue);
            obj.InsertParameters.Add("job", job_ddl.SelectedValue);

            #endregion
            int affected = obj.Insert();

            if (affected > 0)
            {
                Msg_lbl.Text = "success";
                Msg_lbl.ForeColor = System.Drawing.Color.Green;
            }
            else
            {
                Msg_lbl.Text = username_txt.Text + "\t found in system";
                Msg_lbl.ForeColor = System.Drawing.Color.Red;
            }

        }
    }
}