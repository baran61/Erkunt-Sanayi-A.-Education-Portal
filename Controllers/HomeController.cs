using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace Website.Controllers
{
    [Authorize]
    public class HomeController : Controller
    {
        [AllowAnonymous]
        public ActionResult Index()
        {
            return View();
        }
        
        public ActionResult Contact()
        { 
            return View();

        }

        public ActionResult Dersler()
        {
            return View();
        }

    }
}