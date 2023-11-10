using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using webbanhang.Context;

namespace webbanhang.Controllers
{
    public class ProductController : Controller
    {
        websiteBHEntities obj = new websiteBHEntities();
        // GET: Product
        public ActionResult Detail(int Id)
        {
            var objProduct = obj.Products.Where(n => n.id == Id).FirstOrDefault();
            return View(objProduct);
        }

        
    }

   
}