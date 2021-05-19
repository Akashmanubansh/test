using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class _Default : System.Web.UI.Page
{
    SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["conCordatus"].ConnectionString);
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {           
            ShowSlider();
        }
    }

    void ShowSlider()
    {
        SqlDataAdapter sda = new SqlDataAdapter("select title,Sliderimage from homeSlider where status=1", con);
        DataTable dt = new DataTable();
        sda.Fill(dt);
        if (dt.Rows.Count > 0)
        {
            Repeater1.DataSource = dt;
            Repeater1.DataBind();
        }
    }    

    protected void Repeater1_ItemDataBound(object sender, RepeaterItemEventArgs e)
    {
        if (e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem)
        {
            //Label lblCapEng = (Label)e.Item.FindControl("lblCapEng");

            //Label lblcaption = (Label)e.Item.FindControl("lblcaption");
            //if (Session["lang"].ToString() == "en-US")
            //{
            //    lblcaption.Text = lblCapEng.Text;
            //}
            //else
            //{
            //    lblcaption.Text = lblCapHindi.Text;
            //}
        }
    }
}