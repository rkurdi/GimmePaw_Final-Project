using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.IO;
using Newtonsoft.Json;

namespace Login_Webform.Account
{
    public partial class Profile : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            //makes sure user is logged in
            if (HttpContext.Current.Session["Username"] == null)
            {
                Response.Redirect("Login.aspx");
            }
            else
            {
                lblName.Text = Session["Username"].ToString();
                string pathToCreate = "~/Favorites/" + Session["Username"].ToString() + "/";
                string favoritePath = Server.MapPath(pathToCreate + "Parks.txt");
//                FavoriteFoods.Text = "TEST";
                StreamReader sr = new StreamReader(favoritePath);
                //JsonTextReader jr = new JsonTextReader(sr);
                string line;
                while ((line = sr.ReadLine() ) != null)
                {

                    
                        FavoriteParks.Text += line;

                }
                sr.Close();
                //String line = sr.ReadToEnd();
                
                //obj.Value = line;
                //FavoriteFoods.Text = line;
//                Console.WriteLine(line);


            }
        }

        protected void DogName_TextChanged(object sender, EventArgs e)
        {

        }

        protected void Breed_TextChanged(object sender, EventArgs e)
        {

        }
    }
}