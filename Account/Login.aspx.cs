using Microsoft.AspNet.Identity;
using Microsoft.Owin.Security;
using System;
using System.Web;
using System.Web.UI;
using Education_SYS;
using System.Data;
using System.Configuration;
using System.Linq;
using System.Web.Security;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Xml.Linq;
using System.Data.SqlClient;
using System.Web.Configuration;
using System.Collections.Generic;
public partial class Account_Login : Page
{
        protected void Page_Load(object sender, EventArgs e)
        {
           
            RegisterHyperLink.NavigateUrl = "Register";
            var returnUrl = HttpUtility.UrlEncode(Request.QueryString["ReturnUrl"]);
           if (!String.IsNullOrEmpty(returnUrl))
            {
                Response.Write("<script> alert(" + 123 + ")</script>");
                RegisterHyperLink.NavigateUrl += "?ReturnUrl=" + returnUrl;
                
            }
        }

        protected void LogIn(object sender, EventArgs e)
        {
            Response.Write("<script>alert(登录)</script>");
            String  _connectionString = WebConfigurationManager.ConnectionStrings["Edu"].ConnectionString;
            SqlConnection con = new SqlConnection(_connectionString);
            SqlCommand cmd = new SqlCommand("SELECT vUserName,vPassword,vName from Teacher where vUserName=@vUserName and vPassword=@vPassword", con);
            cmd.Parameters.AddWithValue("@vUserName", UserName.Text);
            cmd.Parameters.AddWithValue("@vPassword", Password.Text);
            
            Response.Write("<script>alert("+(string)UserName.Text+"@"+(string)Password.Text +")</script>");
            int result;
            SqlDataReader reader;
            using (con)
            {
                con.Open();
                reader = cmd.ExecuteReader();
                reader.Read();
               // result =cmd.ExecuteNonQuery();
                try
                {
                    Response.Write("<script>alert(" + (string)reader["vPassword"] + ")</script>");
                    //string msg = "登录成功";
                  //  Response.Write("<script>alert('" + msg + "')</script>");
                    HttpCookie cookie = new HttpCookie("MyCook");//初使化并设置Cookie的名称
                    DateTime dt = DateTime.Now;
                    TimeSpan ts = new TimeSpan(0, 0, 1, 0, 0);//过期时间为1分钟
                    cookie.Expires = dt.Add(ts);//设置过期时间
                    cookie.Values.Add("Name", (string)reader["vName"]);
                     Response.AppendCookie(cookie);
                     Response.Redirect("myWeb");
                }
                catch
                {
                    string msg = "登录失败,请输入正确的帐号和密码";
                    Response.Write("<script>alert('"+msg+"')</script>");
                }
             
               con.Close();
            }
            
           
            
            /*
            if (IsValid)
            {
                // Validate the user password
                var manager = new UserManager();
                ApplicationUser user = manager.Find(UserName.Text, Password.Text);
                if (user != null)
                {
                    IdentityHelper.SignIn(manager, user);
                    IdentityHelper.RedirectToReturnUrl(Request.QueryString["ReturnUrl"], Response);
                }
                else
                {
                    FailureText.Text = "Invalid username or password.";
                    ErrorMessage.Visible = true;
                }
            }*/
        }
}