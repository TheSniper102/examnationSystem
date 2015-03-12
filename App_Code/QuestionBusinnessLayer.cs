﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

/// <summary>
/// Summary description for QuestionBusinnessLayer
/// </summary>
public class QuestionBusinnessLayer
{
    public static DataSet selectAllQuestion()
    {
        DataSet ds = new DataSet();
        string qry = "SP_selectQuestion";
        ds = DataAccessLayer.SelectAllByProcedure(qry);
        return ds;
    }

    public static DataSet selectAllQuestionById(int ID) 
    {
        DataSet ds = new DataSet();
        string qry = "select q.ID,q.Describtion,q.Answer,q.Type,q.CNo,c.Q_id,c.A,c.B,c.C,c.D from Qestions q,Multi_Choice c where q.ID=c.Q_id and q.ID=" + ID.ToString();
        ds = DataAccessLayer.SelectAll(qry);
        return ds;
    }
   
    public static DataSet selectQuestionPerCourse(int Cno)
    {
        DataSet ds = new DataSet();
        string qry = "select q.ID,q.Describtion,c.A,c.B,c.C,c.D,q.Answer from Qestions q,Multi_Choice c where q.ID=c.Q_id and q.CNo="+Cno.ToString();
     //   ds = DataAccessLayer.SelectAll(qry);
        ds = DataAccessLayer.runQuery(qry);
        return ds;

    }

    public static DataSet selectQuestionWithCourseName() 
    {
        DataSet ds = new DataSet();
        string qry = "SP_selectQuestionDataWithCourseName";
        ds = DataAccessLayer.SelectAllByProcedure(qry);
       // ds = DataAccessLayer.selectProc();

        return ds;
    }
    
    public static int updateQuestion(int ID, string Describtion, string Answer, string Type, int CNo,string A,string B,string C=null,string D=null)
    {
            string qry = "SP_updateQuestionByID";
            //int effect = DataAccessLayer.RunDml(qry, new SqlParameter("@ID", ID), new SqlParameter("@Describtion", Describtion),
            //                                    new SqlParameter("@Answer", Answer), new SqlParameter("@Type", Type), new SqlParameter("@CNo", CNo),
            //                                    new SqlParameter("@A", A), new SqlParameter("@B", B), new SqlParameter("@C", C), new SqlParameter("@D", D));

            int effect = DataAccessLayer.CUDQuery(qry, new SqlParameter("@ID", ID), new SqlParameter("@Describtion", Describtion),
                                                   new SqlParameter("@Answer", Answer), new SqlParameter("@Type", Type), new SqlParameter("@CNo", CNo),
                                                   new SqlParameter("@A", A), new SqlParameter("@B", B), new SqlParameter("@C", C), new SqlParameter("@D", D));
       
        return effect;
    }

    public static int deleteQuestion(int ID)
    {
        string qry = "SP_DeleteQuestion";
      //  int effect = DataAccessLayer.RunDml(qry,new SqlParameter("@ID",ID));
        int effect = DataAccessLayer.CUDQuery(qry, new SqlParameter("@ID", ID));
       
        return effect;
    }

    public static int InsertQuestion(string Describtion, string Answer, string Type , int CNo, string A="A", string B="B", string C=null, string D=null)
    {

        string qry = "SP_InsertQuestion";
       int effect;
      
         //effect = DataAccessLayer.RunDml(qry, new SqlParameter("@Describtion", Describtion), new SqlParameter("@Answer", Answer),
         //                                   new SqlParameter("@Type", Type), new SqlParameter("@CNo", CNo),new SqlParameter("@A",A),
         //                                   new SqlParameter("@B",B),new SqlParameter("@C",C),new SqlParameter("@D",D)   );
       effect = DataAccessLayer.CUDQuery(qry, new SqlParameter("@Describtion", Describtion), new SqlParameter("@Answer", Answer),
                                          new SqlParameter("@Type", Type), new SqlParameter("@CNo", CNo), new SqlParameter("@A", A),
                                          new SqlParameter("@B", B), new SqlParameter("@C", C), new SqlParameter("@D", D));

        
        
        return effect;
    }

    public static DataSet ExamByDate(DateTime d)
    {
        DataSet ds = new DataSet();

        string qry = "SP_ExamByDate";
        ds = DataAccessLayer.selectProc(qry, new SqlParameter("@d",(d.Year+"-"+ d.Month+"-"+d.Day)));
        return ds;
    }

    public static DataSet selectCorectiveStudentByCourse(int crs) 
    {

        DataSet ds = new DataSet();
        string qry = "SP_Student_corrective_Bycourse";
        ds = DataAccessLayer.selectProc(qry, new SqlParameter("@crs",crs));
        return ds;
    }
    
    public static DataSet selectCorectiveStudentBydept(int dept)
    {

        DataSet ds = new DataSet();
        string qry = "SP_Student_corrective_Bydept";
        ds = DataAccessLayer.selectProc(qry, new SqlParameter("@dept",dept));
        return ds;
    }

    public static DataSet selectCoursewithAVGGrad() 
    {
        DataSet ds = new DataSet();
        string qry = "SP_CourseWithAvgGrad";
        ds = DataAccessLayer.runQuery(qry);
        return ds;
    }

    public static DataSet selectUserGroup()
    {
        DataSet ds = new DataSet();
        string qry = "select u.id,u.user_id,u.group_id from users_groups u";
        ds = DataAccessLayer.runQuery(qry);
        return ds;

    }


    public static int updateUserGroup(int user_id, int group_id)
    {

        string qry = "SP_updateUserGroup";
        int effect = DataAccessLayer.CUDQuery(qry, new SqlParameter("@user_id",user_id), new SqlParameter("@group_id",group_id));

        return effect;

    }


    public static int deleteUserGroup(int user_id)
    {
        string qry = "SP_deleteUserGroup";
        int effect = DataAccessLayer.CUDQuery(qry, new SqlParameter("@user_id", user_id));
        return effect;
    }
}