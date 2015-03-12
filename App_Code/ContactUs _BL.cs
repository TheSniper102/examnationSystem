using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Data.SqlClient;

/// <summary>
/// Summary description for ContactUs_BL
/// </summary>
public class ContactUs_BL
{
    static DataSet ds=new DataSet();
    public static DataSet Contactus()
    {
        return DataAccessLayer.selectProc("ShowContactUsMesages");
    }
    public static int DeleteContactUs(int id)
    {
        SqlParameter Id=new SqlParameter("@id",id);
        return DataAccessLayer.CUDQuery("DeleteContact",Id);
    }
}