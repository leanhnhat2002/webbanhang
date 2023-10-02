using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using webbanhang.Context;

namespace webbanhang.Controllers
{
    public class CoursesController : Controller
    {
        // GET: Courses
        websiteBHEntities objwebsiteBHEntities = new websiteBHEntities();
        public ActionResult Index()
        {
            var listCourses = objwebsiteBHEntities.Courses.ToList();
            return View(listCourses);
        }
    }
}