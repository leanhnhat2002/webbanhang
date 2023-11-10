using System;
using System.Collections.Generic;
using System.Linq;
using System.Runtime.CompilerServices;
using System.Web;
using webbanhang.Context;

namespace webbanhang.Models
{
    public class CartModel
    {
        public Product Product { get; set; }
        public int Quantity { get; set; }
        public Double Total
        {
            get { return Quantity * Product.Price ?? 0; }
        }
    }
}