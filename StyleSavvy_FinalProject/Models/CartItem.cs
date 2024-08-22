using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace StyleSavvy_FinalProject
{
    public class CartItem
    {
        public string ItemId { get; set; }
        public int Quantity { get; set; }

        public CartItem(string itemId)
        {
            ItemId = itemId;
            Quantity = 1;
        }
    }
}