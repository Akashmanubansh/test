using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class AdminMaster : System.Web.UI.MasterPage
{
    SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["conCordatus"].ConnectionString);
    protected void Page_Load(object sender, EventArgs e)
    {

        if (Session["empid"] == null || Session["usertype"] == null || Session["Office"] == null)
        {
            Response.Redirect("Default.aspx", true);
        }
        else
        {
            username();
        }
    }
    public void username()
    {
        con.Open();
        SqlDataAdapter da = new SqlDataAdapter("select  FName +' '+ MName +' '+ LName  as EmpName, EmpPhoto  from EmployeeMaster where  EmpID= 'admin' ", con);
        DataTable dt = new DataTable();
        da.Fill(dt);
        if (dt.Rows.Count > 0)
        {
            lbladdmin2.Text = dt.Rows[0]["EmpName"].ToString();
            lbladdmin.Text = dt.Rows[0]["EmpName"].ToString();
            adminusername3.Text = dt.Rows[0]["EmpName"].ToString();
            if (dt.Rows[0]["EmpPhoto"].ToString() != "")
            {
                userimage.ImageUrl = "/Writereaddata/EmployeeImage/" + dt.Rows[0]["EmpPhoto"].ToString();

                Image1.ImageUrl = "/Writereaddata/EmployeeImage/" + dt.Rows[0]["EmpPhoto"].ToString();
                Image222.ImageUrl = "/Writereaddata/EmployeeImage/" + dt.Rows[0]["EmpPhoto"].ToString();
            }
            else
            {
                //hplnkSitePlan.Visible = false;
                if (userimage.ImageUrl == "")
                {
                    userimage.ImageUrl = "/Writereaddata/EmployeeImage/adminpic.png";
                }
                if (Image1.ImageUrl == "")
                {
                    Image1.ImageUrl = "/Writereaddata/EmployeeImage/adminpic.png";
                }
                if (Image222.ImageUrl == "")
                {
                    Image222.ImageUrl = "/Writereaddata/EmployeeImage/adminpic.png";
                }
            }
        }
        else
        {
        }
        con.Close();
    }

    protected void btnsave_Click(object sender, EventArgs e)
    {

        Session.Clear();
        Session.Abandon();
        FormsAuthentication.SignOut();
        Response.Cache.SetCacheability(HttpCacheability.NoCache);
        Response.ClearHeaders();
        Session.RemoveAll();
        Response.CacheControl = "no-cache";
        Response.Cache.SetExpires(DateTime.UtcNow.AddMinutes(-1));
        Response.Cache.SetCacheability(HttpCacheability.NoCache);
        Response.Cache.SetNoStore();
        Response.Redirect("Default.aspx", true);
    }
}
