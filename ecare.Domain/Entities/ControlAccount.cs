using System;
using System.Collections.Generic;

#nullable disable

namespace ecare.Domain.Entities
{
    public partial class ControlAccount
    {
        public ControlAccount()
        {
            Accounts = new HashSet<Account>();
        }

        public int ControlAccountId { get; set; }
        public int? MainAccountId { get; set; }
        public string AccountName { get; set; }

        public virtual MainAccount MainAccount { get; set; }
        public virtual ICollection<Account> Accounts { get; set; }
    }
}
