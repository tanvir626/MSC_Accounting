using Accounting_Module.Interface;
using Accounting_Module.Models;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.Rendering;
using Microsoft.IdentityModel.Tokens;
using System.Diagnostics;
using System.Text;

namespace Accounting_Module.Controllers
{
    public class HomeController(IAccount_Crud_Out? Accounts_Out, IAccounts_Crud_In? Account_In) : Controller
    {
        #region Views
        public IActionResult AccountList()
        {
            ViewBag.AccountID = new SelectList(Accounts_Out?.Get_Active_AccountList_ForDropDown().ToList(), "AccountID", "AccountName");
           var datalist = Accounts_Out?.Get_Active_AccountList();
            return View(datalist);
        }

        #endregion

        #region Data
        public JsonResult GetParentName(int accID)
        {
            var ParentName = Accounts_Out?.GetParentName(accID);
            return Json(ParentName);
        }


        public JsonResult GetAccountCode(int parentID)
        {
            var NewAccountCode = Accounts_Out?.GetAccountCode(parentID);
            return Json(NewAccountCode);
        }


        [HttpPost]
        public JsonResult CreateAccount([FromBody] AccAccount entity)
        {          
            return Json(Account_In?.Insert_To_AccAccount(entity) ?? false);
        }

        #endregion


        [ResponseCache(Duration = 0, Location = ResponseCacheLocation.None, NoStore = true)]
        public IActionResult Error()
        {
            return View(new ErrorViewModel { RequestId = Activity.Current?.Id ?? HttpContext.TraceIdentifier });
        }
    }
}
