using Accounting_Module.Interface;
using Accounting_Module.Models;
using Accounting_Module.Repository;
using Microsoft.AspNetCore.DataProtection.Repositories;

namespace Accounting_Module.Service
{
    public class AccountService(IAccountRepository repo) : IAccountsInterface
    {
        public List<AccAccount> Get_Active_AccountList()
        {
            var Act_Accounts=repo.Get_AccountList().Where(x=>x.Status=="Y").ToList();
            return Act_Accounts;
        }

        public List<Get_AccountList_VM> Get_Active_AccountList_ForDropDown()
        {
            var Act_Accounts = repo.Get_AccountList().Select(x => new Get_AccountList_VM
            {
                AccountID = x.AccountId,
                AccountName = x.AccountName,
                IsMaster=x.IsMaster,
                IsParent=x.IsParent                
            }).Where(x => x.IsParent == "Y" || x.IsMaster == "Y").ToList();
            return Act_Accounts;
        }
    }
}
