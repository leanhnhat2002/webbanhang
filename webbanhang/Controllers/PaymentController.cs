using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using webbanhang.Context;
using webbanhang.Models;

namespace webbanhang.Controllers
{
    public class PaymentController : Controller
    {
        websiteBHEntities obj = new websiteBHEntities();
        

        // GET: Paymen
        public ActionResult Index()
        {
            return View();
        }
            
        

    }
}