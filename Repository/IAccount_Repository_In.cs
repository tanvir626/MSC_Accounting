using Accounting_Module.Models;

namespace Accounting_Module.Repository
{
    public interface IAccount_Repository_In
    {
        bool Insert_Data_To_table<T>(string tableName, T entity);
    }
}
