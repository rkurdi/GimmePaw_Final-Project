using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Newtonsoft.Json;
using System.IO;

namespace ProjectTest
{
    public partial class DogFood : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
           GridView_df.DataSource = DogFoodAccess.GetDogFood();
           GridView_df.DataBind();
        }
    }
}