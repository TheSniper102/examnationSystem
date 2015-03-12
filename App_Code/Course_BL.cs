using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Data.SqlClient;
/// <summary>
/// Summary description for Course_BL
/// </summary>
public class Course_BL
{
    static DataSet ds = new DataSet();
    public static DataSet SelectAllCourses()
    {
        return DataAccessLayer.runQuery("select Crs_Id, Crs_Name, Crs_Duration from Course");
    }
    public static DataSet SelectCourseById(int Crs_Id)
    {
        SqlParameter id = new SqlParameter("@id", Crs_Id);
        return DataAccessLayer.selectProc("SelectCoursdId", id);
    }
    public static int DeleteCourse(int id)
    {
        SqlParameter ID = new SqlParameter("@id", id);
        return DataAccessLayer.CUDQuery("Deletecourse", ID);
    }
    public static int updatecourse(int id, string Name, int Duration)
    {
        SqlParameter Id = new SqlParameter("@id", id);
        SqlParameter NAME = new SqlParameter("@Name", Name);
        SqlParameter DURATION = new SqlParameter("@Duration ", Duration);
        return DataAccessLayer.CUDQuery("updatecourse", Id, NAME, DURATION);

    }
    public static int insertcourse(string name, int Duration)
    {
        SqlParameter p1 = new SqlParameter("@Name", name);
        SqlParameter p2 = new SqlParameter("@Duration", Duration);
        int affected = DataAccessLayer.CUDQuery("InsertCourse", p1, p2);

        return affected;
    }
    public static DataSet select_course()
    {
        return DataAccessLayer.selectProc("coursename");
    }
    public static DataSet select_instructor_bycourse(int crs_id)
    {
        SqlParameter pr1 = new SqlParameter("@id", crs_id);
        return DataAccessLayer.selectProc("selectinsbycourse", pr1);

    }
    public static DataSet select_topic_bycourse(int crs_id)
    {
        SqlParameter p1 = new SqlParameter("@crs_id", crs_id);
        return DataAccessLayer.selectProc("topic_course",p1);
    }
    public static int DeleteTopic(int id)
    {
        SqlParameter ID = new SqlParameter("@id", id);
        return DataAccessLayer.CUDQuery("DeleteTopic", ID);
    }
    public static int updateTopic(int id, string Name, int Crs_Id)
    {
        SqlParameter Id = new SqlParameter("@id", id);
        SqlParameter NAME = new SqlParameter("@Name", Name);
        SqlParameter Crs_id = new SqlParameter("@Crs_Id ", Crs_Id);
        return DataAccessLayer.CUDQuery("updateTop", Id, NAME, Crs_id);

    }
    public static int insertTopic(string name, int Course_id)
    {
        SqlParameter p1 = new SqlParameter("@Name", name);
        SqlParameter p2 = new SqlParameter("@Crs_Id", Course_id);
        int affected = DataAccessLayer.CUDQuery("InsertTopic", p1, p2);

        return affected;
    }
}