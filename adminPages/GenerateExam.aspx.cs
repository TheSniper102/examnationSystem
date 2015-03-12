using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
public partial class GenerateExam : System.Web.UI.Page
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
            obj.TypeName = "StudentBusinessLayer";
            obj.SelectParameters.Clear();
            obj.SelectMethod = "selectCourseIdName";
            obj.Select();
            ddl_crs.DataSource = obj;//Crs_Id,Crs_Name
            ddl_crs.DataTextField = "Crs_Name";
            ddl_crs.DataValueField = "Crs_Id";
            ddl_crs.DataBind();

            obj.Inserted += HandleCrud.obj_Inserted;


        }
    }
    protected void btn_generate_Click(object sender, EventArgs e)
    {
        int mcq, tf;
        if (int.TryParse(txt_mcq.Text, out mcq) == false || mcq < 0)
        {
            lbl_res.Text = "please enter valid  mcq number";
            lbl_res.ForeColor = System.Drawing.Color.Red;
            return;
        }
        if ((int.TryParse(txt_tf.Text, out tf) == false) || tf < 0)
        {
            lbl_res.Text = "please enter valid  mcq number";
            lbl_res.ForeColor = System.Drawing.Color.Red;
            return;
        }
        ObjectDataSource ob = new ObjectDataSource();
        //SelectStudentInCourse
        ob.TypeName = "ExamBusinessLayer";
        ob.SelectParameters.Clear();
        ob.SelectMethod = "CheckQuestions";
        ob.SelectParameters.Add("crs_id", ddl_crs.SelectedValue);
        DataView dv = (DataView)ob.Select();
        DataSet ds = new DataSet();
        ds.Tables.Add(dv.ToTable());
        string count = ds.Tables[0].Rows[0]["con"].ToString();
        if (int.Parse(count) < 10)
        {
            lbl_res.Text = "this course has no enough questions";
            lbl_res.ForeColor = System.Drawing.Color.Red;
            return;
        }

        ob.TypeName = "ExamBusinessLayer";
        ob.SelectParameters.Clear();
        ob.SelectMethod = "SelectStudentInCourse";
        ob.SelectParameters.Add("crs_id", ddl_crs.SelectedValue);
        List<Int32> stlist = (List<Int32>)ob.Select();
        ob.Inserted += HandleCrud.obj_Inserted;
        ob.InsertMethod = "generateExam";
        foreach (Int32 stid in stlist)
        {


            ob.InsertParameters.Clear();
            ob.InsertParameters.Add("st_id", stid.ToString());
            ob.InsertParameters.Add("crs_id", ddl_crs.SelectedValue);
            ob.InsertParameters.Add("start_date", txt_stdate.Text);
            ob.InsertParameters.Add("end_date", txt_enddate.Text);
            ob.InsertParameters.Add("mcq", txt_mcq.Text);
            ob.InsertParameters.Add("tf", txt_tf.Text);


            ob.Insert();

            lbl_res.Text = "Exam Generated Successfully";
            lbl_res.ForeColor = System.Drawing.Color.Green;
            img_res.Visible = true;


        }



    }

}