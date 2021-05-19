using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Drawing;
using System.Drawing.Drawing2D;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class AddGallery : System.Web.UI.Page
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
            allsliderdata();
        }
    }

    protected void allsliderdata()
    {

        SqlCommand cmd = new SqlCommand("sp_homeSlider", con);
        cmd.CommandType = System.Data.CommandType.StoredProcedure;
        cmd.Parameters.AddWithValue("@mode", "AllGallerydata");
        SqlDataAdapter da = new SqlDataAdapter(cmd);
        DataTable dt = new DataTable();
        da.Fill(dt);
        if (dt.Rows.Count > 0)
        {
            gvslider.DataSource = dt;
            gvslider.DataBind();
        }
        else
        {

        }

    }

    protected void btnsave_Click(object sender, EventArgs e)
    {
        string profilePath = "";
        if (txttitle.Text == "")
        {
            ScriptManager.RegisterStartupScript(this, GetType(), "showalert", "alert('Please enter Text !');", true);
            return;
        }
        if (fpsilder.HasFile == true)
        {

            string image1 = System.IO.Path.GetExtension(fpsilder.FileName);
            if (image1.ToUpper() == ".PNG" || image1.ToUpper() == ".JPG" || image1.ToUpper() == ".JPEG")
            {
                int FIleSize = Convert.ToInt32(fpsilder.PostedFile.ContentLength.ToString());
                if (FIleSize > 10120000)
                {
                    ScriptManager.RegisterStartupScript(this, GetType(), "showalert", "alert('File Size Should Be Less Than 10MB');", true);
                    return;
                }
                else
                {
                    Stream strm = fpsilder.PostedFile.InputStream;
                    using (var image = System.Drawing.Image.FromStream(strm))
                    {
                        int newWidth = 1420; // New Width of Image in Pixel  
                        int newHeight = 1420; // New Height of Image in Pixel  
                        var thumbImg = new Bitmap(newWidth, newHeight);
                        var thumbGraph = Graphics.FromImage(thumbImg);
                        thumbGraph.CompositingQuality = CompositingQuality.HighQuality;
                        thumbGraph.SmoothingMode = SmoothingMode.HighQuality;
                        thumbGraph.InterpolationMode = InterpolationMode.HighQualityBicubic;
                        var imgRectangle = new Rectangle(0, 0, newWidth, newHeight);
                        thumbGraph.DrawImage(image, imgRectangle);

                        profilePath = "/Writereaddata/Gallery/" + "image1_" + DateTime.Now.ToString().Replace("/", "_").Replace("\\", "_").Replace(":", "_") + "." + fpsilder.FileName.Substring(fpsilder.FileName.LastIndexOf(".") + 1);
                        string profilePath1 = "image1_" + DateTime.Now.ToString().Replace("/", "_").Replace("\\", "_").Replace(":", "_") + "." + fpsilder.FileName.Substring(fpsilder.FileName.LastIndexOf(".") + 1);
                        string imgpath = Server.MapPath(@"~/Writereaddata/Gallery/") + profilePath1;
                        thumbImg.Save(imgpath, image.RawFormat);
                    }
                }
            }
            else
            {
                ScriptManager.RegisterStartupScript(this, GetType(), "Showalert", "alert('Please Upload Image File .PNG  .JPG .JPEG');", true);
                return;
            }
        }
        else
        {
            ScriptManager.RegisterStartupScript(this, GetType(), "Showalert", "alert('Please Upload Image File .PNG  .JPG .JPEG", true);
            return;
        }
        con.Open();
        SqlCommand cmd = new SqlCommand("sp_homeSlider", con);
        cmd.CommandType = System.Data.CommandType.StoredProcedure;
        cmd.Parameters.AddWithValue("@mode", "insertGallery");
        cmd.Parameters.AddWithValue("@Title", txttitle.Text);
        cmd.Parameters.AddWithValue("@Sliderimage", profilePath);
        cmd.Parameters.AddWithValue("@Addby", "admin");
        int x = cmd.ExecuteNonQuery();
        if (x > 0)
        {
            ScriptManager.RegisterStartupScript(this, GetType(), "Showalert", "alert('your Gallery image save !');", true);
            con.Close();
            allsliderdata();
            con.Dispose();
        }
        else
        {
            ScriptManager.RegisterStartupScript(this, GetType(), "Showalert", "alert('Something went wrong !');", true);
        }

    }

    protected void gvslider_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        if (e.CommandName == "True")
        {
            con.Open();
            SqlCommand cmd = new SqlCommand("sp_homeSlider", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@mode", "DeleteGallery");
            cmd.Parameters.AddWithValue("@id", Convert.ToInt16(e.CommandArgument.ToString()));
            cmd.ExecuteNonQuery();
            con.Close();
            ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('Your image is lock!');window.location.href='AddGallery.aspx'", true);

        }
        else if (e.CommandName == "False")
        {
            con.Open();
            SqlCommand cmd = new SqlCommand("sp_homeSlider", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@mode", "UnDeleteGallery");
            cmd.Parameters.AddWithValue("@id", Convert.ToInt16(e.CommandArgument.ToString()));
            cmd.ExecuteNonQuery();
            con.Close();
            ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('Your image is un-lock!');window.location.href='AddGallery.aspx'", true);
        }
        else if (e.CommandName == "Del")
        {
            con.Open();
            SqlCommand cmd = new SqlCommand("sp_homeSlider", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@mode", "deleteGalleryFinally");
            cmd.Parameters.AddWithValue("@id", Convert.ToInt16(e.CommandArgument.ToString()));
            cmd.ExecuteNonQuery();
            con.Close();
            ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('Your image is Delete!');window.location.href='AddGallery.aspx'", true);
        }

    }

    protected void gvslider_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        if (e.Row.RowType == DataControlRowType.DataRow)
        {
            Button btn = (Button)e.Row.FindControl("btndelete");
            Label lblStatus = (Label)e.Row.FindControl("lblStatus");

            if (lblStatus.Text == "True")
            {
                btn.Text = "Lock";
            }
            else
            {
                btn.Text = "Un-Lock";
                btn.CssClass = "btn btn-success";
            }
        }
    }

    protected void gvslider_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        gvslider.PageIndex = e.NewPageIndex;
        allsliderdata();
    }
}