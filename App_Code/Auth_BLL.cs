using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Data.SqlClient;
using System.Text;
using System.Security.Cryptography;

public class Auth_BLL
{
    static DataSet ds;

    public static int Register(string username, string pass, int deptId, string sq, string ans, string phone = null, string email = null, string address = null, string gender = "male", int job = 0)
    {
        string proName = "Register";
        SqlParameter[] sqlParameters = new SqlParameter[10];
        #region paramters
        sqlParameters[0] = new SqlParameter("@username", SqlDbType.VarChar);
        sqlParameters[0].Value = username;

        sqlParameters[1] = new SqlParameter("@pass", SqlDbType.VarChar);
        sqlParameters[1].Value = hash_pass(pass);

        sqlParameters[2] = new SqlParameter("@deptId", SqlDbType.Int);
        sqlParameters[2].Value = deptId;

        sqlParameters[3] = new SqlParameter("@sq", SqlDbType.VarChar);
        sqlParameters[3].Value = sq;

        sqlParameters[4] = new SqlParameter("@ans", SqlDbType.VarChar);
        sqlParameters[4].Value = ans;

        sqlParameters[5] = new SqlParameter("@phone", SqlDbType.VarChar);
        sqlParameters[5].Value = phone;

        sqlParameters[6] = new SqlParameter("@email", SqlDbType.VarChar);
        sqlParameters[6].Value = email;

        sqlParameters[7] = new SqlParameter("@address", SqlDbType.VarChar);
        sqlParameters[7].Value = address;

        sqlParameters[8] = new SqlParameter("@gender", SqlDbType.VarChar);
        sqlParameters[8].Value = gender;

        sqlParameters[9] = new SqlParameter("@job", SqlDbType.Int);
        sqlParameters[9].Value = job;
        #endregion
        int affected = DataAccessLayer.CUDQuery(_proName: proName, spmtr: sqlParameters);
        return affected;
    }
    public static string hash_pass(string pass)
    {
        SHA1 sha1 = SHA1.Create();

        //convert the input text to array of bytes
        byte[] hashData = sha1.ComputeHash(Encoding.Unicode.GetBytes(pass));

        //create new instance of StringBuilder to save hashed data
        StringBuilder returnValue = new StringBuilder();

        //loop for each byte and add it to StringBuilder
        for (int i = 0; i < hashData.Length; i++)
        {
            returnValue.Append(hashData[i].ToString());
        }

        // return hexadecimal string
        return returnValue.ToString();
    }
    public static bool checkPass(string pass, string stroredPass)
    {
        if (string.Compare(pass, stroredPass) == 0)
            return true;
        else
            return false;
    }

    public static DataSet login(string username, string pass)
    {
        string ProName = "login";
        ds = new DataSet();
        SqlParameter[] sqlParameters = new SqlParameter[2];
        sqlParameters[0] = new SqlParameter("@username", SqlDbType.VarChar);
        sqlParameters[0].Value = username;

        sqlParameters[1] = new SqlParameter("@pass", SqlDbType.VarChar);
        sqlParameters[1].Value = hash_pass(pass);

        ds = DataAccessLayer.selectProc(ProName, sqlParameters);
        return ds;
    }
    public static bool userlogged()
    {
        HttpCookie reader = HttpContext.Current.Request.Cookies["exaSystem"];
        if (HttpContext.Current.Session["userInfo"] != null)
            return true;
        if (reader != null)
        {
            if (IsValidAuthCookie(reader) == true)
            {
                string[] values = reader.Value.Split('|');
                if (values.Length != 2) return false;

                // Retrieve the username from the split values.
                string username = values[0];
                ds = new DataSet();
                ds = resetPass(username);
                HttpContext.Current.Session["userInfo"] = ds;
                return true;
            }
        }
        return false;
    }
    public static string currentUsername()
    {
        DataSet ds1 = new DataSet();
        if (HttpContext.Current.Session["userInfo"] != null)
        {
            ds1 = (DataSet)HttpContext.Current.Session["userInfo"];
            string Username = ds1.Tables[0].Rows[0]["username"].ToString();
            return Username;
        }
        return string.Empty;
    }
    public static int currentUserId()
    {
        ds = new DataSet();
        int Userid = -1;
        if (HttpContext.Current.Session["userInfo"] != null)
        {
            ds = (DataSet)HttpContext.Current.Session["userInfo"];
            Userid = int.Parse(ds.Tables[0].Rows[0]["user_id"].ToString());
        }
        return Userid;
    }

    public static void CreateAuthCookie(string username, string password)
    {
        HttpCookie cookie = new HttpCookie("exaSystem");
        cookie.Value = username + "|" + hash_pass(password);
        cookie.Expires = DateTime.Now.AddDays(10d);
        HttpContext.Current.Response.Cookies.Add(cookie);
    }
    public static bool IsValidAuthCookie(HttpCookie cookie)
    {
        // Split the cookie value by the pipe delimiter.
        string[] values = cookie.Value.Split('|');
        if (values.Length != 2) return false;

        // Retrieve the username and hash from the split values.
        string username = values[0];
        string hash = values[1];
        ds = new DataSet();
        ds = resetPass(username);
        string password = ds.Tables[0].Rows[0]["pass"].ToString();

        return checkPass(password, hash);
    }
    public static void logout()
    {
        if (HttpContext.Current.Session["userInfo"] != null)
        {
            HttpContext.Current.Session.Clear();
            HttpContext.Current.Session.Abandon();
        }
        HttpCookie reader = HttpContext.Current.Request.Cookies["exaSystem"];
        if (reader != null)
            HttpContext.Current.Response.Cookies["exaSystem"].Expires = DateTime.Now.AddDays(-1);
        HttpContext.Current.Response.Redirect("login.aspx");
    }
    //change password only if he know old one
    public static int changePass(string username, string oldPass, string newPass)
    {
        string _proName = "changePass";
        SqlParameter[] sqlParameters = new SqlParameter[3];
        #region paramters
        sqlParameters[0] = new SqlParameter("@username", SqlDbType.VarChar);
        sqlParameters[0].Value = username;
        sqlParameters[1] = new SqlParameter("@oldPass", SqlDbType.VarChar);
        sqlParameters[1].Value = hash_pass(oldPass);
        sqlParameters[2] = new SqlParameter("@newPass", SqlDbType.VarChar);
        sqlParameters[2].Value = hash_pass(newPass);
        #endregion
        int affected = DataAccessLayer.CUDQuery(_proName: _proName, spmtr: sqlParameters);
        return affected;
    }
    public static int AdminchangePass(string username, string newPass)
    {
        string _proName = "App_Instractor_AdCpass";
        int affected = DataAccessLayer.CUDQuery(_proName,
            new SqlParameter("@username", username),
            new SqlParameter("@newPass", hash_pass(newPass)));
        return affected;
    }
    public static DataSet resetPass(string username)
    {
        string proName = "App_users_Search";
        SqlParameter[] sqlParameters = new SqlParameter[1];
        sqlParameters[0] = new SqlParameter("@username", SqlDbType.VarChar);
        sqlParameters[0].Value = username;
        ds = new DataSet();
        ds = DataAccessLayer.selectProc(_proName: proName, spmtr: sqlParameters);
        return ds;
    }
    public static int ForgotPass(string username, string newPass)
    {
        string proName = "restPass";
        SqlParameter[] sqlParameters = new SqlParameter[2];
        sqlParameters[0] = new SqlParameter("@username", SqlDbType.VarChar);
        sqlParameters[0].Value = username;

        sqlParameters[1] = new SqlParameter("@newPass", SqlDbType.VarChar);
        sqlParameters[1].Value = newPass;

        int affected_rows = DataAccessLayer.CUDQuery(_proName: proName, spmtr: sqlParameters);
        return affected_rows;
    }

    /// <summary>
    /// check  users groups
    /// </summary>
    /// <param name="userId"></param>
    /// <param name="groupId">
    /// 1-admin
    /// 2-student
    /// 3-instructor
    /// </param>
    /// <returns>bool</returns>
    public static bool checkRole(int userId, int groupId)
    {
        string proName = "App_users_groups_Search";
        SqlParameter[] sqlParameters = new SqlParameter[2];
        sqlParameters[0] = new SqlParameter("@userId", SqlDbType.Int);
        sqlParameters[0].Value = userId;

        sqlParameters[1] = new SqlParameter("@groupId", SqlDbType.Int);
        sqlParameters[1].Value = groupId;
        ds = new DataSet();
        ds = DataAccessLayer.selectProc(_proName: proName, spmtr: sqlParameters);
        int result = int.Parse(ds.Tables[0].Rows[0][0].ToString());
        return (result > 0);
    }

    public static void RouteUser()
    {
         bool Admin = Auth_BLL.checkRole(Auth_BLL.currentUserId(), 1);
         bool instructor = Auth_BLL.checkRole(Auth_BLL.currentUserId(), 3);
         
        if ((Admin == true) || (instructor == true) )
            HttpContext.Current.Response.Redirect("adminPages/profile.aspx");
            else 
                HttpContext.Current.Response.Redirect("StudentHome.aspx");
    }
#region Route user
    /*
    public static void RouteUser()
    {
        string path = string.Empty;
        string rurl = string.Empty;
        path = HttpContext.Current.Request.Url.AbsolutePath;
        rurl = HttpContext.Current.Request.QueryString["url"] != null ? HttpContext.Current.Request.QueryString["url"] : string.Empty;

        if (userlogged() == true)
        {
            bool Admin = Auth_BLL.checkRole(Auth_BLL.currentUserId(), 1);
            bool instructor = Auth_BLL.checkRole(Auth_BLL.currentUserId(), 3);

            if (!string.IsNullOrEmpty(rurl))
            {
                rurl = rurl.TrimStart('/');
                HttpContext.Current.Response.Redirect(rurl);
            }
            else if (((Admin == true) || (instructor == true)) && (path.IndexOf("profile.aspx") == -1) )
                HttpContext.Current.Response.Redirect("profile.aspx");
            else if ((path.IndexOf("StudentHome.aspx") == -1))
                HttpContext.Current.Response.Redirect("StudentHome.aspx");
          

        }

        else if (path.IndexOf("login.aspx") == -1)
            HttpContext.Current.Response.Redirect("~/login.aspx?url=" + path);

    }*/
#endregion
} 
