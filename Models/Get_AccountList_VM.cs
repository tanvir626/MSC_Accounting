namespace Accounting_Module.Models
{
    public class Get_AccountList_VM
    {
        public long AccountID { get; set; }

        public string? AccountName { get; set; }

        public string? Status { get; set; }

        public string? IsMaster { get; set; }

        public string? IsParent { get; set; }

    }
}
