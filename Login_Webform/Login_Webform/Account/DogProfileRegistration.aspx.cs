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
    public partial class DogProfileRegistration : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            string username = Session["Username"].ToString();
        }


        protected void Gender_CheckedChange(object sender, EventArgs e)
        {
            if (Male.Checked == true)
            {
                Gender.Value = "male";
            }
            else if (Female.Checked == true)
            {
                Gender.Value = "female";
            }
        }

        protected void SaveDogProfile_Click(object sender, EventArgs e)
        {
            SqlConnection updateConnect = new SqlConnection("Data Source=.\\SQLEXPRESS;Initial Catalog=Database2;Integrated Security=True");
            updateConnect.Open();
            //static SqlDataReader dataread;
            string user = Session["Username"].ToString();
            SqlCommand updateCmd;
            updateCmd = new SqlCommand("INSERT INTO DogProfile (username, name, gender, breed, age) values (@username, @name, @gender, @breed, @age)", updateConnect);
            updateCmd.Parameters.AddWithValue("@username", user);
            updateCmd.Parameters.AddWithValue("@name", DogName.Text);
            updateCmd.Parameters.AddWithValue("@gender", Gender.Value);
            updateCmd.Parameters.AddWithValue("@breed", Breed.Text);
            updateCmd.Parameters.AddWithValue("@age", Age.Text);

            updateCmd.ExecuteNonQuery();
            updateCmd.Dispose();
            updateConnect.Close();

            Session["Username"] = user;
            Response.Redirect("~/Account/Home.aspx");
        }
    }
}