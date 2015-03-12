using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Text;
public partial class forgotPassword : System.Web.UI.Page
{
    ObjectDataSource obj;
    DataSet ds;
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
            obj = new ObjectDataSource();
            obj.TypeName = "Auth_BLL";
            obj.Updated += HandleCrud.obj_Updated;
            Session.Add("obj1", obj);
        }
    }
    protected void reset_btn_Click(object sender, EventArgs e)
    {
        if (Page.IsValid == true)
        {
            obj = new ObjectDataSource();
            obj = (ObjectDataSource)Session["obj1"];
            obj.SelectMethod = "resetPass";
            obj.SelectParameters.Clear();
            obj.SelectParameters.Add("username", username_txt.Text);
            try
            {
                int trials = (Session["trials"] != null) ? Convert.ToInt32(Session["trials"]) : 0;

                if (trials == 0)
                    Session.Add("trials", trials);

                if (trials > 3)
                {

                    rest_lbl.Text = "max trials reached";
                    username_txt.Attributes.Add("readonly", "readonly");
                    return;
                }


                var dv = (DataView)obj.Select();
                if (dv != null && dv.Count > 0)
                {
                    ds = new DataSet();
                    ds.Tables.Add(dv.ToTable());
                    sq_txt.Text = ds.Tables[0].Rows[0]["security_question"].ToString();
                    Session.Add("ans", ds.Tables[0].Rows[0]["question_answer"].ToString());
                    Session.Add("user", ds.Tables[0].Rows[0]["username"].ToString());
                    forgt_mv.ActiveViewIndex = 1;
                }
                else
                {
                    rest_lbl.Text = "sorry no user with that name in the system";

                    trials++;
                    Session["trials"] = trials;
                    

                }
            }
            catch (Exception ex)
            {
                rest_lbl.Text = ex.InnerException.Message;
            }
        }
    }
    protected void vaidate_btn_Click(object sender, EventArgs e)
    {
        if (Page.IsValid == true)
        {

            int trials = (Session["trials"] != null) ? Convert.ToInt32(Session["trials"]) : 0;

            if (trials == 0)
                Session.Add("trials", trials);

            if (trials > 3)
            {

                Mesasage.Text = "max trials reached";
                ans_txt.Attributes.Add("readonly", "readonly");
                return;
            }



            if (string.Compare(ans_txt.Text, Session["ans"].ToString()) == 0)
                forgt_mv.ActiveViewIndex = 2;
            else
            {
                trials++;
                Session["trials"] = trials;
                Mesasage.Text = "inValid answer";
            }
        }
    }
    protected void chng_btn_Click(object sender, EventArgs e)
    {
        if (Page.IsValid == true)
        {
            obj = new ObjectDataSource();
            obj = (ObjectDataSource)Session["obj1"];
            obj.UpdateMethod = "ForgotPass";
            obj.UpdateParameters.Clear();
            obj.UpdateParameters.Add("username", Session["user"].ToString());
            obj.UpdateParameters.Add("newPass", Auth_BLL.hash_pass(new_txt.Text));
            try
            {
                int affectedRows = obj.Update();
                if (affectedRows > 0)
                    Response.Redirect("login.aspx", false);
                else
                    Label6.Text = "failed updating";
            }
            catch (Exception ex)
            {
                Label6.Text = ex.InnerException.Message;
            }
        }
    }
}