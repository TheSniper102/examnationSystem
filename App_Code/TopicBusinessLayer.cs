using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Data.SqlClient;

/// <summary>
/// Summary description for TopicBusinessLayer
/// </summary>
public class TopicBusinessLayer
{

    static DataSet ds = new DataSet();
    public static DataSet SelectAllTopic( )
    {
        string query = "s_topic";
        ds = DataAccessLayer.runQuery(query);
        return ds;
    }
    //____________________________select topic by course id__________//
    public static DataSet SelTopicByCourse(int Crs_id)
    {
        string query = "select_topic_bycourse";
        SqlParameter[] p = new SqlParameter[1];
        p[0]=new SqlParameter("@cid",Crs_id);
        ds = DataAccessLayer.selectProc(query,p);
        return ds;
    }
    public static DataSet SelectCourse()
    {
        string query = "s_course";
        ds = DataAccessLayer.runQuery(query);
        return ds;
    }

    public static DataSet SelecttopicById(int Top_Id)
    {
        string query = "select_topic";
        SqlParameter[] p = new SqlParameter[1];
        p[0] = new SqlParameter("@tid", SqlDbType.Int);
        p[0].Value = Top_Id;
        ds = DataAccessLayer.selectProc(query, p);
        return ds;
    }
    public static int insertTopic(string Top_Name,int Crs_id)
    
    {
        string query = "newtopic";
        SqlParameter[] p = new SqlParameter[2];
        p[0] = new SqlParameter("@tname",Top_Name);
        p[1] = new SqlParameter("@crsid",Crs_id);
        int affected = DataAccessLayer.CUDQuery(query, p);
        return affected;
    }
    //______________delete topic
    public static int DeleteTopic(int Top_Id,int Crs_id ) 
    {
        string query = "del_topic";
        SqlParameter[] p = new SqlParameter[2];
        p[0] = new SqlParameter("@tid",Top_Id);
        p[1] = new SqlParameter("@crsid", Crs_id);
        int affected = DataAccessLayer.CUDQuery(query, p);
        return affected;
    }

    //______________edit topic____________
    public static int editTopic(int Top_Id=-1, string Top_Name=null, int Crs_id=-1)
    {
        string query = "edit_topic";
        SqlParameter[] p = new SqlParameter[3];

        p[0] = new SqlParameter("@tid", Top_Id);
        p[1] = new SqlParameter("@tname",Top_Name);
        p[2] = new SqlParameter("@crsid",Crs_id);
      
        int affected = DataAccessLayer.CUDQuery(query, p);
        return affected;
    }

    // insert into  contact us table//
    public static int insertcontact(string Email,string FullName,int Phone,string Message)
    {
        string query = "ins_cont";
        SqlParameter[] p = new SqlParameter[4];
        p[0] = new SqlParameter("@email", Email);
        p[1] = new SqlParameter("@Fullname",FullName );
        p[2] = new SqlParameter("@phone",Phone );
        p[3] = new SqlParameter("@message",Message);
        int affected= DataAccessLayer.CUDQuery(query, p);
        return affected;

    }
    //___________________________select_student_resualts___________//
    public static DataSet studentResult()
    {
        string query = "student_result";
        ds = DataAccessLayer.runQuery(query);
        return ds;
    }
    //_____________select student exam by student id____________//

    public static DataSet studentExamById(int ST_id)
    {
        string query = "studentExams";
        SqlParameter[] p=new SqlParameter[1];
        p[0]=new SqlParameter("@sid",ST_id);
        ds = DataAccessLayer.selectProc(query, p);
        return ds;
    }
    public static DataSet studentid()
    {
        string query = "select ST_id,Name from Student ";
        ds = DataAccessLayer.runQuery(query);
        return ds;
    }


}