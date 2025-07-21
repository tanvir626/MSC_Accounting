using Accounting_Module.Models;
using Dapper;
using Microsoft.Data.SqlClient;
using System.Data;
using static Microsoft.EntityFrameworkCore.DbLoggerCategory.Database;
namespace Accounting_Module.Repository
{
    public class AccountRepository(IConfiguration con):IAccountRepository
    {
        private readonly string? con = con.GetConnectionString("DapperString") ?? "Something Went Wrong";
       

        public List<AccAccount> Get_AccountList()
        {
            var AccountList = new List<AccAccount>();

            using (var con_obj = new SqlConnection(con))
            {
                try
                {
                    con_obj.Open();

                    var parameters = new DynamicParameters();
                    parameters.Add("@TableName", "ACC_Account" );

                    AccountList = [
                        ..con_obj.Query<AccAccount>(
                            "ACC_GetAccountList",
                            parameters,
                            commandType: CommandType.StoredProcedure
                        )
                    ];
                }
                catch (Exception ex)
                {
                    Console.WriteLine(ex.ToString());
                }
                finally 
                { 
                con_obj.Close();
                }
            }
            return AccountList;
        }
    }
}
