﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using webbanhang.Context;

namespace webbanhang.Areas.Admin.Controllers
{
    public class HomeController : Controller
    {
        // GET: Admin/Home
        websiteBHEntities obj = new websiteBHEntities();
        public ActionResult Index()
        {
            var lstProduct = obj.Products.ToList();
            return View(lstProduct);
        }
    }
}