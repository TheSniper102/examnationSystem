using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Data.SqlClient;


/// <summary>
/// Summary description for Update_Ins_Data
/// </summary>
public class Update_Ins_Data
{
    static DataSet ds;
    //static SqlDataReader dr;
	public static int update_Ins_Data(int Ins_Id,string Ins_Name,string Ins_Address,string Ins_Phone,string Ins_Email,int Dept_id )
    {
        string stord = "Update_Ins_Data";
        int affected = DataAccessLayer.CUDQuery(stord,
            new SqlParameter("@insid", Ins_Id),
            new SqlParameter("@name", Ins_Name),
            new SqlParameter("@adrs", Ins_Address),
            new SqlParameter("@mail", Ins_Email),
            new SqlParameter("@phon", Ins_Phone),
            new SqlParameter("@dep", Dept_id));
        return affected;
    }
    public static int admin_update_Ins_Data(int Ins_Id, string Ins_Name, string Ins_Address, string Ins_Phone,double Salary, string Ins_Email, int Dept_id)
    {
        string stord = "Admin_Update_Ins_Data";
        int affected = DataAccessLayer.CUDQuery(stord,
            new SqlParameter("@insid", Ins_Id),
            new SqlParameter("@name", Ins_Name),
            new SqlParameter("@adrs", Ins_Address),
            new SqlParameter("@mail", Ins_Email),
            new SqlParameter("@salary",Salary),
            new SqlParameter("@phon", Ins_Phone),
            new SqlParameter("@dep", Dept_id));
        return affected;
    }
    public static DataSet select_Ins_ById()
    {
        string stord = "select_INs_Id_Name";
        ds = DataAccessLayer.runQuery(stord);
        return ds;
            
    }
    public static DataSet select_all_by_Id(int Ins_Id)
    {
        string stord = "selectins_Byid";
        ds = DataAccessLayer.selectProc(stord,
            new SqlParameter("@ins_id", Ins_Id));
        return ds;
    }
}