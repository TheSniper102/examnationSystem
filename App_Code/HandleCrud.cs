using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI.WebControls;

public class HandleCrud 
{
   
   public static void obj_Inserted(object sender, ObjectDataSourceStatusEventArgs e)
    {

        e.AffectedRows = (int)e.ReturnValue;


    }
    public static void obj_Updated(object sender, ObjectDataSourceStatusEventArgs e)
    {

        e.AffectedRows = (int)e.ReturnValue;

    }

  public static void obj_Deleted(object sender, ObjectDataSourceStatusEventArgs e)
    {

        e.AffectedRows = (int)e.ReturnValue;

    }


}