using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI;
using System.Web.UI.WebControls;

/// <summary>
/// Summary description for CourseBusinessLayer
/// </summary>
public class StudentBusinessLayer
{
    static DataSet ds = new DataSet();

    //=====fill drop down list

    public static DataSet selectCourseIdName()
    {
        ds = DataAccessLayer.RunQuery("selectCourseIdName");
        return ds;
    }
    public static DataSet SearchStudent(string searchtype, string searchword)
    {
        SqlParameter type = new SqlParameter("@searchkey", searchtype);
        type.SqlDbType = SqlDbType.VarChar;
        SqlParameter word = new SqlParameter("@searchword", searchword);
        word.SqlDbType = SqlDbType.VarChar;
        SqlParameter[] param = { type, word };
        ds = DataAccessLayer.RunQuery("SearchStudent", param);
        return ds;
    }
    public static DataSet SelectStudentIdName()
    {
        ds = DataAccessLayer.RunQuery("selectStIdName");
        return ds;
    }
    public static DataSet SelectReportStudent(int St_Id)
    {
        SqlParameter id = new SqlParameter("@id", St_Id);
        id.SqlDbType = SqlDbType.Int;
        ds = DataAccessLayer.RunQuery("selectStReport", id);

        return ds;
    }
    public static DataSet SelectAllStudent()
    {
        ds = DataAccessLayer.RunQuery("SelectAllStudent");
        return ds;
    }
    public static DataSet SelectDept()
    {
        ds = DataAccessLayer.RunQuery("SelectDept");
        return ds;
    }

    public static int insertStudent(string Name, int Age, string phone, string Address, string E_Mail, int DeptNo, string Pass, string Gender, string SecQues, string SecAns)
    {
        int affected;

        SqlParameter _name = new SqlParameter("@name", Name);
        _name.SqlDbType = SqlDbType.VarChar;
        SqlParameter _age = new SqlParameter("@age", Age);
        _age.SqlDbType = SqlDbType.Int;
        SqlParameter _phone = new SqlParameter("@phone", phone);
        _phone.SqlDbType = SqlDbType.VarChar;
        SqlParameter _address = new SqlParameter("@address", Address);
        _address.SqlDbType = SqlDbType.VarChar;
        SqlParameter _email = new SqlParameter("@email", E_Mail);
        _email.SqlDbType = SqlDbType.VarChar;
        SqlParameter _pass = new SqlParameter("@password", Pass);
        _pass.SqlDbType = SqlDbType.VarChar;
        SqlParameter _gender = new SqlParameter("@gender", Gender);
        _gender.SqlDbType = SqlDbType.VarChar;
        SqlParameter _ques = new SqlParameter("@secques", SecQues);
        _ques.SqlDbType = SqlDbType.VarChar;
        SqlParameter _ans = new SqlParameter("@secans", SecAns);
        _ans.SqlDbType = SqlDbType.VarChar;

        if (DeptNo != 0)
        {
            SqlParameter _dept = new SqlParameter("@dept", DeptNo);
            _dept.SqlDbType = SqlDbType.Int;
            SqlParameter[] param = { _name, _age, _phone, _address, _email, _dept, _pass, _gender, _ques, _ans };
            affected = DataAccessLayer.RunDML("InsertStudent", param);
        }
        else
        {
            SqlParameter[] param = { _name, _age, _phone, _address, _email };
            affected = DataAccessLayer.RunDML("InsertStudent", param);
        }


        return affected;
    }
    public static int DeleteStudent(int ST_id)
    {
        SqlParameter id = new SqlParameter("@id", ST_id);
        id.SqlDbType = SqlDbType.Int;
        SqlParameter[] param = { id };

        int affected = DataAccessLayer.RunDML("DeleteStudent", param);
        return affected;
    }
    public static int UpdateStudent(int ST_id, string Name, int Age, string phone, string Address, string E_Mail, string DeptNo)
    {
        SqlParameter id = new SqlParameter("@id", ST_id);
        id.SqlDbType = SqlDbType.Int;
        SqlParameter _name = new SqlParameter("@name", Name);
        _name.SqlDbType = SqlDbType.VarChar;
        SqlParameter _age = new SqlParameter("@age", Age);
        _age.SqlDbType = SqlDbType.Int;
        SqlParameter _phone = new SqlParameter("@phone", phone);
        _phone.SqlDbType = SqlDbType.VarChar;
        SqlParameter _address = new SqlParameter("@address", Address);
        _address.SqlDbType = SqlDbType.VarChar;
        SqlParameter _email = new SqlParameter("@email", E_Mail);
        _email.SqlDbType = SqlDbType.VarChar;
        SqlParameter _dept = new SqlParameter("@dept", DeptNo);
        _dept.SqlDbType = SqlDbType.Int;
        SqlParameter[] param = { id, _name, _age, _phone, _address, _email, _dept };

        int affected = DataAccessLayer.RunDML("Update_student", param);
        return affected;
    }

    public static DataSet SearchStudentcourse(int searchkey, int searchword)
    {
        SqlParameter type = new SqlParameter("@searchkey", searchkey);
        type.SqlDbType = SqlDbType.Int;
        SqlParameter word = new SqlParameter("@searchword", searchword);
        word.SqlDbType = SqlDbType.Int;
        SqlParameter[] param = { type, word };
        ds = DataAccessLayer.RunQuery("SearchStudentcourse", param);
        return ds;
    }
    public static int insertStudentCourses(int stid, string crs)
    {
        SqlParameter st = new SqlParameter("@stid", stid);
        st.SqlDbType = SqlDbType.Int;
        SqlParameter crsid = new SqlParameter("@crs", crs);
        crsid.SqlDbType = SqlDbType.VarChar;
        SqlParameter[] param = { st, crsid };
        int affected = DataAccessLayer.RunDML("insertStudentCourses", param);
        return affected;
    }
}