using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Data.SqlClient;
public class Department_BLL
{
    static DataSet ds = new DataSet();
    public static  DataSet getAllDepts()
    {
        string query= "select Dept_Id, Dept_Name , Dept_Desc , Dept_Location  from Department";
        ds = DataAccessLayer.runQuery(query);
        return ds;
    }
    public static DataSet getDeptByID(int deptId)
    {
        string query = @"select Dept_Id, Dept_Name , Dept_Desc , 
                        Dept_Location from Department where Dept_Id = "+deptId.ToString();
        ds = DataAccessLayer.runQuery(query);
        return ds;

    }

    public static int  deleteDept(int deptId)
    {
        string proName="Del_Dept";
        SqlParameter[] sqlParameters = new SqlParameter[1];
        sqlParameters[0] = new SqlParameter("@did", SqlDbType.Int);
        sqlParameters[0].Value = deptId;
        int affected = DataAccessLayer.CUDQuery(_proName: proName,spmtr:sqlParameters);
        return affected;
    }
    public static int updateDept(int deptId, string name=null, string desc=null, string loc=null)
    {
        //@id int , @name varchar(50)=null, @desc varchar(50)=null , @loc varchar(50)=null
        string proName="Edit_Dept";
        SqlParameter[] sqlParameters = new SqlParameter[4];
            sqlParameters[0] = new SqlParameter("@id", SqlDbType.Int);
            sqlParameters[0].Value = deptId;

            sqlParameters[1] = new SqlParameter("@name", SqlDbType.VarChar);
            sqlParameters[1].Value = name;

            sqlParameters[2] = new SqlParameter("@desc", SqlDbType.VarChar);
            sqlParameters[2].Value = desc;

            sqlParameters[3] = new SqlParameter("@loc", SqlDbType.VarChar);
            sqlParameters[3].Value = loc;

        int affected = DataAccessLayer.CUDQuery(_proName: proName, spmtr: sqlParameters);
        return affected;
    }
    public static int insertDept(string name=null, string desc=null, string loc=null)
    {
        string proName = "new_Dept";
        SqlParameter[] sqlParameters = new SqlParameter[3];

        sqlParameters[0] = new SqlParameter("@name", SqlDbType.VarChar);
        sqlParameters[0].Value = name;

        sqlParameters[1] = new SqlParameter("@desc", SqlDbType.VarChar);
        sqlParameters[1].Value = desc;

        sqlParameters[2] = new SqlParameter("@loc", SqlDbType.VarChar);
        sqlParameters[2].Value = loc;

        int affected = DataAccessLayer.CUDQuery(_proName: proName, spmtr: sqlParameters);
        return affected;
    }
}