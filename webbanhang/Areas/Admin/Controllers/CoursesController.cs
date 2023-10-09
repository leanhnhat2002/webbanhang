using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using webbanhang.Context;

namespace webbanhang.Areas.Admin.Controllers
{
    public class CoursesController : Controller
    {
        websiteBHEntities objwebsiteBHEntities = new websiteBHEntities();
        // GET: Admin/Courses
        public ActionResult Index()
        {
            var listCourse = objwebsiteBHEntities.Courses.ToList();
            return View(listCourse);
        }
        public ActionResult Create()
        {
            return View();
        }
        [HttpPost]
        public ActionResult Create(Course course)
        {
            objwebsiteBHEntities.Courses.Add(course);
            objwebsiteBHEntities.SaveChanges();
            return RedirectToAction("Index");
        }
        public ActionResult Delete(int id)
        {
            var course = objwebsiteBHEntities.Courses.FirstOrDefault(p => p.Id == id);
            objwebsiteBHEntities.Courses.Remove(course);
            objwebsiteBHEntities.SaveChanges();
            return RedirectToAction("Index");
        }
        public ActionResult Details(int id)
        {
            var course = objwebsiteBHEntities.Courses.FirstOrDefault(p => p.Id == id);
            return View(course);
        }
    }
}