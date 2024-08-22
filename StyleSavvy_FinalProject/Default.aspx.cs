using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace StyleSavvy_FinalProject
{
    public partial class Default : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["userName"] == null)
            {
                Response.Redirect("Login");
            }
        }

        protected void shopBtn_Click(object sender, EventArgs e)
        {
            var button = (LinkButton)sender;
            String categoryId = button.CommandArgument;

            Session["categoryId"] = categoryId;

            Response.Redirect("Products");
        }
    }
}