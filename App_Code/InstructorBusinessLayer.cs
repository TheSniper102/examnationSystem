using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Data.SqlClient;

/// <summary>
/// Summary description for InstructorBusinessLayer
/// </summary>
public class InstructorBusinessLayer
{
    static DataSet ds = new DataSet();
    public static DataSet SelectInstructorIdName()
    {
        ds = DataAccessLayer.RunQuery("SelectInstructorIdName");
        return ds;
    }
    public static int insertInstructorCourses(int insid, string crs)
    {
        SqlParameter st = new SqlParameter("@insid", insid);
        st.SqlDbType = SqlDbType.Int;
        SqlParameter crsid = new SqlParameter("@crs", crs);
        crsid.SqlDbType = SqlDbType.VarChar;
        SqlParameter[] param = { st, crsid };
        int affected = DataAccessLayer.RunDML("insertInstructorCourses", param);
        return affected;
    }
    public static DataSet SelectInsCrs()
    {
        ds = DataAccessLayer.RunQuery("SelectInsCrs");
        return ds;
    }
    public static int DeleteInsCrs(int insid, int crs)
    {
        SqlParameter ins = new SqlParameter("@ins_id", insid);
        ins.SqlDbType = SqlDbType.Int;
        SqlParameter crsid = new SqlParameter("@crs_id", crs);
        crsid.SqlDbType = SqlDbType.Int;
        SqlParameter[] param = { ins, crsid };
        int affected = DataAccessLayer.RunDML("deleteCrsIns", param);
        return affected;
    }
}