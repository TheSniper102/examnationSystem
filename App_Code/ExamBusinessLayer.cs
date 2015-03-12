using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Data.SqlClient;

/// <summary>
/// Summary description for ExamBusinessLayer
/// </summary>
public class ExamBusinessLayer
{
    static DataSet ds = new DataSet();
    public static DataSet CurrentExames(int st_id)
    {
         SqlParameter crs = new SqlParameter("@stid", st_id);
        crs.DbType = DbType.Int32;
        SqlParameter[] pram = { crs };
       ds= DataAccessLayer.RunQuery("CurrentExames", pram);
        return ds;
    }
    public static DataSet CheckQuestions(int crs_id)
    {
        SqlParameter crs = new SqlParameter("@crsid", crs_id);
        crs.DbType = DbType.Int32;
        SqlParameter[] pram = { crs };
        ds = DataAccessLayer.RunQuery("CheckQuestions", pram);
        return ds;
    }
    public static List<int> SelectStudentInCourse(int crs_id)
    {
        SqlParameter crs = new SqlParameter("@crsid", crs_id);
        crs.DbType = DbType.Int32;
        SqlParameter[] pram = { crs };
        List<int> li = DataAccessLayer.ExecuteReader("SelectStByCrs", pram);
        return li;
    }
    public static int generateExam(int st_id, int crs_id, int mcq, int tf, string start_date, string end_date)
    {
        SqlParameter stid = new SqlParameter("@stid", st_id);
        stid.DbType = DbType.Int32;
        SqlParameter crsid = new SqlParameter("@crs_id", crs_id);
        stid.DbType = DbType.Int32;
        SqlParameter _mcq = new SqlParameter("@mcq", mcq);
        stid.DbType = DbType.Int32;
        SqlParameter _tf = new SqlParameter("@tf", tf);
        stid.DbType = DbType.Int32;
        SqlParameter start = new SqlParameter("@startdate", start_date);
        start.DbType = DbType.Date;
        SqlParameter end = new SqlParameter("@enddate", end_date);
        start.DbType = DbType.Date;
        SqlParameter[] pram = { stid, crsid, _mcq, _tf, start, end };

        int affected = DataAccessLayer.RunDML("generateExam", pram);
        return affected;
    }
    public static DataSet ShowExam(int st_id, int crs_id)
    {
        SqlParameter stid = new SqlParameter("@stid", st_id);
        stid.DbType = DbType.Int32;
        SqlParameter crsid = new SqlParameter("@crsid", crs_id);
        crsid.DbType = DbType.Int32;
        SqlParameter[] param = { stid, crsid };
        ds = DataAccessLayer.RunQuery("ShowExam", param);
        return ds;
    }


    //create proc SaveAnswers
    //@stid int,
    //@answers nvarchar(1000),
    //@exid int,
    //@qid int

    public static int SaveAnswers(int st_id, string answers, int ex_id, string ques_id)
    {
        SqlParameter stid = new SqlParameter("@stid", st_id);
        stid.SqlDbType = SqlDbType.Int;
        SqlParameter exid = new SqlParameter("@exid", ex_id);
        exid.SqlDbType = SqlDbType.Int;
        SqlParameter qid = new SqlParameter("@qid", ques_id);
        qid.SqlDbType = SqlDbType.VarChar;
        SqlParameter ans = new SqlParameter("@answers", answers);
        ans.SqlDbType = SqlDbType.VarChar;

        SqlParameter[] param = { stid, exid, qid, ans };
        int affected = DataAccessLayer.RunDML("SaveAnswers", param);

        return affected;
    }


    public static int ExamCorrection(int st_id, int ex_id)
    {
        SqlParameter stid = new SqlParameter("@St_Id", st_id);
        stid.SqlDbType = SqlDbType.Int;
        SqlParameter exid = new SqlParameter("@Exam_ID", ex_id);
        exid.SqlDbType = SqlDbType.Int;
        SqlParameter[] param = { stid, exid };
        int affected = DataAccessLayer.RunDML("St_CorrectAns", param);

        return affected;
    }
    public static int ExamResult(int st_id, int ex_id, int crs_id)
    {
        SqlParameter stid = new SqlParameter("@st_id", st_id);
        stid.SqlDbType = SqlDbType.Int;
        SqlParameter exid = new SqlParameter("@ex_id", ex_id);
        exid.SqlDbType = SqlDbType.Int;
        SqlParameter crsid = new SqlParameter("@c_id", crs_id);
        crsid.SqlDbType = SqlDbType.Int;
        int affected;
        SqlParameter grade = new SqlParameter();
        grade.ParameterName = "@grad";
        grade.Direction = ParameterDirection.Output;
        grade.SqlDbType = SqlDbType.Int;

        SqlParameter[] param = { stid, exid, crsid, grade };
        DataAccessLayer.RunDML("course_grade", param);
        affected = (int)grade.Value;
        return affected;
    }
}