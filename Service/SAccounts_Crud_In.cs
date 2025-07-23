using Accounting_Module.Interface;
using Accounting_Module.Models;
using Accounting_Module.Repository;
using Microsoft.AspNetCore.Mvc.ModelBinding.Validation;

namespace Accounting_Module.Service
{
    public class SAccounts_Crud_In(IAccount_Repository_In? repo) : IAccounts_Crud_In
    {
        public bool Insert_To_AccAccount(AccAccount Entity)
        {
            if (repo is null)
                throw new ArgumentNullException(nameof(Entity), "Somthing Went Wrong");

            bool Is_Submited = repo.Insert_Data_To_table("ACC_Account",Entity);
            return Is_Submited;
        }
    }
}
