using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace StyleSavvy_FinalProject.Models
{
    public class OrderInfo
    {
        public string FullName { get; set; }
        public string Email { get; set; }
        public string Address { get; set; }
        public string City { get; set; }
        public string State { get; set; }
        public string Zip { get; set; }
        public string CreditCard { get; set; }
        public string ExpirationDate { get; set; }
        public string CVV { get; set; }
    }
}