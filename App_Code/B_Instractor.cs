using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

/// <summary>
/// Summary description for B_Instractor
/// </summary>
public class B_Instractor
{
   static  DataSet ds;
   #region Select_All
     public static DataSet seletallIns()
    {
        string stord = "select_ins";
        ds = new DataSet();
        ds=DataAccessLayer.runQuery(stord);
        return ds;
        
    }
   #endregion
  
    public static DataSet select_dept()
    {
        string stord = "select_dept";
        ds = DataAccessLayer.runQuery(stord);
        return ds;
    }
    public static int insert_ins(string Ins_Name,string  Ins_Address,string Ins_Email,string Ins_Phone,double Salary,int Dept_id)
    {
        string stord = "new_Instructor";
        int affected = DataAccessLayer.CUDQuery(stord,
                                new SqlParameter("@name",Ins_Name),
                                new SqlParameter("@adrs",Ins_Address),
                                new SqlParameter("@mail",Ins_Email),
                                new SqlParameter("@phon",Ins_Phone),
                                new SqlParameter("@sal",Salary),
                                new SqlParameter("@Dept_id",Dept_id));
        return affected;
    }
    public static int Deleted_Ins(int Ins_Id)
    {
        string stord = "Del_Inst";
        int affected = DataAccessLayer.CUDQuery(stord,
            new SqlParameter("@ins_id", Ins_Id));
        return affected;
    }
    public static int Update_Ins(int Ins_Id,string Ins_Name,string Ins_Address,string Ins_Email,string Ins_Phone,double Salary,int Dept_id)
    {
        string stord = "Edit_Inst";
        int affected = DataAccessLayer.CUDQuery(stord,
            new SqlParameter("@insid", Ins_Id),
            new SqlParameter("@name", Ins_Name),
            new SqlParameter("@adrs", Ins_Address),
            new SqlParameter("@mail", Ins_Email),
            new SqlParameter("@phon", Ins_Phone),
            new SqlParameter("@sal", Salary),
            new SqlParameter("@dep", Dept_id));
        return affected;

    }
}