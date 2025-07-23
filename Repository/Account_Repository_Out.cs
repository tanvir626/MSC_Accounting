using Accounting_Module.Models;
using Dapper;
using Microsoft.Data.SqlClient;
using System.Data;

namespace Accounting_Module.Repository
{
    public class Account_Repository_Out(IConfiguration con):IAccount_Repository_Out
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
                    parameters.Add("@TableName", "ACC_Account");

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

        public List<AccAccount> Get_Active_Account_List()
        {
            var AccountList = new List<AccAccount>();

            using (var con_obj = new SqlConnection(con))
            {
                try
                {
                    con_obj.Open();

                    var parameters = new DynamicParameters();
                    parameters.Add("@TableName", "ACC_Account");

                    AccountList = [
                        ..con_obj.Query<AccAccount>(
                            "ACC_GetAccountList",
                            parameters,
                            commandType: CommandType.StoredProcedure
                        )
                    ];

                    AccountList = AccountList.FindAll(x => x.Status == "Y");
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

        public string GenerateNewAccountCode(int parentID)
        {
            string? generatedCode = null;
            using (var con_obj = new SqlConnection(con))
            {
                try
                {
                    con_obj.Open();

                    var parameters = new DynamicParameters();
                    parameters.Add("@TableName", "ACC_Account");
                    parameters.Add("@ParentID", parentID.ToString()); // pass as string because SP expects NVARCHAR

                    // Execute and fetch the single result
                    generatedCode = con_obj.QueryFirstOrDefault<string>(
     "ACC_GenerateAccountCode",
     parameters,
     commandType: CommandType.StoredProcedure
 );
                }
                catch (Exception ex)
                {
                    Console.WriteLine("Error generating account code: " + ex);
                }
            }
            return generatedCode ?? "somthing Went Wrong";
        }
    }
}
