using Accounting_Module.Models;
using Dapper;
using Microsoft.Data.SqlClient;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace Accounting_Module.Repository
{
    public class Account_Repository_In(IConfiguration con) : IAccount_Repository_In
    {
        private readonly string? con = con.GetConnectionString("DapperString") ?? "Something Went Wrong";

        public bool Insert_Data_To_table<T>(string tableName, T entity)
        {
            var properties = typeof(T).GetProperties()
        .Where(p => !Attribute.IsDefined(p, typeof(KeyAttribute)) &&
                    !Attribute.IsDefined(p, typeof(DatabaseGeneratedAttribute)));

            var columns = string.Join(", ", properties.Select(p => p.Name));
            var parameters = string.Join(", ", properties.Select(p => "@" + p.Name));

            var sql = $"INSERT INTO {tableName} ({columns}) VALUES ({parameters})";

            using var connection = new SqlConnection(con);
            return connection.Execute(sql, entity) > 0;
        }

    }
}
