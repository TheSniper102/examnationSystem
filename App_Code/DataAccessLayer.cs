using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

/** todo handle all required paramters in stored proc **/
public class DataAccessLayer
{
    static SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["Exam_Sys"].ToString());
    static SqlCommand cmnd;
    //open connection if closed or crashed
   private static SqlConnection openConnection()
    {
        if (conn.State == ConnectionState.Closed || conn.State == ConnectionState.Broken)
            conn.Open();
        return conn;
    }
    public static DataSet runQuery(String _query)
    {
        cmnd = new SqlCommand(_query, conn);
        DataSet ds = new DataSet();
        SqlDataAdapter adapt = new SqlDataAdapter(cmnd);
        adapt.Fill(ds);
        return ds;
    }

    //create update delete
    public static int CUDQuery(string _proName,SqlParameter[] spmtr)
    {
        cmnd = new SqlCommand();
        cmnd.CommandType = CommandType.StoredProcedure;
        cmnd.CommandText = _proName;
        cmnd.Parameters.AddRange(spmtr);
        cmnd.Connection = openConnection();
        int affedctedRows= Convert.ToInt32( cmnd.ExecuteNonQuery());
        conn.Close();
        return affedctedRows;
    }
}