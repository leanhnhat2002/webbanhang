using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using webbanhang.Context;
using webbanhang.Models;
namespace webbanhang.Controllers
{
    public class HomeController : Controller
    {
        websiteBHEntities1 obj = new websiteBHEntities1();
        public ActionResult Index()
        {
            // lấy danh mục
            var lstCategory = obj.Categories.ToList();
            //lấy sản phẩm
            var lstProduct = obj.Products.ToList();

            HomeModel objHome = new HomeModel();
            objHome.ListProducts = lstProduct;
            objHome.ListCategory = lstCategory;
            return View(objHome);
        }

    }
}