using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Login_Webform.Account
{
    public partial class NewHome : System.Web.UI.Page
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
            }
        }

        protected void logout_Click(object sender, EventArgs e)
        {
            Session.Clear();
            Response.Redirect("Login.aspx");            
        }
    }
}