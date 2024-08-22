using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace StyleSavvy_FinalProject
{
    public partial class Cart : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["userName"] == null)
            {
                Response.Redirect("Login");
            }

            if (!IsPostBack && Session["cartItem"] != null)
            {
                // Retrieve the cart items list from the session
                List<CartItem> cartItems = Session["cartItem"] as List<CartItem>;

                // Add items to the ListBox
                foreach (CartItem item in cartItems)
                {
                    lstCart.Items.Add($"{item.ItemId} (Quantity: {item.Quantity})");
                }
            }
        }

        protected void btnEmpty_Click(object sender, EventArgs e)
        {
            if (lstCart.Items.Count == 0)
            {
                msg.Text = "There are no cart items.";
            }
            else
            {
                lstCart.Items.Clear();
                Session["cartItem"] = null;
                msg.Text = "All items have been removed from the cart.";
            }
        }

        protected void btnRemove_Click(object sender, EventArgs e)
        {
            msg.Text = "";
            if (lstCart.SelectedIndex != -1)
            {
                // Retrieve the cart items list from the session
                List<CartItem> cartItems = Session["cartItem"] as List<CartItem>;
                if (cartItems != null)
                {
                    // Find and remove the selected item
                    string selectedItemText = lstCart.SelectedItem.Text;
                    string selectedItemId = selectedItemText.Split(' ')[0];
                    CartItem itemToRemove = cartItems.FirstOrDefault(item => item.ItemId == selectedItemId);

                    if (itemToRemove != null)
                    {
                        cartItems.Remove(itemToRemove);
                        // Update the session
                        Session["cartItem"] = cartItems;
                    }
                }
                else
                {
                    Session["cartItem"] = null;
                }

                lstCart.Items.RemoveAt(lstCart.SelectedIndex);
                msg.Text = "Selected item has been removed.";
            }
            else
            {
                msg.Text = "Please select an item to remove.";
            }
        }

        protected void btnCheckout_Click(object sender, EventArgs e)
        {
            if (lstCart.Items.Count == 0)
            {
                msg.Text = "There are no cart items.";
            }
            else
            {
                Response.Redirect("Checkout");
            }
        }
    }
}
