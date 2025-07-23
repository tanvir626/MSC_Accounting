using Accounting_Module.Models;

namespace Accounting_Module.Repository
{
    public interface IAccount_Repository_Out
    {
        public List<AccAccount> Get_AccountList();
        public List<AccAccount> Get_Active_Account_List();
        public string GenerateNewAccountCode(int parentID);
    }
}
