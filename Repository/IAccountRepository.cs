using Accounting_Module.Models;

namespace Accounting_Module.Repository
{
    public interface IAccountRepository
    {
        public List<AccAccount> Get_AccountList();
    }
}
