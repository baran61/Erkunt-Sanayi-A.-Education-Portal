using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Web.Security;
using Website.Models;


namespace Website.Controllers
{
    public class AccountsController : Controller
    {
        Erkunt_DatabaseEntities2 entity = new Erkunt_DatabaseEntities2();

        public ActionResult Login()
        {
            return View();
        }

        public ActionResult Signup()
        {
            return View();
        }

        [HttpPost]
        public ActionResult Login(LoginViewModel credentials)
        {
            bool userExist = entity.user_account.Any(x => x.user_name == credentials.Username && x.password_salt == credentials.Password);
            user_account u = entity.user_account.FirstOrDefault(x => x.user_name == credentials.Username && x.password_salt == credentials.Password);

            if (userExist)
            {
                FormsAuthentication.SetAuthCookie(u.user_name, false);
                return RedirectToAction("Index", "Home");
            }

            ModelState.AddModelError("", "Username or Password is wrong");

            return View();
        }

        [HttpPost]
        public ActionResult Signup(user_account userinfo)
        {
            entity.user_account.Add(userinfo);
            entity.SaveChanges();
            return RedirectToAction("Login");

            
        }

        public ActionResult Signout()
        {
            FormsAuthentication.SignOut();
            return RedirectToAction("Login");
        }
    }
}