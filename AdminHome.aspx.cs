using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class AdminHome : System.Web.UI.Page
{
    SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["conCordatus"].ConnectionString);
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["empid"] == null || Session["usertype"] == null || Session["Office"] == null)
        {
            Response.Redirect("Default.aspx", true);
        }

        if (!IsPostBack)
        {
            CountGallery();
            CountBlog();
            CountContactUS();
        }
    }

    void CountGallery()
    {
        SqlDataAdapter sda = new SqlDataAdapter("select count(id) as id from Gallery", con);
        DataTable dt = new DataTable();
        sda.Fill(dt);
        if (dt.Rows.Count > 0)
        {
            lblGallery.Text = dt.Rows[0]["id"].ToString();
        }
        else
        {
            lblGallery.Text = "0";
        }
    }

    void CountBlog()
    {
        SqlDataAdapter sda = new SqlDataAdapter("select count(TrackID) as id from web_Blog", con);
        DataTable dt = new DataTable();
        sda.Fill(dt);
        if (dt.Rows.Count > 0)
        {
            lblBlog.Text = dt.Rows[0]["id"].ToString();
        }
        else
        {
            lblBlog.Text = "0";
        }
    }

    void CountContactUS()
    {
        SqlDataAdapter sda = new SqlDataAdapter("select count(TrackID) as id from ContactUS", con);
        DataTable dt = new DataTable();
        sda.Fill(dt);
        if (dt.Rows.Count > 0)
        {
            lblContact.Text = dt.Rows[0]["id"].ToString();
        }
        else
        {
            lblContact.Text = "0";
        }
    }


    protected void LinkButton1_Click(object sender, EventArgs e)
    {
        Response.Redirect("AddGallery.aspx", true);
    }

    protected void LinkButton2_Click(object sender, EventArgs e)
    {
        Response.Redirect("Blog.aspx", true);
    }

    protected void LinkButton3_Click(object sender, EventArgs e)
    {
        Response.Redirect("ViewContactUS.aspx", true);
    }
}