using Accounting_Module.Interface;
using Accounting_Module.Models;
using Accounting_Module.Repository;

namespace Accounting_Module.Service
{
    public class SAccounts_Crud_Out(IAccount_Repository_Out repo) : IAccount_Crud_Out
    {
        public List<AccAccount> Get_Active_AccountList()
        {
            var Act_Accounts = repo.Get_AccountList().Where(x => x.Status == "Y").ToList();
            return Act_Accounts;
        }

        public List<Get_AccountList_VM> Get_Active_AccountList_ForDropDown()
        {
            var Act_Accounts = repo.Get_AccountList().Select(x => new Get_AccountList_VM
            {
                AccountID = x.AccountID,
                AccountName = x.AccountName,
                IsMaster = x.IsMaster,
                IsParent = x.IsParent
            }).Where(x => x.IsParent == "Y" || x.IsMaster == "Y").ToList();
            return Act_Accounts;
        }

        public string GetParentName(int accid)
        {
            return repo.Get_Active_Account_List().Where(x => x.AccountID == accid).Select(x => x.AccountName).FirstOrDefault() ?? "Something Went Wrong";
        }

        public string GetAccountCode(int parentID)
        {
            return repo.GenerateNewAccountCode(parentID);

        }

    }
}
