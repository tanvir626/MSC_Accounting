using Accounting_Module.Interface;
using Accounting_Module.Models;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.Rendering;
using Microsoft.IdentityModel.Tokens;
using System.Diagnostics;
using System.Text;

namespace Accounting_Module.Controllers
{
    public class HomeController(IAccountsInterface? Accounts) : Controller
    {
        #region Views
        public IActionResult AccountList()
        {
            ViewBag.AccountID = new SelectList(Accounts?.Get_Active_AccountList_ForDropDown().ToList(), "AccountID", "AccountName");
           var datalist = Accounts?.Get_Active_AccountList();
            return View(datalist);
        }

        #endregion

        #region Data
        public JsonResult GetParentName(int accID)
        {
            var ParentName = Accounts?.GetParentName(accID);
            return Json(ParentName);
        }


        public JsonResult GetAccountCode(int parentID)
        {
            var NewAccountCode = Accounts?.GetAccountCode(parentID);
            return Json(NewAccountCode);
        }


        #endregion


        [ResponseCache(Duration = 0, Location = ResponseCacheLocation.None, NoStore = true)]
        public IActionResult Error()
        {
            return View(new ErrorViewModel { RequestId = Activity.Current?.Id ?? HttpContext.TraceIdentifier });
        }
    }
}
