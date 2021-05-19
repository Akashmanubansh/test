using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class ContactUS : System.Web.UI.Page
{
    SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["conCordatus"].ConnectionString);
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void btnSubmit_Click(object sender, EventArgs e)
    {
        if (txtName.Text == "")
        {
            ScriptManager.RegisterStartupScript(this, GetType(), "showalert", "alert('Please enter Name !');", true);
            return;
        }
        else if (txtEmail.Text == "")
        {
            ScriptManager.RegisterStartupScript(this, GetType(), "showalert", "alert('Please enter Email !');", true);
            return;
        }
        else if (txtMobile.Text == "")
        {
            ScriptManager.RegisterStartupScript(this, GetType(), "showalert", "alert('Please enter Mobile !');", true);
            return;
        }
        else
        {
            SqlCommand cmd = new SqlCommand("insert into ContactUS(Name,Email,Message,AddedOn,Mobile)  values ('" + txtName.Text + "','" + txtEmail.Text + "','" + txtMessage.Text + "','" + DateTime.Now + "','" + txtMobile.Text + "') ", con);
            con.Open();
            int x = cmd.ExecuteNonQuery();
            con.Close();
            if (x > 0)
            {
                ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('Your Information is saved');window.location.href='/ContactUS.aspx'", true);
            }
            else
            {
                ScriptManager.RegisterStartupScript(this, GetType(), "showalert", "alert('Something Went Wrong)');", true);
                return;
            }
        }
    }
}