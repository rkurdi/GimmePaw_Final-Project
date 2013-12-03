using System;
using System.Collections.Generic;
using System.Linq;
using System.IO;

using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Data.SqlClient;
using System.Xml.Linq;

namespace Login_Webform.Account
{
    public partial class DogProfile : System.Web.UI.Page
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
                SqlConnection updateConnect = new SqlConnection("Data Source=.\\SQLEXPRESS;Initial Catalog=Database2;Integrated Security=True");
                updateConnect.Open();
                //static SqlDataReader dataread;

                SqlCommand updateCmd;
                updateCmd = new SqlCommand("SELECT * FROM DogProfile WHERE username='"+lblName.Text+"'", updateConnect);
                SqlDataReader dataread;
                dataread = updateCmd.ExecuteReader();
                if (dataread.Read())
                {
                    DogName.Text = dataread["name"].ToString();
                    Gender.Text = dataread["gender"].ToString();
                    Age.Text = dataread["age"].ToString();
                    Breed.Text = dataread["breed"].ToString();

                }
                
                string pathToCreate = "~/Favorites/" + Session["Username"].ToString() + "/";
                string favoritePath = Server.MapPath(pathToCreate + "Parks.txt");
                StreamWriter w;
                if (System.IO.Directory.Exists(Server.MapPath(pathToCreate)))
                {

                    //create file
                    if (!File.Exists(favoritePath))
                    {
                        w = File.CreateText(Server.MapPath(pathToCreate + "Parks.txt"));
                        w.Close();
                    }
                    else
                    {
                        StreamReader sr = new StreamReader(favoritePath);
                        string line;
                        while ((line = sr.ReadLine()) != null)
                        {
                            FavoriteParks.Text += line;
                        }
                        sr.Close();
                    }
                }
                else
                {
                    System.IO.Directory.CreateDirectory(Server.MapPath(pathToCreate));
                    w = File.CreateText(Server.MapPath(pathToCreate + "Parks.txt"));
                    w.Close();
                }

            }
            
        }

        protected void logout_Click(object sender, EventArgs e)
        {
            Session.Clear();
            Response.Redirect("Login.aspx");
        }

        
    }
}