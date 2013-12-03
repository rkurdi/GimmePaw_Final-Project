using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.IO;

namespace Login_Webform.Account
{
    public partial class UploadImages : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (HttpContext.Current.Session["Username"] == null)
            {
                Response.Redirect("Login.aspx");
            }
            else
            {
                lblName.Text = Session["Username"].ToString();

            }
            string pathToCreate = "~/PDFImages/" + Session["Username"].ToString() + "/";
            string pathToCreate1 = "~/PDFToConvert/" + Session["Username"].ToString() + "/";
            if (!System.IO.Directory.Exists(Server.MapPath(pathToCreate)) && !System.IO.Directory.Exists(Server.MapPath(pathToCreate1)))
            {
                System.IO.Directory.CreateDirectory(Server.MapPath(pathToCreate));
                System.IO.Directory.CreateDirectory(Server.MapPath(pathToCreate1));
            }


            string[] filesindirectory = Directory.GetFiles(Server.MapPath("../Images/" + Session["Username"].ToString()));
            List<String> images = new List<string>(filesindirectory.Count());
            string[] hiddenLabels = new string[filesindirectory.Count()];
            //hiddencount.Value = String.Join(",",hiddenLabels);
            int count = 0;
            foreach (string item in filesindirectory)
            {

                images.Add(String.Format("../Images/" + Session["Username"].ToString() + "/{0}", System.IO.Path.GetFileName(item)));
                string[] name = item.Split('.');
                string tmp_fname = name[name.Length - 2];
                string[] fname = tmp_fname.Split('\\');
                hiddenLabels[count] = fname[fname.Length - 1];
                count++;
            }
            hiddenlabel.Value = String.Join("&", hiddenLabels);

            RepeaterImages.DataSource = images;
            RepeaterImages.DataBind();

        }

        protected void Button1_Click1(object sender, EventArgs e)
        {
            string pathToCreate = "~/Images/" + Session["Username"].ToString()+"/";
            if(System.IO.Directory.Exists(Server.MapPath(pathToCreate)))
            {

                FileUpload1.SaveAs(Server.MapPath(pathToCreate + FileUpload1.FileName));
            }
            else
            {
                System.IO.Directory.CreateDirectory(Server.MapPath(pathToCreate));
                FileUpload1.SaveAs(Server.MapPath(pathToCreate + FileUpload1.FileName));
            }

            StatusLabel.Text = "Upload status: " + FileUpload1.FileName + " uploaded!" + pathToCreate;
        }

        protected void LinkButton1_Click(object sender, EventArgs e)
        {
            Session["Username"] = lblName.Text;
            Response.Redirect("Home.aspx");

        }

        protected void logout_Click(object sender, EventArgs e)
        {
            Session.Clear();
            Response.Redirect("Login.aspx");
        }
    }
}