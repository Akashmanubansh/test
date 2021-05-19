using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.IO;
using System.Configuration;

public partial class MKSCGROUP_Blog : System.Web.UI.Page
{
    SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["conCordatus"].ConnectionString);
    EMailSMS emailsms = new EMailSMS();

    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["empid"] == null || Session["usertype"] == null || Session["Office"] == null)
        {
            Response.Redirect("Default.aspx", true);
        }
        if (!IsPostBack)
        {
            blogdata();
        }
    }

    public void blogdata()
    {
        SqlCommand cmd = new SqlCommand("sp_web_Blog", con);
        cmd.CommandType = CommandType.StoredProcedure;
        cmd.Parameters.AddWithValue("@mode", "blogdata");
        SqlDataAdapter da = new SqlDataAdapter(cmd);
        DataTable dt = new DataTable();
        da.Fill(dt);
        if (dt.Rows.Count > 0)
        {
            grvblog.DataSource = dt;
            grvblog.DataBind();
        }
    }

    private string generateempid(string FName, string MName, string LName)
    {
        if (MName.Length == 0 && LName.Length == 0)
        {
            return FName.Substring(0, 3).ToUpper();
        }
        else if (LName.Length == 0 && MName.Length != 0)
        {
            return FName.Substring(0, 1).ToUpper() + MName.Substring(0, 2).ToUpper();
        }
        else if (MName.Length == 0 && LName.Length != 0)
        {
            return FName.Substring(0, 1).ToUpper() + LName.Substring(0, 2).ToUpper();
        }
        else
        {
            return FName.Substring(0, 1).ToUpper() + MName.Substring(0, 1).ToUpper() + LName.Substring(0, 1).ToUpper();
        }
    }


    protected void btnsave_Click1(object sender, EventArgs e)
    {
        string ipAddress = emailsms.IpAddress();

        if (txtblog.Text == "")
        {
            ScriptManager.RegisterStartupScript(this, GetType(), "showalert", "alert('Please Enter Blog Title');", true);
            return;
        }
        else if (txtDescription.Text == "")
        {
            ScriptManager.RegisterStartupScript(this, GetType(), "showalert", "alert('Please Enter Blog Description');", true);
            return;
        }

        else if (txtblogername.Text == "")
        {
            ScriptManager.RegisterStartupScript(this, GetType(), "showalert", "alert('Please Enter Blog Name');", true);
            return;
        }

        else if (txtemailid.Text == "")
        {
            ScriptManager.RegisterStartupScript(this, GetType(), "showalert", "alert('Please Enter Blog Email id');", true);
            return;
        }
        if (btnsave.Text == "Save")
        {
            SqlCommand cmd = new SqlCommand("sp_web_Blog", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@mode", "addblog");
            cmd.Parameters.AddWithValue("@blogtitle", txtblog.Text);
            cmd.Parameters.AddWithValue("@blogDescription", txtDescription.Text);
            cmd.Parameters.AddWithValue("@NAMEOFBLOG", txtblogername.Text);
            cmd.Parameters.AddWithValue("@BLOGEREMAILID", txtemailid.Text);
            string fileName = "";
            if (fempimage.HasFile == true)
            {
                string fileextension = Path.GetExtension(fempimage.FileName);
                if (fileextension.ToUpper() == ".JPG" || fileextension.ToUpper() == ".PNG" || fileextension.ToUpper() == ".JPEG")
                {
                    fileName = generateempid(txtblog.Text, "", "") + "_" + "".Replace("/", "") + "_" + DateTime.Now.ToString("ddMMyyyyThhMMss") + "" + fileextension;
                    fempimage.SaveAs(Request.PhysicalApplicationPath + "/Writereaddata/Blog/" + fileName);
                }
                else
                {
                    ScriptManager.RegisterStartupScript(this, GetType(), "showalert", "alert('Please Select a valid image (only png,jpg,jpeg allowed)');", true);
                    return;
                }
            }
            else
            {
                ScriptManager.RegisterStartupScript(this, GetType(), "showalert", "alert('Please Upload a valid image (only png,jpg,jpeg allowed)');", true);
                return;
            }
            cmd.Parameters.AddWithValue("@blogimage", fileName);
            cmd.Parameters.AddWithValue("@ipaddress", ipAddress);
            con.Open();
            int res = cmd.ExecuteNonQuery();

            if (res > 0)
            {
                // ScriptManager.RegisterStartupScript(this, GetType(), "showalert", "alert('Your blog description saved successfully');", true);
                ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('Your blog description saved successfully');window.location.href='/Blog.aspx'", true);
            }
            con.Close();

        }
        else if (btnsave.Text == "Update")
        {
            SqlCommand cmd = new SqlCommand("sp_web_Blog", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@mode", "update");
            cmd.Parameters.AddWithValue("@trackid", ViewState["id"]);
            cmd.Parameters.AddWithValue("@blogtitle", txtblog.Text);
            cmd.Parameters.AddWithValue("@blogDescription", txtDescription.Text);
            cmd.Parameters.AddWithValue("@NAMEOFBLOG", txtblogername.Text);
            cmd.Parameters.AddWithValue("@BLOGEREMAILID", txtemailid.Text);
            ViewState["image"].ToString();
            string fileName = "";
            if (fempimage.HasFile == true)
            {
                string fileextension = Path.GetExtension(fempimage.FileName);
                if (fileextension.ToUpper() == ".JPG" || fileextension.ToUpper() == ".PNG" || fileextension.ToUpper() == ".JPEG")
                {
                    fileName = generateempid(txtblog.Text, "", "") + "_" + "".Replace("/", "") + "_" + DateTime.Now.ToString("ddMMyyyyThhMMss") + "" + fileextension;
                    fempimage.SaveAs(Request.PhysicalApplicationPath + "/Writereaddata/Blog/" + fileName);
                    ViewState["Filename"] = fileName;

                }
                else
                {
                    ScriptManager.RegisterStartupScript(this, GetType(), "showalert", "alert('Please Select a valid image (only png,jpg,jpeg allowed)');", true);
                    return;
                }
            }
            else
            {
                fileName = ViewState["image"].ToString();
            }
            cmd.Parameters.AddWithValue("@blogimage", fileName);
            cmd.Parameters.AddWithValue("@ipaddress", ipAddress);
            con.Open();
            int res = cmd.ExecuteNonQuery();

            if (res > 0)
            {
                ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('Your blog description saved successfully');window.location.href='/Blog.aspx'", true);
            }
            con.Close();
        }
    }

    protected void grvblog_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        grvblog.PageIndex = e.NewPageIndex;
        this.blogdata();
    }

    protected void grvblog_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        if (e.CommandName == "Edit123")
        {
            SqlCommand cmd = new SqlCommand("sp_web_Blog", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@mode", "edit123");
            cmd.Parameters.AddWithValue("@trackid", e.CommandArgument.ToString());
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            da.Fill(dt);
            if (dt.Rows.Count > 0)
            {
                txtblog.Text = dt.Rows[0]["blogtitle"].ToString();
                txtDescription.Text = dt.Rows[0]["blogDescription"].ToString();
                txtemailid.Text = dt.Rows[0]["BLOGEREMAILID"].ToString();
                txtblogername.Text = dt.Rows[0]["NAMEOFBLOG"].ToString();
                ViewState["image"] = dt.Rows[0]["blogimage"].ToString();
                ViewState["id"] = e.CommandArgument.ToString();
                btnsave.Text = "Update";
            }

        }
        else if (e.CommandName == "Delete123")
        {
            SqlCommand cmd = new SqlCommand("sp_web_Blog", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@mode", "delete12");
            cmd.Parameters.AddWithValue("@trackid", e.CommandArgument.ToString());
            ViewState["id"] = e.CommandArgument.ToString();
            con.Open();
            int rest = cmd.ExecuteNonQuery();
            if (rest > 0)
            {
                ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('Your record delete successful');window.location.href='/Blog.aspx'", true);
            }
            con.Close();

        }
    }
}