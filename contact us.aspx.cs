using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

public partial class _Default : System.Web.UI.Page
{ObjectDataSource obj = new ObjectDataSource();
    protected void Page_Load(object sender, EventArgs e)
    {
        
        obj.Inserted += HandleCrud.obj_Inserted;
    }
    protected void btn_contact_Click(object sender, EventArgs e)
    {
        
        obj.InsertParameters.Clear();
        obj.TypeName = "TopicBusinessLayer";
        obj.InsertMethod = "insertcontact";

        obj.InsertParameters.Add("Email", txt_email.Text); //pass value
        obj.InsertParameters.Add("FullName", txt_name.Text);
        obj.InsertParameters.Add("Phone",txt_phone.Text);
      
        obj.InsertParameters.Add("Message", txt_message.Text);
        int affected=obj.Insert();
        Session["ob"] = obj;
        Label1.Text = affected + "rows inserted";
        txt_email.Text = "";
        txt_name.Text = "";
        txt_phone.Text = "";
        txt_message.Text = "";
       
            

    }
}