using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class TakeExam : System.Web.UI.Page
{
    ObjectDataSource obj = new ObjectDataSource();
    int stid, crsid;

    protected void Page_Load(object sender, EventArgs e)
    {


        string path = HttpContext.Current.Request.Url.AbsolutePath;
        if (Auth_BLL.userlogged() == false)
            Response.Redirect("login.aspx?url=" + path);
        if (Auth_BLL.checkRole(Auth_BLL.currentUserId(), 2) == false)
             Auth_BLL.RouteUser();

        stid = Auth_BLL.currentUserId();
        if (Request.QueryString["crsid"] != null)
        {
            crsid = int.Parse(Request.QueryString["crsid"]);
        }
        else
        {
            Response.Redirect("StudentExamShow.aspx");
        }

    }
    protected void Btn_start_Click(object sender, EventArgs e)
    {
        
        obj.TypeName = "ExamBusinessLayer";
        obj.SelectMethod = "ShowExam";
        obj.SelectParameters.Clear();
        obj.SelectParameters.Add("st_id", stid.ToString());
        obj.SelectParameters.Add("crs_id", crsid.ToString());
        obj.Select();
        DataList_Exam.DataSource = obj;
        DataList_Exam.DataBind();

        if (DataList_Exam.Items.Count != 0)
        {
            MV_Exam.SetActiveView(V_ExamStarted);
            
            crsid = int.Parse(Request.QueryString["crsid"]);

           
             ViewState.Add("time", 60); 
            Timer_Exam.Enabled = true;

        }

        else
        {
            MV_Exam.SetActiveView(V_ExamEnded);
            lbl_ExamResult.Text = "you have no exam in this course";
        }

        

    }
    protected void Timer_Exam_Tick(object sender, EventArgs e)
    {
        int time;
        if (ViewState["time"] != null)
        {
            time = (int)ViewState["time"];
            if (time <= 0)
            {
                Btn_Submit_Click(Btn_Submit, new EventArgs());
                Timer_Exam.Enabled = false;
                return;
            }
            time--;
            lbl_time.Text = "00:" + time.ToString();
            ViewState["time"] = time;
        }
    }
    protected void Btn_Submit_Click(object sender, EventArgs e)
    {
        MV_Exam.SetActiveView(V_ExamEnded);
        Timer_Exam.Enabled = false;



        //==========Save Answers===========================

        #region Save Answers
        ObjectDataSource obj = new ObjectDataSource();
        obj.TypeName = "ExamBusinessLayer";
        obj.InsertMethod = "SaveAnswers";
        obj.Inserted += HandleCrud.obj_Inserted;
        obj.Updated += HandleCrud.obj_Updated;
      
        obj.Deleted += HandleCrud.obj_Deleted;
        //============session and query string==============
 
        crsid = int.Parse(Request.QueryString["crsid"]);
        int exid = 0;
        string answers = "", qid = "";
        foreach (DataListItem li in DataList_Exam.Items)
        {
            Label lbl_qid = (Label)li.FindControl("lbl_qid");
            qid += lbl_qid.Text + ",";
            Label lbl_exid = (Label)li.FindControl("lbl_eid");
            exid = int.Parse(lbl_exid.Text);
            RadioButton a = (RadioButton)li.FindControl("rbtn_A");

            RadioButton b = (RadioButton)li.FindControl("rbtn_B");

            RadioButton c = (RadioButton)li.FindControl("rbtn_C");

            RadioButton d = (RadioButton)li.FindControl("rbtn_D");


            if (a.Checked == true)
            {
                answers += "A" + ",";
            }
            else if (b.Checked == true)
            {
                answers += "B" + ",";
            }
            else if (c.Checked == true)
            {
                answers += "C" + ",";
            }

            else if (d.Checked == true)
            {
                answers += "D" + ",";
            }
            else
            {
                answers += "0" + ",";
            }

        }


        obj.InsertParameters.Add("st_id", stid.ToString());
        obj.InsertParameters.Add("ex_id", exid.ToString());
        obj.InsertParameters.Add("answers", answers);
        obj.InsertParameters.Add("ques_id", qid);

        int inserted = obj.Insert();

        #endregion

        #region ExamCorrection
        if (inserted > 0)
        {
            lbl_ExamResult.Text = "Exam Ended...........";
            obj.UpdateParameters.Clear();
            obj.UpdateMethod = "ExamCorrection";
            obj.UpdateParameters.Add("st_id", stid.ToString());
            obj.UpdateParameters.Add("ex_id", exid.ToString());

            int corrected = obj.Update();
            #region ExamResult
            if (corrected > 0)
            {
                obj.UpdateParameters.Clear();
                obj.UpdateMethod = "ExamResult";
                obj.UpdateParameters.Add("st_id", stid.ToString());
                obj.UpdateParameters.Add("ex_id", exid.ToString());
                obj.UpdateParameters.Add("crs_id", crsid.ToString());
                int grade = obj.Update();
                if (grade >= 50)
                {
                    lbl_ExamStatus.Text = "Congratulation you passed this exam with score=" + grade;
                }
                else
                {
                    lbl_ExamStatus.Text = "oops you failed in  this exam with score=" + grade;
                }
            }
            #endregion
        }
        #endregion


    }
}