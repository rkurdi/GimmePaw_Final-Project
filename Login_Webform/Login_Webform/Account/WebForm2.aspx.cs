using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Hosting;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.HtmlControls;
using System.Web.Services;
using System.IO;


namespace Login_Webform.Account
{
    public partial class WebForm2 : System.Web.UI.Page
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
                //Response.Write(hiddenlabel.Value);

                //hiddenlabel.Value = ;
                
            }
        }

        [WebMethod]
        public static string RegisterUser(string obj)
        {

            return obj;
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            string pathToCreate = "~/Favorites/" + Session["Username"].ToString() + "/";
            string favoritePath = Server.MapPath(pathToCreate + "Parks.txt");
            StreamWriter w;

            if (System.IO.Directory.Exists(Server.MapPath(pathToCreate)))
            {
                var toWrite = hiddenlabel.Value;

                //create file
                if (!File.Exists(favoritePath))
                {
                    w = File.CreateText(Server.MapPath(pathToCreate + "Parks.txt"));
//                    w.Write("[");
                    w.WriteLine(toWrite);
//                    w.WriteLine("]");
                    
                }
                 
                //append only
                else 
                {
                    hiddenlabel.Value = pathToCreate + "Parks.txt";
                    var lines = File.ReadAllLines(Server.MapPath(pathToCreate + "Parks.txt"));
                    File.WriteAllLines(Server.MapPath(pathToCreate + "Parks.txt"), lines.Take(lines.Length - 1));
                    w = File.AppendText(favoritePath);
//                    w.Write(",");
                    w.WriteLine(toWrite);
//                    w.WriteLine("]");
                }
            }
            else
            {
                System.IO.Directory.CreateDirectory(Server.MapPath(pathToCreate));
                var toWrite = hiddenlabel.Value;

                w = File.CreateText(Server.MapPath(pathToCreate + "Parks.txt"));
  //              w.Write("[");
                w.WriteLine(toWrite);
//                w.WriteLine("]");
            }
            w.Flush();
            w.Close();
        }
    }
}