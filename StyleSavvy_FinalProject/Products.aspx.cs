using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace StyleSavvy_FinalProject
{
    public partial class Products : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["userName"] == null)
            {
                Response.Redirect("Login");
            }

            if (!IsPostBack)
            {
                if (Session["CategoryId"] != null)
                {
                    DropDownList1.SelectedValue = Session["CategoryId"].ToString();
                }
                else
                {
                    Session["CategoryId"] = 1;
                }
            }
        }

        protected void DropDownList1_SelectedIndexChanged(object sender, EventArgs e)
        {
            Session["categoryId"] = DropDownList1.SelectedValue;
        }

        protected void lnkCategory_Click(object sender, EventArgs e)
        {
            var button = (LinkButton)sender;
            String selectedItem = button.CommandArgument;

            List<CartItem> cartItems = Session["cartItem"] as List<CartItem>;
            if (cartItems == null)
            {
                cartItems = new List<CartItem>();
            }

            // Check if the item already exists in the cart
            CartItem existingItem = cartItems.FirstOrDefault(item => item.ItemId == selectedItem);

            if (existingItem != null)
            {
                // Item already exists, increase the quantity
                existingItem.Quantity += 1;
            }
            else
            {
                // Item does not exist, add new item to the cart
                cartItems.Add(new CartItem(selectedItem));
            }

            // Save the updated cart items list back to the session
            Session["cartItem"] = cartItems;

            Response.Redirect("Cart");
        }
    }
}
