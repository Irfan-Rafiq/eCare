using System;
using System.Collections.Generic;

#nullable disable

namespace ecare.Domain.Entities
{
    public partial class MainAccount
    {
        public MainAccount()
        {
            ControlAccounts = new HashSet<ControlAccount>();
        }

        public int MainAccountId { get; set; }
        public string AccountName { get; set; }
        public string AccountType { get; set; }

        public virtual ICollection<ControlAccount> ControlAccounts { get; set; }
    }
}
