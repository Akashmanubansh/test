using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Configuration;
using System.Data.SqlClient;

public partial class Blog : System.Web.UI.Page
{
    SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["conCordatus"].ConnectionString);
    protected void Page_Load(object sender, EventArgs e)
    {
        bloglist();
    }

    public void bloglist()
    {
        SqlCommand cmd = new SqlCommand("sp_web_Blog", con);
        cmd.CommandType = System.Data.CommandType.StoredProcedure;
        cmd.Parameters.AddWithValue("@mode", "list");
        SqlDataAdapter da = new SqlDataAdapter(cmd);
        DataTable dt = new DataTable();
        da.Fill(dt);
        if (dt.Rows.Count > 0)
        {
            listrepate.DataSource = dt;
            listrepate.DataBind();
        }
        else
        {

        }

    }



    protected void hylink_Command(object sender, CommandEventArgs e)
    {
        if (e.CommandName != null)
        {
            SqlCommand cmd = new SqlCommand("sp_web_Blog", con);
            cmd.CommandType = System.Data.CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@mode", "blogread");
            cmd.Parameters.AddWithValue("@trackid", e.CommandName.ToString());
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            da.Fill(dt);
            if (dt.Rows.Count > 0)
            {
                repateblogfull.DataSource = dt;
                repateblogfull.DataBind();
            }
        }
    }
}