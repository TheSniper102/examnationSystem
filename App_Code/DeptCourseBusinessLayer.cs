using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Data.SqlClient;
/// <summary>
/// Summary description for DeptCourseBusinessLayer
/// </summary>
public class DeptCourseBusinessLayer
{
    static DataSet ds = new DataSet();

    public static DataSet SelectDept()
    {
        ds = DataAccessLayer.RunQuery("SelectDept");
        return ds;
    }
    public static int insertDeptCourses(int deptid, string crs)
    {
        SqlParameter d = new SqlParameter("@dept", deptid);
        d.SqlDbType = SqlDbType.Int;
        SqlParameter crsid = new SqlParameter("@crs", crs);
        crsid.SqlDbType = SqlDbType.VarChar;
        SqlParameter[] param = { d, crsid };
        int affected = DataAccessLayer.RunDML("insertDeptCourses", param);
        return affected;
    }
    public static DataSet SelectdeptCrs()
    {
        ds = DataAccessLayer.RunQuery("SelectDeptCourse");
        return ds;
    }
    public static int DeleteInsCrs(int dept, int crs)
    {
        SqlParameter d = new SqlParameter("@deptid", dept);
        d.SqlDbType = SqlDbType.Int;
        SqlParameter crsid = new SqlParameter("@crsid", crs);
        crsid.SqlDbType = SqlDbType.Int;
        SqlParameter[] param = { d, crsid };
        int affected = DataAccessLayer.RunDML("deleteCourseDept", param);
        return affected;
    }
}