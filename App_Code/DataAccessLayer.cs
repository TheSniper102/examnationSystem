using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;


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
        try { adapt.Fill(ds); }
        catch (SqlException exc) { throw exc; }
        finally
        {
            if (conn != null && conn.State == ConnectionState.Open)
                conn.Close();
        }
        return ds;
    }
    public static DataSet RunQuery(string stored, params SqlParameter[] paramerters)
    {

        cmnd = new SqlCommand();
        cmnd.Connection = openConnection();
        cmnd.CommandType = CommandType.StoredProcedure;
        cmnd.CommandText = stored;
        cmnd.Parameters.Clear();
        if (paramerters.Length != 0)
        {
            foreach (SqlParameter param in paramerters)
            {
                cmnd.Parameters.Add(param);
            }
        }
        DataSet ds = new DataSet();
        SqlDataAdapter adapt = new SqlDataAdapter();
        adapt.SelectCommand = cmnd;
        adapt.Fill(ds);
        return ds;
    }
    //select using strored proc
    public static DataSet selectProc(string _proName, params SqlParameter[] spmtr)
    {
        cmnd = new SqlCommand();
        DataSet ds = new DataSet();
        cmnd.CommandType = CommandType.StoredProcedure;
        cmnd.CommandText = _proName;
        cmnd.Connection = openConnection();
        cmnd.Parameters.AddRange(spmtr);
        SqlDataAdapter adapt = new SqlDataAdapter(cmnd);
        try { adapt.Fill(ds); }

        catch (SqlException exc) { throw exc; }
        finally
        {
            if (conn != null && conn.State == ConnectionState.Open)
                conn.Close();
        }
        return ds;

    }
    public static DataSet SelectAll(string qry)
    {
        //SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["exam"].ToString());
        cmnd = new SqlCommand();
        cmnd.Connection = openConnection();
        DataSet ds = new DataSet();
        cmnd.CommandText = qry;
        SqlDataAdapter adapter = new SqlDataAdapter(cmnd);
        adapter.Fill(ds);
        return ds;

    }
    public static DataSet SelectAllByProcedure(string qry)
    {
        //SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["exam"].ToString());
        cmnd = new SqlCommand();
        cmnd.Connection = openConnection();
        cmnd.CommandType = CommandType.StoredProcedure;
        cmnd.CommandText = qry;
        DataSet ds = new DataSet();
        SqlDataAdapter adapter = new SqlDataAdapter(cmnd);
        adapter.Fill(ds);
        return ds;

    }
    //create update delete
    public static int CUDQuery(string _proName, params SqlParameter[] spmtr)
    {
        cmnd = new SqlCommand();
        cmnd.CommandType = CommandType.StoredProcedure;
        cmnd.CommandText = _proName;
        cmnd.Parameters.AddRange(spmtr);
        cmnd.Connection = openConnection();
        int affedctedRows;
        try
        { affedctedRows = Convert.ToInt32(cmnd.ExecuteNonQuery()); }
        catch (SqlException exc)
        {
            affedctedRows = -4; // db error
            throw exc;
        }
        finally
        {
            if (conn != null && conn.State == ConnectionState.Open)
                conn.Close();
        }
        return affedctedRows;
    }
    public static int RunQueryScaller(string stored, params SqlParameter[] paramerters)
    {
        
        cmnd = new SqlCommand();
        cmnd.Connection = openConnection();
        cmnd.CommandType = CommandType.StoredProcedure;
        cmnd.CommandText = stored;
        cmnd.Parameters.Clear();
        if (paramerters.Length != 0)
        {
            foreach (SqlParameter param in paramerters)
            {
                cmnd.Parameters.Add(param);
            }
        }

        int affected = (int)cmnd.ExecuteScalar();
        conn.Close();
        return affected;
    }
    public static List<Int32> ExecuteReader(string stored, params SqlParameter[] paramerters)
    {

        cmnd = new SqlCommand();
        cmnd.Connection = openConnection();
        cmnd.CommandType = CommandType.StoredProcedure;
        cmnd.CommandText = stored;
        cmnd.Parameters.Clear();
        if (paramerters.Length != 0)
        {
            cmnd.Parameters.AddRange(paramerters);
        }
        List<Int32> li = new List<int>();
       
        SqlDataReader dr = cmnd.ExecuteReader();

        while (dr.Read())
        {

            li.Add(dr.GetInt32(0));
        }
        conn.Close();
        return li;
    }
    public static int RunDML(string stored, params SqlParameter[] paramerters)
    {
        
        cmnd = new SqlCommand();
        cmnd.Connection = openConnection();
        cmnd.CommandType = CommandType.StoredProcedure;
        cmnd.CommandText = stored;
        cmnd.Parameters.Clear();
        cmnd.Parameters.AddRange(paramerters);
        int affected = 0;
        try
        {
             affected = cmnd.ExecuteNonQuery();

        }
        catch(SqlException sqx)
        {
            throw sqx;
        }
        conn.Close();
        return affected;
    }
}