//using Microsoft.Ajax.Utilities;
//using Microsoft.AspNetCore.Mvc;
//using Model.Entities;
//using Model.ViewModel;
//using Model.ViewModel.Accounting;
//using MoreLinq;
//using Service;
//using Service.Accounting;
//using System;
//using System.Collections.Generic;
//using System.ComponentModel.DataAnnotations;
//using System.ComponentModel.DataAnnotations.Schema;
//using System.Data;
//using System.Data.SqlClient;
//using System.Linq;
//using System.Security.Principal;
//using System.Web;
//using static System.Collections.Specialized.BitVector32;

//namespace KWT_HMSERP.Controllers
//{
//    public class AccountsController : Controller
//    {
//        string connectionString = "Data Source=192.168.5.2;Initial Catalog=KWMC_ERP;Persist Security Info=True;User ID=sa;Password=kwt#$2021;";

//        #region Private Property & View Pages
//        KWMC_ERPEntities dba = new KWMC_ERPEntities();
//        KWMC_AccountsEntities db = new KWMC_AccountsEntities();
//        KWMC_ERPEntities db1 = new KWMC_ERPEntities();
//        AccountService account = new AccountService();
//        Utility util = new Utility();

//        // GET: Accounts
//        public ActionResult AccountList()
//        {
//            if (Utility.strSessionUserID == 0)
//            {
//                return RedirectToAction("Login", "Security");
//            }
//            else
//            {
//                ViewBag.LoggedUser = Utility.strSessionUserName;
//                ViewBag.LoggedRole = Utility.strSessionRoleName;
//                ViewBag.AccountID = new SelectList(account.Get_AccountList().Where(x => x.IsParent == "Y" || x.IsMaster == "Y").ToList(), "AccountID", "AccountName");
//                var datalist = account.Get_AccountList().Where(x => x.Status == "Y").ToList();
//                Utility.activeMenu = "61";
//                return View(datalist);
//            }
//        }
//        public ActionResult VoucherEntry()
//        {
//            if (util.UserID == 0)
//            {
//                return RedirectToAction("Login", "Security");
//            }
//            else
//            {
//                var data = account.Get_AccountList().Where(x => x.IsParent == "N").ToList();

//                for (int i = 0; i < data.Count; i++)
//                {
//                    data[i].AccountName = data[i].AccountCode.ToString() + " - " + data[i].AccountName;
//                }

//                var accList = data;

//                ViewBag.LoggedUser = Utility.strSessionUserName;
//                ViewBag.LoggedRole = Utility.strSessionRoleName;

//                ViewBag.VoucherTypeID = new SelectList(db.ACC_VoucherType.ToList(), "VoucherTypeName", "VoucherTypeName");
//                ViewBag.AccountID = new SelectList(accList, "AccountID", "AccountName");
//                ViewBag.BankID = new SelectList(accList.Where(x => x.ParentID == 68).ToList(), "AccountID", "AccountName"); // CASH AT BANK
//                ViewBag.CostCenterID = new SelectList(db.ACC_CostCenter.Where(x => x.CostCenterID == 1 && x.CompanyID == util.CompanyID).ToList(), "CostCenterID", "CostCenterName");
//                Utility.activeMenu = "61";
//                return View();
//            }
//        }
//        public ActionResult VoucherList()
//        {
//            ViewBag.LoggedUser = Utility.strSessionUserName;
//            ViewBag.LoggedRole = Utility.strSessionRoleName;
//            ViewBag.ModuleID = new SelectList(db1.Tbl_Module.Where(x => x.Status == "Y").ToList(), "ModuleName", "ModuleName");
//            Utility.activeMenu = "61";
//            return View();
//        }
//        public ActionResult COAList()
//        {
//            if (util.UserID == 0)
//            {
//                return RedirectToAction("Login", "Security");
//            }
//            else
//            {
//                ViewBag.LoggedUser = Utility.strSessionUserName;
//                ViewBag.LoggedRole = Utility.strSessionRoleName;

//                ViewBag.AccountID = new SelectList(account.Get_AccountList().Where(x => x.IsParent == "Y" || x.IsMaster == "Y").ToList(), "AccountID", "AccountName");
//                var datalist = account.Get_AccountList().ToList(); //db.ACC_Account.Where(x => x.Status == "Y" && x.CompanyID == util.CompanyID).ToList();
//                Utility.activeMenu = "61";
//                return View(datalist);
//            }
//        }
//        public ActionResult Reports()
//        {
//            if (util.UserID == 0)
//            {
//                return RedirectToAction("Login", "Security");
//            }
//            else
//            {
//                var data = account.Get_UsableAccountList();
//                for (int i = 0; i < data.Count; i++)
//                {
//                    data[i].AccountName = data[i].AccountCode.ToString() + " - " + data[i].AccountName;
//                }

//                ViewBag.LoggedUser = Utility.strSessionUserName;
//                ViewBag.LoggedRole = Utility.strSessionRoleName;
//                ViewBag.AccountID = new SelectList(data, "AccountID", "AccountName"); // ALL CHILD ACCOUNTS
//                Utility.activeMenu = "61";
//                return View();
//            }
//        }
//        #endregion

//        #region Accounts CRUD
//        public JsonResult GetAccountList(string groupID)
//        {
//            var result = account.Get_AccountList();

//            if (groupID != "")
//            {
//                int grpID = Convert.ToInt32(groupID);

//                result = result.Where(x => x.ParentID == grpID).ToList();

//            }

//            return Json(new { data = result }, JsonRequestBehavior.AllowGet);
//        }
//        public JsonResult GetParentAccountList()
//        {
//            var result = account.Get_AccountList().Where(x => x.IsParent == "Y").ToList();
//            return Json(result, JsonRequestBehavior.AllowGet);
//        }
//        public JsonResult CreateAccount(ACC_Account entity)
//        {
//            var existsCode = account.CheckCodeExist(entity.AccountCode ?? 0);
//            if (existsCode == true)
//            {
//                return Json("Code Exist", JsonRequestBehavior.AllowGet);
//            }
//            bool result = account.Save_Account(entity);
//            return Json(result, JsonRequestBehavior.AllowGet);
//        }
//        public JsonResult UpdateAccount(ACC_Account entity)
//        {
//            bool result = account.Update_Account(entity);
//            return Json(result, JsonRequestBehavior.AllowGet);
//        }
//        public JsonResult DeleteAccount(int accNo)
//        {
//            bool result = account.DeleteAccount(accNo);
//            return Json(result, JsonRequestBehavior.AllowGet);
//        }
//        public JsonResult SetAccountCode(int parentID)
//        {
//            string result = account.GenerateAccountCode(parentID);
//            return Json(result, JsonRequestBehavior.AllowGet);
//        }
//        public JsonResult GetAccountByNo(int accNo)
//        {
//            var data = account.GetAccountByID(accNo); //db.ACC_Account.Where(x => x.AccountID == accNo).FirstOrDefault();
//            return Json(data, JsonRequestBehavior.AllowGet);
//        }
//        #endregion

//        #region Common CRUD
//        public JsonResult GetAccountListByGroupID(int groupID)
//        {
//            var data = account.Get_UsableAccountList();
//            //var data = db.ACC_Account.Where(x => x.Status == "Y").ToList();
//            return Json(data, JsonRequestBehavior.AllowGet);
//        }
//        public JsonResult GetDebitList()
//        {
//            var data = account.GetAccountList().Where(x => x.Status == "Y").ToList();
//            return Json(data, JsonRequestBehavior.AllowGet);
//        }
//        public JsonResult GetCreditList()
//        {
//            var data = account.GetAccountList().Where(x => x.Status == "Y").ToList();
//            return Json(data, JsonRequestBehavior.AllowGet);
//        }
//        public JsonResult GetTransactionList(DateTime startDate, DateTime endDate, string trxnType)
//        {
//            var _startDate = new SqlParameter("@StartDate", startDate);
//            var _endDate = new SqlParameter("@EndDate", endDate);
//            var _trxnType = new SqlParameter("@TrxnType", trxnType);


//            string SP_SQL = "ACC_GetTransactionList @StartDate, @EndDate, @TrxnType";
//            var trxnList = (db.Database.SqlQuery<VM_Transaction>(SP_SQL, _startDate, _endDate, _trxnType)).ToList();

//            for (int i = 0; i < trxnList.Count; i++)
//            {
//                if (trxnList[i].Narration == null)
//                {
//                    trxnList[i].Narration = "";
//                }
//            }

//            return Json(trxnList, JsonRequestBehavior.AllowGet);
//        }
//        public JsonResult GetAllTransactionList(DateTime startDate, DateTime endDate)
//        {
//            var _startDate = new SqlParameter("@StartDate", startDate);
//            var _endDate = new SqlParameter("@EndDate", endDate);


//            string SP_SQL = "ACC_GetAllTransactionList @StartDate, @EndDate";
//            var trxnList = (db.Database.SqlQuery<VM_Transaction>(SP_SQL, _startDate, _endDate)).ToList();

//            for (int i = 0; i < trxnList.Count; i++)
//            {
//                if (trxnList[i].Narration == null)
//                {
//                    trxnList[i].Narration = "";
//                }
//            }

//            return Json(trxnList, JsonRequestBehavior.AllowGet);
//        }
//        public JsonResult GetLedgerData(DateTime startDate, DateTime endDate, string accCode)
//        {
//            var _startDate = new SqlParameter("@StartDate", startDate);
//            var _endDate = new SqlParameter("@EndDate", endDate);
//            var _accCode = new SqlParameter("@AccountCode", accCode);

//            string SP_SQL = "ACC_GetLedgerReportByAccID @StartDate, @EndDate, @AccountCode";
//            var trxnList = (db.Database.SqlQuery<VM_Ledger>(SP_SQL, _startDate, _endDate, _accCode)).ToList();

//            //for (int i = 0; i < trxnList.Count; i++)
//            //{
//            //    if (trxnList[i].Narration == null)
//            //    {
//            //        trxnList[i].Narration = "";
//            //    }
//            //}

//            return Json(trxnList, JsonRequestBehavior.AllowGet);
//        }
//        public JsonResult GetAccountNameByID(int accID)
//        {
//            var data = account.GetAccountByID(accID);
//            return Json(data.AccountName, JsonRequestBehavior.AllowGet);
//        }
//        public JsonResult GetAccountNameByCode(long accCode)
//        {
//            var data = account.Get_UsableAccountList().Where(x => x.AccountCode == accCode).FirstOrDefault();
//            return Json(data, JsonRequestBehavior.AllowGet);
//        }
//        #endregion

//        #region New CRUD
//        public JsonResult GetAccountLocation(long accountID)
//        {
//            long accID = Convert.ToInt64(accountID);
//            var _tableName = new SqlParameter("@AccTableName", "ACC_Account");
//            var _accID = new SqlParameter("@AccountID", accID);

//            string SP_SQL = "ACC_GET_AccountLocation @AccTableName, @AccountID";
//            var accInfo = (db.Database.SqlQuery<VM_Accounts>(SP_SQL, _tableName, _accID)).FirstOrDefault();

//            string location = "<span class='badge badge-primary ml-auto'>" + accInfo.Child4Name + "</span><br/>";
//            if (accInfo.Child4Name == null)
//            {
//                //accInfo.AccountID
//                location = "";
//            }
//            if (accInfo.Child3Name == null)
//            {
//                location = "";
//            }
//            else
//            {
//                if (location != "")
//                {
//                    location += "&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class='badge badge-warning ml-auto'>" + accInfo.Child3Name + "</span><br/>";
//                }
//                else
//                {
//                    location += "&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class='badge badge-warning ml-auto'>" + accInfo.Child3Name + "</span><br/>";
//                }
//            }
//            if (accInfo.Child2Name != "")
//            {
//                if (location != "")
//                { location += "&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class='badge badge-success ml-auto'>" + accInfo.Child2Name + "</span><br/>"; }
//                else { location += "&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class='badge badge-success ml-auto'>" + accInfo.Child2Name + "</span><br/>"; }
//            }
//            if (accInfo.Child1Name != "")
//            {
//                if (location != "")
//                { location += "&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class='badge badge-primary ml-auto'>" + accInfo.Child1Name + "</span><br/>"; }
//                else { location += "&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class='badge badge-primary ml-auto'>" + accInfo.Child1Name + "</span><br/>"; }
//            }

//            return Json(location, JsonRequestBehavior.AllowGet);
//        }
//        public JsonResult GetAccountCodeByID(int accID)
//        {
//            var data = account.Get_UsableAccountList().Where(x => x.AccountID == accID).FirstOrDefault();
//            return Json(data.AccountCode, JsonRequestBehavior.AllowGet);
//        }
//        public JsonResult AddTempVoucher(ACC_TempVoucher entity, string type)
//        {
//            if (type == "settle")
//            {
//                //decimal debit = 0, credit = 0;
//                var debit = db.ACC_TempVoucher.Where(t => t.CreateUserID == util.UserID).Sum(i => i.Debit);
//                var credit = db.ACC_TempVoucher.Where(t => t.CreateUserID == util.UserID).Sum(i => i.Credit);

//                if ((debit == 0 || debit == null) && (credit == 0 || credit == null))
//                {
//                    return Json("No data found.", JsonRequestBehavior.AllowGet);
//                }

//                if (debit > credit)
//                {
//                    entity.Debit = 0;
//                    entity.Credit = debit;
//                }
//                else if (credit > debit)
//                {
//                    entity.Debit = credit;
//                    entity.Credit = 0;
//                }
//            }

//            var result = account.AddTempVoucher(entity);
//            return Json(result, JsonRequestBehavior.AllowGet);
//        }
//        public JsonResult GetTempVoucher()
//        {
//            var data = account.GetTempVoucherList().OrderByDescending(x => x.DebitAmount).ToList();
//            return Json(data, JsonRequestBehavior.AllowGet);
//        }
//        public JsonResult TrashTempVoucher()
//        {
//            var data = db.ACC_TempVoucher.Where(x => x.CreateUserID == util.UserID).ToList();
//            db.ACC_TempVoucher.RemoveRange(data);

//            try
//            {
//                db.SaveChanges();
//                return Json(true, JsonRequestBehavior.AllowGet);
//            }
//            catch
//            {
//                return Json(false, JsonRequestBehavior.AllowGet);
//            }
//        }
//        public JsonResult TrashTempVoucherByID(int id)
//        {
//            var data = db.ACC_TempVoucher.Where(x => x.TempID == id).FirstOrDefault();
//            db.ACC_TempVoucher.Remove(data);

//            try
//            {
//                db.SaveChanges();
//                return Json(true, JsonRequestBehavior.AllowGet);
//            }
//            catch
//            {
//                return Json(false, JsonRequestBehavior.AllowGet);
//            }
//        }
//        public JsonResult SaveVoucher(ACC_Voucher entity)
//        {
//            var user = db1.Tbl_User.Where(x => x.UserNo == util.UserID).FirstOrDefault();
//            entity.PostedFrom = "Accounts";
//            entity.Module = "Accounts"; // + user.UserFullName;
//            var result = account.Create_Voucher(entity);
//            return Json(result, JsonRequestBehavior.AllowGet);
//        }
//        public JsonResult GetBankAccountList()
//        {
//            var data = account.Get_AccountList().Where(a => a.ParentID == 68 || a.AccountID == 67 && a.Status == "Y").ToList();

//            for (int i = 0; i < data.Count; i++)
//            {
//                data[i].AccountName = data[i].AccountCode.ToString() + " - " + data[i].AccountName;
//            }

//            return Json(data, JsonRequestBehavior.AllowGet);
//        }
//        public JsonResult GetIncomeAccountList()
//        {
//            var data = account.Get_AccountList().Where(a => (a.AccountCode.ToString().Substring(0, 1) == "4" || a.AccountCode.ToString().Substring(0, 1) == "5") && a.IsParent == "N" && a.Status == "Y").ToList();

//            for (int i = 0; i < data.Count; i++)
//            {
//                data[i].AccountName = data[i].AccountCode.ToString() + " - " + data[i].AccountName;
//            }

//            return Json(data, JsonRequestBehavior.AllowGet);
//        }
//        public JsonResult GetExpenseAccountList()
//        {
//            var data = account.Get_AccountList().Where(a => (a.AccountCode.ToString().Substring(0, 1) == "4" || a.AccountCode.ToString().Substring(0, 1) == "5") && a.IsParent == "N" && a.Status == "Y").ToList();

//            for (int i = 0; i < data.Count; i++)
//            {
//                data[i].AccountName = data[i].AccountCode.ToString() + " - " + data[i].AccountName;
//            }

//            return Json(data, JsonRequestBehavior.AllowGet);
//        }
//        public JsonResult GetCashAccountList()
//        {
//            var data = account.Get_AccountList().Where(a => a.AccountName.ToString().Contains("Cash In Hand") && a.Status == "Y").ToList();

//            for (int i = 0; i < data.Count; i++)
//            {
//                data[i].AccountName = data[i].AccountCode.ToString() + " - " + data[i].AccountName;
//            }

//            return Json(data, JsonRequestBehavior.AllowGet);
//        }
//        public JsonResult GetAllAccountList()
//        {
//            var data = account.Get_AccountList().ToList();

//            for (int i = 0; i < data.Count; i++)
//            {
//                data[i].AccountName = data[i].AccountCode.ToString() + " - " + data[i].AccountName;
//            }

//            return Json(data, JsonRequestBehavior.AllowGet);
//        }
//        public JsonResult GetControlAccountList()
//        {
//            var data = account.Get_AccountList().Where(x => x.IsParent == "Y").ToList();

//            for (int i = 0; i < data.Count; i++)
//            {
//                data[i].AccountName = data[i].AccountCode.ToString() + " - " + data[i].AccountName;
//            }

//            return Json(data, JsonRequestBehavior.AllowGet);
//        }
//        public JsonResult GetAllVoucherList(string voucherStatus, DateTime startDate, DateTime endDate, string module)
//        {
//            var data = account.GetAllVoucherList(startDate, endDate).ToList();

//            if (module != "")
//            {
//                data = data.Where(x => x.Module == module).ToList();
//            }

//            if (voucherStatus == "P")
//            {
//                data = data.ToList().Where(x => x.Status == "P").ToList();
//            }
//            else if (voucherStatus == "Y")
//            {
//                data = data.Where(x => x.Status == "Y").ToList();
//            }
//            else if (voucherStatus == "D")
//            {
//                data = data.Where(x => x.Status == "D").ToList();
//            }

//            for (int i = 0; i < data.Count; i++)
//            {
//                if (data[i].Status == "P")
//                {
//                    data[i].Status = "<span class='badge badge-warning'>P</span>";
//                }
//                else if (data[i].Status == "D")
//                {
//                    data[i].Status = "<span class='badge badge-danger'>D</span>";
//                }
//                else if (data[i].Status == "A")
//                {
//                    data[i].Status = "<span class='badge badge-success'>A</span>";
//                }
//            }

//            return Json(data, JsonRequestBehavior.AllowGet);
//        }
//        public JsonResult GetAllVoucherDetailByID(long voucherAutoID)
//        {
//            //var voucher = account.GetAllVoucherList().Where(x => x.VoucherAutoID == voucherAutoID).FirstOrDefault();

//            string voucherNumber = account.GetVoucherNumberByID(voucherAutoID);
//            var voucherData = account.GetVoucherByNumber(voucherNumber);

//            return Json(voucherData, JsonRequestBehavior.AllowGet);
//        }
//        //public JsonResult GetAllVoucherDetailByNumber(string voucherNumber)
//        //{
//        //    var voucherData = account.GetVoucherByNumber(voucherNumber);
//        //    voucherData = voucherData.DistinctBy(x => x.VoucherNumber).ToList();
//        //    return Json(voucherData, JsonRequestBehavior.AllowGet);
//        //}
//        public JsonResult ModifyVoucherStatus(string voucherNumber, string status)
//        {
//            try
//            {
//                bool result = account.ModifyVoucherStatus(voucherNumber, status);
//                return Json(result, JsonRequestBehavior.AllowGet);
//            }
//            catch (Exception ex)
//            {
//                return Json(false, JsonRequestBehavior.AllowGet);
//            }
//        }
//        public JsonResult UpdateVoucher(List<ACC_Voucher> dedList)
//        {
//            try
//            {
//                decimal tDr = 0, tCr = 0;

//                for (int i = 0; i < dedList.Count; i++)
//                {
//                    tDr += dedList[i].DebitAmount ?? 00;
//                    tCr += dedList[i].CreditAmount ?? 00;
//                }

//                if (tDr != tCr)
//                {
//                    return Json("Mismatch", JsonRequestBehavior.AllowGet);
//                }

//                for (int i = 0; i < dedList.Count; i++)
//                {
//                    //long autoID = dedList[i].VoucherAutoID;
//                    //var exitsData = db.ACC_Voucher.Where(x => x.VoucherAutoID == autoID).FirstOrDefault();

//                    ACC_Voucher exitsData = new ACC_Voucher();
//                    exitsData.VoucherAutoID = dedList[i].VoucherAutoID;
//                    exitsData.AccountID = dedList[i].AccountID;
//                    exitsData.ChequeNo = dedList[i].ChequeNo;
//                    exitsData.ChequeDate = dedList[i].ChequeDate;
//                    exitsData.Description = dedList[i].Description;
//                    exitsData.DebitAmount = dedList[i].DebitAmount;
//                    exitsData.CreditAmount = dedList[i].CreditAmount;

//                    account.UpdateVoucher(exitsData);
//                }

//                return Json(true, JsonRequestBehavior.AllowGet);
//            }
//            catch
//            {
//                return Json(false, JsonRequestBehavior.AllowGet);
//            }
//        }
//        public JsonResult DeleteVoucherByNumber(string voucherNumber)
//        {
//            var data = account.GetVoucherByNumber(voucherNumber);

//            if (data[0].Module == "Inventory")
//            {
//                string pmID = data[0].RefNo;
//                return Json("Data is in use!", JsonRequestBehavior.AllowGet);
//            }
//            else
//            {
//                account.DeleteVoucher(voucherNumber);

//                try
//                {
//                    db.SaveChanges();
//                    return Json(true, JsonRequestBehavior.AllowGet);
//                }
//                catch (Exception ex)
//                {
//                    return Json(false, JsonRequestBehavior.AllowGet);
//                }
//            }
//        }
//        #endregion

//        #region Money Receipt
//        public ActionResult Money_Receipt()
//        {

//            if (util.UserID == 0)
//            {
//                return RedirectToAction("Login", "Security");
//            }
//            else
//            {
//                var data = account.Get_UsableAccountList();
//                for (int i = 0; i < data.Count; i++)
//                {
//                    data[i].AccountName = data[i].AccountCode.ToString() + " - " + data[i].AccountName;
//                }

//                ViewBag.LoggedUser = Utility.strSessionUserName;
//                ViewBag.LoggedRole = Utility.strSessionRoleName;
//                ViewBag.AccountID = new SelectList(data, "AccountID", "AccountName"); // ALL CHILD ACCOUNTS
//                Utility.activeMenu = "61";
//                // Fetch students from Tbl_Students and format their names
//                var students = dba.Tbl_Students.Select(s => new
//                {
//                    ID = s.StudentID.ToString(),
//                    Name = s.StudentName,
//                    Roll = s.RollNo
//                }).ToList();

//                var selectListItems = students.Select(x => new
//                {
//                    Value = x.ID,
//                    Text = $"{x.Roll}-{x.Name}({x.ID})"
//                }).ToList();

//                // Prepare ViewBag for dropdown lists
//                ViewBag.StudentID = new SelectList(selectListItems, "Value", "Text");
//                ViewBag.SessionID = new SelectList(
//                    dba.Tbl_AcaSession
//                        .Where(session => session.SessionID >= 16 && session.SessionID <= 24)
//                        .OrderByDescending(session => session.SessionID)
//                        .ToList(),
//                    "SessionID",
//                    "SessionTitle"
//                );

//                ViewBag.CourseID = new SelectList(dba.Tbl_AcaCourses.Where(x => x.CourseID == 1).OrderBy(x => x.CourseID).ToList(), "CourseID", "CourseTitle");
//                ViewBag.YearID = new SelectList(dba.Tbl_AcaYear.Where(x => x.YearID != 7 || x.YearID != 9 || x.YearID != 10 || x.YearID != 11 || x.YearID != 12).OrderBy(x => x.YearID).ToList(), "YearID", "YearTitle");

//                return View();
//            }

//        }

//        [HttpPost]
//        public JsonResult GetStudent(int courseID, string YearId)
//        {
//            var maxSessionId = dba.Tbl_Students
//    .Where(x => x.CourseID == courseID && x.CurrentYear == YearId)
//    .Max(student => student.SessionID);
//            var subjects = (from student in dba.Tbl_Students
//                            where student.CourseID == courseID
//                                  && student.CurrentYear == YearId

//                            select new
//                            {
//                                student.RollNo,
//                                student.StudentID,
//                                StudentName = student.SessionID == maxSessionId ? student.StudentName : student.StudentName + " .D",
//                                student.SessionID
//                            })
//       .OrderByDescending(x => x.SessionID)
//       .ThenBy(x => x.RollNo)
//       .ToList();

//            return Json(subjects, JsonRequestBehavior.AllowGet);
//        }

//        [HttpPost]
//        public JsonResult GetPreviousDue(string studentid, string item, string from, string to)
//        {
//            var froma = Convert.ToDateTime(from);
//            var Toa = Convert.ToDateTime(to);
//            int studentIdInt = int.Parse(studentid); // Convert student ID to an integer if needed

//            var previousdue = dba.Tbl_StudentPaySlip
//    .Where(x => x.StudentID == studentIdInt
//                && x.Description == item
//                && x.DateFrom == froma
//                && x.DateTo == Toa)
//    .OrderByDescending(x => x.Createddate) // Order by TotalDue ascending
//    .Select(x => x.TotalDue)  // Select the TotalDue value
//    .FirstOrDefault() ?? 0;   // Default to 0 if null
//                              // Get the first value or default

//            return Json(previousdue, JsonRequestBehavior.AllowGet);

//        }
//        // POST: Accounts/SaveMoneyReceipt
//        [HttpPost]
//        public JsonResult SaveMoneyReceipt(List<MoneyReceiptViewModel> data)
//        {
//            var receiptNumbers = "aa";
//            try
//            {
//                // Validate the input data
//                if (data == null || data.Count == 0)
//                {
//                    return Json(new { success = false, message = "No data received." });
//                }


//                foreach (var receipt in data)
//                {
//                    // Find the existing pay slip for the student
//                    var existingPaySlip = dba.Tbl_StudentPaySlip
//                                            .FirstOrDefault(x => x.StudentID == receipt.StudentID
//                                                              && x.Year == receipt.Year
//                                                              && x.Description == receipt.Description);

//                    if (existingPaySlip != null)
//                    {
//                        // Update existing pay slip
//                        existingPaySlip.Paid += receipt.Paid;
//                        existingPaySlip.RemainingDue = existingPaySlip.TotalDue - existingPaySlip.Paid;
//                    }

//                    // Generate a unique MoneyReceiptNo
//                    var moneyReceiptNo = GenerateMoneyReceiptNo(receipt.StudentID)?.ToString();
//                    receiptNumbers = moneyReceiptNo;

//                    // Create a new receipt for tracking
//                    var moneyReceipt = new Tbl_StudentPaySlip
//                    {
//                        StudentName = receipt.StudentName,
//                        StudentID = receipt.StudentID,
//                        SessionName = receipt.SessionName,
//                        CourseName = receipt.CourseName,
//                        RollNo = receipt.RollNo,
//                        Description = receipt.Description,
//                        Year = receipt.Year,
//                        Amount = receipt.Amount,
//                        Payday = DateTime.Now,
//                        Createddate = DateTime.Now,
//                        createdby = Convert.ToString(Utility.strSessionUserID),
//                        regular = receipt.regular,
//                        subject = receipt.subject,
//                        supply = receipt.supply,
//                        Paid = receipt.Paid,
//                        TotalDue = receipt.TotalDue,
//                        RemainingDue = existingPaySlip != null
//                            ? existingPaySlip.RemainingDue
//                            : receipt.TotalDue - receipt.Paid,
//                        DateFrom = receipt.DateFrom,
//                        DateTo = receipt.DateTo,
//                        MoneyReceiptNo = moneyReceiptNo,
//                    };

//                    dba.Tbl_StudentPaySlip.Add(moneyReceipt);
//                }

//                // Commit all changes in one transaction
//                dba.SaveChanges();

//                // Return success and the list of receipt numbers
//                return Json(new { success = true, message = "Data saved successfully.", moneyReceiptNumbers = receiptNumbers });
//            }
//            catch (Exception ex)
//            {
//                // Log the exception (optional)
//                return Json(new { success = false, message = "An error occurred while saving the data.", error = ex.Message });
//            }
//        }



//        private string GenerateMoneyReceiptNo(int? studentID)
//        {
//            // Fetch the course initial
//            var courseInitial = (from student in dba.Tbl_Students
//                                 join course in dba.Tbl_AcaCourses
//                                 on student.CourseID equals course.CourseID
//                                 where student.StudentID == studentID
//                                 select course.CourseTitle.Substring(0, 1))
//                                 .FirstOrDefault();

//            if (string.IsNullOrEmpty(courseInitial))
//            {
//                throw new Exception("CourseInitial could not be generated.");
//            }

//            // Extract part of the student ID
//            var studentIdPart = studentID?.ToString().PadLeft(9, '0').Substring(4, 5); // Ensure at least 9 digits
//            if (string.IsNullOrEmpty(studentIdPart))
//            {
//                throw new Exception("Student ID part could not be generated.");
//            }

//            // Get today's date in YYYYMMDD format
//            string datePart = DateTime.Now.ToString("yyyyMMdd");

//            // Generate a sequential number for today
//            var createdDate = DateTime.Now.Date;

//            // Use a transaction to prevent race conditions
//            using (var transaction = dba.Database.BeginTransaction())
//            {
//                try
//                {
//                    // Fetch the current day's highest number
//                    var maxSequence = dba.Tbl_StudentPaySlip
//                        .Where(slip => DbFunctions.TruncateTime(slip.Createddate) == createdDate)
//                        .OrderByDescending(slip => slip.MoneyReceiptNo)
//                        .Select(slip => slip.MoneyReceiptNo.Substring(courseInitial.Length + datePart.Length + studentIdPart.Length)) // Extract the sequence part
//                        .Cast<int?>()
//                        .FirstOrDefault() ?? 0;

//                    int newSequence = maxSequence + 1;

//                    // Construct the MoneyReceiptNo
//                    string moneyReceiptNo = $"{courseInitial}{datePart}{studentIdPart}{newSequence:D4}"; // Pad sequence to ensure 4 digits

//                    transaction.Commit(); // Ensure the changes are committed
//                    return moneyReceiptNo;
//                }
//                catch
//                {
//                    transaction.Rollback(); // Rollback on failure
//                    throw; // Re-throw the exception
//                }
//            }
//        }

//        // GET: /Accounts/GetData
//        public JsonResult GetData()
//        {
//            var result = dba.Tbl_StudentPaySlip
//    .GroupBy(x => x.MoneyReceiptNo) // Replace MoneyReceiptNo with the property you want to make distinct
//    .Select(g => g.OrderByDescending(x => x.StudentPaySlipID).FirstOrDefault()) // Get the latest entry for each group
//    .OrderByDescending(x => x.StudentPaySlipID) // Final ordering
//    .ToList();

//            return Json(result, JsonRequestBehavior.AllowGet);
//        }

//        // Don't forget to dispose of the context
//        protected override void Dispose(bool disposing)
//        {
//            if (disposing)
//            {
//                dba.Dispose();
//            }
//            base.Dispose(disposing);
//        }

//        public ActionResult newslip()
//        {

//            if (util.UserID == 0)
//            {
//                return RedirectToAction("Login", "Security");
//            }
//            else
//            {
//                var data = account.Get_UsableAccountList();
//                for (int i = 0; i < data.Count; i++)
//                {
//                    data[i].AccountName = data[i].AccountCode.ToString() + " - " + data[i].AccountName;
//                }

//                ViewBag.LoggedUser = Utility.strSessionUserName;
//                ViewBag.LoggedRole = Utility.strSessionRoleName;
//                ViewBag.AccountID = new SelectList(data, "AccountID", "AccountName"); // ALL CHILD ACCOUNTS
//                Utility.activeMenu = "61";
//                // Fetch students from Tbl_Students and format their names
//                var students = dba.Tbl_Students.Select(s => new
//                {
//                    ID = s.StudentID.ToString(),
//                    Name = s.StudentName,
//                    Roll = s.RollNo
//                }).ToList();

//                var selectListItems = students.Select(x => new
//                {
//                    Value = x.ID,
//                    Text = $"{x.Roll}-{x.Name}({x.ID})"
//                }).ToList();

//                // Prepare ViewBag for dropdown lists
//                ViewBag.StudentID = new SelectList(selectListItems, "Value", "Text");
//                ViewBag.SessionID = new SelectList(
//                    dba.Tbl_AcaSession
//                        .Where(session => session.SessionID >= 16 && session.SessionID <= 24)
//                        .OrderByDescending(session => session.SessionID)
//                        .ToList(),
//                    "SessionID",
//                    "SessionTitle"
//                );

//                ViewBag.CourseID = new SelectList(dba.Tbl_AcaCourses.OrderBy(x => x.CourseID).ToList(), "CourseID", "CourseTitle");
//                ViewBag.YearID = new SelectList(dba.Tbl_AcaYear.Where(x => x.YearID != 7 || x.YearID != 9 || x.YearID != 10 || x.YearID != 11 || x.YearID != 12).OrderBy(x => x.YearID).ToList(), "YearID", "YearTitle");

//                return View();
//            }

//        }

//        public JsonResult GetDueTable(string StudentID)
//        {
//            // Create a DataTable to hold the results
//            DataTable dataTable = new DataTable();

//            // Call the stored procedure to get attendance summary
//            using (SqlConnection conn = new SqlConnection(connectionString))
//            {
//                using (SqlCommand cmd = new SqlCommand("GetStudentDueDetails", conn))
//                {
//                    cmd.CommandType = CommandType.StoredProcedure;
//                    cmd.Parameters.AddWithValue("@StudentID", StudentID);

//                    conn.Open();
//                    using (SqlDataAdapter adapter = new SqlDataAdapter(cmd))
//                    {
//                        adapter.Fill(dataTable); // Fill the DataTable with results
//                    }
//                }
//            }

//            // Convert DataTable to a JSON-friendly format
//            var result = dataTable.AsEnumerable().Select(row => new
//            {
//                Paid = row["Paid"]?.ToString(),
//                Amount = row["Amount"]?.ToString(),
//                MoneyReceiptNo = row["MoneyReceiptNo"]?.ToString(),
//                Particular = row["Description"]?.ToString(),
//                From = row["FROMDATE"]?.ToString(),
//                To = row["TODATE"]?.ToString(),
//                Due = row["TotalDue"]?.ToString()
//            }).ToList();

//            // Return the result as a JSON response
//            return Json(result, JsonRequestBehavior.AllowGet);
//        }

//        [HttpPost]
//        public JsonResult SaveMoneyReceiptfordue(List<MoneyReceiptViewModel> data)
//        {
//            try
//            {
//                // Validate the data
//                if (data == null || data.Count == 0)
//                {
//                    return Json(new { success = false, message = "No data received." });
//                }

//                List<string> processedReceipts = new List<string>(); // Track processed receipt numbers

//                foreach (var receipt in data)
//                {
//                    // Find the existing pay slip for the student (if it exists) to update the dues
//                    var existingPaySlip = dba.Tbl_StudentPaySlip
//                                            .Where(x => x.MoneyReceiptNo == receipt.MoneyReceiptNo)
//                                            .FirstOrDefault();

//                    // If the pay slip exists, update the paid amount and remaining due
//                    if (existingPaySlip != null)
//                    {

//                        // Insert a new record to track this payment
//                        var moneyReceipt = new Tbl_StudentPaySlip
//                        {
//                            StudentName = receipt.StudentName,
//                            StudentID = receipt.StudentID,
//                            SessionName = receipt.SessionName,
//                            CourseName = receipt.CourseName,
//                            RollNo = receipt.RollNo,
//                            Description = receipt.Description,
//                            Year = receipt.Year,
//                            Amount = receipt.Amount,
//                            Payday = DateTime.Now,
//                            Createddate = DateTime.Now,
//                            createdby = Convert.ToString(Utility.strSessionUserID),
//                            regular = receipt.regular,
//                            subject = receipt.subject,
//                            supply = receipt.supply,
//                            Paid = receipt.Paid,
//                            TotalDue = receipt.TotalDue ?? 0,
//                            DateFrom = receipt.DateFrom,
//                            DateTo = receipt.DateTo,
//                            MoneyReceiptNo = receipt.MoneyReceiptNo, // Generate unique receipt number
//                        };

//                        // Add the new record for this payment
//                        dba.Tbl_StudentPaySlip.Add(moneyReceipt);

//                        // Save changes
//                        dba.SaveChanges();

//                        // Track the processed receipt number
//                        processedReceipts.Add(receipt.MoneyReceiptNo);
//                    }
//                }

//                if (processedReceipts.Any())
//                {
//                    return Json(new { success = true, message = "Data updated successfully.", processedReceipts });
//                }

//                return Json(new { success = false, message = "No matching records found to update." });
//            }
//            catch (Exception ex)
//            {
//                // Log the error
//                Console.WriteLine($"Error saving money receipt: {ex.Message}");

//                // Return error response
//                return Json(new { success = false, message = "An error occurred while saving the data." });
//            }
//        }


//    }


//    public class MoneyReceiptViewModel
//    {
//        public int StudentPaySlipID { get; set; }
//        public string StudentName { get; set; }
//        public Nullable<int> StudentID { get; set; }
//        public string SessionName { get; set; }
//        public Nullable<int> PayerPhone { get; set; }
//        public string CourseName { get; set; }
//        public Nullable<int> RollNo { get; set; }
//        public string PaymentMode { get; set; }
//        public string BankName { get; set; }
//        public string Year { get; set; }
//        public string BankBranchName { get; set; }
//        public Nullable<System.DateTime> Payday { get; set; }
//        public Nullable<System.DateTime> Createddate { get; set; }
//        public string createdby { get; set; }
//        public string Description { get; set; }
//        public Nullable<System.DateTime> DateFrom { get; set; }
//        public Nullable<System.DateTime> DateTo { get; set; }
//        public string Remarks { get; set; }
//        public Nullable<int> Amount { get; set; }
//        public string MoneyReceiptNo { get; set; }
//        public Nullable<int> TotalDue { get; set; }
//        public Nullable<int> RemainingDue { get; set; }
//        public string regular { get; set; }
//        public Nullable<int> subject { get; set; }
//        public string supply { get; set; }
//        public int Paid { get; set; }
//    }
//    #endregion
//}

