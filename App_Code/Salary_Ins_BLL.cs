using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Data.SqlClient;

/// <summary>
/// Summary description for Salary_Ins_BLL
/// </summary>
public class Salary_Ins_BLL
{
   static DataSet ds;
	public static DataSet select_Salary()
    {
        string stord = "select__All_Salary";
        ds = new DataSet();
        ds = DataAccessLayer.runQuery(stord);
        return ds;

    }
}