using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Newtonsoft.Json;
using System.IO;

namespace Login_Webform.Account
{
    public partial class CouponTest : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            //GridView1.DataSource = CouponAccess.GetCoupons();
            //GridView1.DataBind();
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            CouponAccess.LatLong(TextBox1.Text);
            GridView1.DataSource = CouponAccess.GetCoupons();
            GridView1.DataBind();
            //Response.Redirect("~/Account/CouponTest.aspx");
        }


    }
}