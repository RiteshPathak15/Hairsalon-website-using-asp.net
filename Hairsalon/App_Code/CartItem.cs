﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
namespace Hairsalon
{
    public class CartItem
    {
        public int ProductID { get; set; }
        public string ProductName { get; set; }
        public decimal Price { get; set; }
        public int Quantity { get; set; }
        public decimal Total { get; set; }
    }
}
