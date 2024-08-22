using System;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using StyleSavvy_FinalProject.Models;

namespace StyleSavvy_FinalProject
{
    public partial class Checkout : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["userName"] == null)
            {
                Response.Redirect("Login");
            }
        }

        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            string fullName = txtFullName.Text;
            string email = txtEmail.Text;
            string address = txtAddress.Text;
            string city = txtCity.Text;
            string state = txtState.Text;
            string zip = txtZip.Text;
            string credit = txtCreditCard.Text;
            string exp = txtExpirationDate.Text;
            string cvv = txtCVV.Text;

            OrderInfo orderInfo = new OrderInfo
            {
                FullName = fullName,
                Email = email,
                Address = address,
                City = city,
                State = state,
                Zip = zip,
                CreditCard = credit,
                ExpirationDate = exp,
                CVV = cvv
            };

            Session["orderInfo"] = orderInfo;

            if (Page.IsValid)
            {
                Session.Remove("cartItem");
                Response.Redirect("Confirmation");
            }
        }
    }
}
