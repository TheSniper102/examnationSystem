using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Data.SqlClient;

/// <summary>
/// Summary description for Profiles
/// </summary>
public class ProfileBusinessLayer
{
   static DataSet ds = new DataSet();
	public static DataSet StudentProfileInfo(int st_id)
    {
        SqlParameter stid = new SqlParameter("@st_id", st_id);
        stid.SqlDbType = SqlDbType.Int;
        SqlParameter[] param = { stid };
        ds = DataAccessLayer.RunQuery("StudentProfileinfo", param);
        return ds;
    }
    
    public static DataSet StudentProfileExams(int st_id)
    {
        SqlParameter stid = new SqlParameter("@st_id", st_id);
        stid.SqlDbType = SqlDbType.Int;
        SqlParameter[] param = { stid };
        ds = DataAccessLayer.RunQuery("StudentProfileExams", param);
        return ds;
    }
    

    public static DataSet StudentProfileCourses(int st_id)
    {
        SqlParameter stid = new SqlParameter("@st_id", st_id);
        stid.SqlDbType = SqlDbType.Int;
        SqlParameter[] param = { stid };
        ds = DataAccessLayer.RunQuery("StudenttProfileCourses", param);
        return ds;
    }

    public static DataSet InstructorProfile(int ins_id)
    {
        SqlParameter insid = new SqlParameter("@ins_id", ins_id);
        insid.SqlDbType = SqlDbType.Int;
        SqlParameter[] param = { insid };
        ds = DataAccessLayer.RunQuery("InstructorProfile", param);
        return ds;
    }
    public static DataSet ReportStAnsandModelAns(int crs_id)
    {
        SqlParameter crsid = new SqlParameter("@crsid", crs_id);
       crsid.SqlDbType = SqlDbType.Int;
        SqlParameter[] param = { crsid };
        ds = DataAccessLayer.RunQuery("ReportStAnswerAndModelAns", param);
        return ds;
    }
}