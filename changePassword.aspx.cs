using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class changePassword : System.Web.UI.Page
{
    ObjectDataSource obj;
    protected void Page_Load(object sender, EventArgs e)
    {

        string path = HttpContext.Current.Request.Url.AbsolutePath;
        if (Auth_BLL.userlogged() == false)
            Response.Redirect("login.aspx?url=" + path);
        if ((Auth_BLL.checkRole(Auth_BLL.currentUserId(), 1) == false)
              && (Auth_BLL.checkRole(Auth_BLL.currentUserId(), 2) == false))
            Auth_BLL.RouteUser();




        obj = new ObjectDataSource();
        obj.TypeName = "Auth_BLL";
        obj.Updated += HandleCrud.obj_Updated;
        Session.Add("obj3", obj);
    }
    protected void change_btn_Click(object sender, EventArgs e)
    {
        if(Page.IsValid == true)
        {
            obj = (ObjectDataSource)Session["obj3"];
            obj.UpdateMethod = "changePass";
            obj.UpdateParameters.Clear();

            obj.UpdateParameters.Add("username",Auth_BLL.currentUsername());
            obj.UpdateParameters.Add("oldPass", oldpass_txt.Text);
            obj.UpdateParameters.Add("newPass", newPass_txt.Text);

           int affectedRows= obj.Update();
           if (affectedRows > 0)
               Message_lbl.Text = "password changed successfully";
           else
               Message_lbl.Text = "Incorrect old password";
        }
    }
}