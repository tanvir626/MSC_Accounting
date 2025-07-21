using Accounting_Module.Interface;
using Accounting_Module.Models;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.Rendering;
using Microsoft.IdentityModel.Tokens;
using System.Diagnostics;

namespace Accounting_Module.Controllers
{
    public class HomeController(IAccountsInterface? Accounts) : Controller
    {
        public IActionResult AccountList()
        {
            ViewBag.AccountID = new SelectList(Accounts?.Get_Active_AccountList_ForDropDown().ToList(), "AccountID", "AccountName");
           var datalist = Accounts?.Get_Active_AccountList();
            return View(datalist);
        }


        [ResponseCache(Duration = 0, Location = ResponseCacheLocation.None, NoStore = true)]
        public IActionResult Error()
        {
            return View(new ErrorViewModel { RequestId = Activity.Current?.Id ?? HttpContext.TraceIdentifier });
        }
    }
}
