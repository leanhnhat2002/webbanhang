using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using webbanhang.Context;

namespace webbanhang.Controllers
{
    public class HomeController : Controller
    {
        websiteBHEntities objwebsiteBHEntities = new websiteBHEntities();
        public ActionResult Index()
        {
            var listProduct = objwebsiteBHEntities.Products.ToList();
            return View();
        }

    }
}