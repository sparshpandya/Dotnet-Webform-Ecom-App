using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using StyleSavvy_FinalProject.Models;

namespace StyleSavvy_FinalProject
{
    public partial class Confirmation : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

            if (Session["userName"] == null)
            {
                Response.Redirect("Login");
            }

            if (Session["orderInfo"] != null)
            {
                OrderInfo orderInfo = (OrderInfo)Session["orderInfo"];

                litFullName.Text = orderInfo.FullName;
                litFullNameDetail.Text = orderInfo.FullName;
                litEmail.Text = orderInfo.Email;
                litAddress.Text = orderInfo.Address;
                litCity.Text = orderInfo.City;
                litState.Text = orderInfo.State;
                litZip.Text = orderInfo.Zip;
                litCreditCard.Text = orderInfo.CreditCard;
                litExpirationDate.Text = orderInfo.ExpirationDate;
                litCVV.Text = orderInfo.CVV;
            }
            else
            {
                Response.Redirect("Checkout.aspx");
            }
        }
    }
}