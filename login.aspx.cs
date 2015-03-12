using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;

public partial class auth : System.Web.UI.Page
{
    ObjectDataSource obj;
    static DataSet ds;
    protected void Page_Load(object sender, EventArgs e)
    {

        if (Auth_BLL.userlogged() == true)
            Auth_BLL.RouteUser();
    }
    protected void lgn_btn_Click(object sender, EventArgs e)
    {


        if (Page.IsValid == true)
        {
            ds = new DataSet();
            obj = new ObjectDataSource();
            obj.TypeName = "Auth_BLL";
            obj.SelectMethod = "login";
            obj.SelectParameters.Clear();
            obj.SelectParameters.Add("username", username_txt.Text);
            obj.SelectParameters.Add("pass", pass_txt.Text);

            #region trails
            int trials = (Session["lgntrials"] != null) ? Convert.ToInt32(Session["lgntrials"]) : 0;

            if (trials == 0)
                Session.Add("lgntrials", trials);

            if (trials > 3)
            {

                Msg_lbl.Text = "max trials reached";
                username_txt.Attributes.Add("readonly", "readonly");
                return;
            }
            #endregion
            var dv = (DataView)obj.Select();
            if (dv != null && dv.Count > 0)
            {
                ds.Tables.Add(dv.ToTable());
                int firstColumn = int.Parse(ds.Tables[0].Rows[0][0].ToString());

                int activeUser = int.Parse(ds.Tables[0].Rows[0]["active"].ToString());

                if (activeUser != 1)
                {
                    Msg_lbl.Text = "acount need to be activated by admin contact admin";
                    trials++;
                    Session["lgntrials"] = trials;
                    return;
                }
                if (ds.Tables[0].Rows.Count == 1 && firstColumn != 0)
                {
                    Session.Add("userInfo", ds);
                    if (rmmbr.Checked == true)
                        Auth_BLL.CreateAuthCookie(username_txt.Text, pass_txt.Text);

                    string rurl = HttpContext.Current.Request.QueryString["url"] != null ? HttpContext.Current.Request.QueryString["url"] : string.Empty;
                    if (!string.IsNullOrEmpty(rurl))
                    {
                        rurl = rurl.TrimStart('/');
                        HttpContext.Current.Response.Redirect(rurl);
                    }
                    else
                        Auth_BLL.RouteUser();

                }
                else
                {
                    Msg_lbl.Text = "Invalid username or password";
                    trials++;
                    Session["lgntrials"] = trials;
                }
            }
            Msg_lbl.Text = "Invalid username or password";
            trials++;
            Session["lgntrials"] = trials;
        }

    }

}