using Accounting_Module.Models;
using System.Text;

namespace Accounting_Module.Interface
{
    public interface IAccountsInterface
    {
        List<AccAccount> Get_Active_AccountList();
        List<Get_AccountList_VM> Get_Active_AccountList_ForDropDown();
       string GetParentName(int accid);
        string GetAccountCode(int parentID);
    }
}
