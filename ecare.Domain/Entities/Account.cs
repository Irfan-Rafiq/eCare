using System;
using System.Collections.Generic;

#nullable disable

namespace ecare.Domain.Entities
{
    public partial class Account
    {
        public Account()
        {
            SaleAccounts = new HashSet<SaleAccount>();
            ServiceProviders = new HashSet<ServiceProvider>();
            Services = new HashSet<Service>();
        }

        public int AccountId { get; set; }
        public int? ControlAccountId { get; set; }
        public string AccountName { get; set; }
        public decimal? Balance { get; set; }
        public decimal? OpeningBalance { get; set; }

        public virtual ControlAccount ControlAccount { get; set; }
        public virtual ICollection<SaleAccount> SaleAccounts { get; set; }
        public virtual ICollection<ServiceProvider> ServiceProviders { get; set; }
        public virtual ICollection<Service> Services { get; set; }
    }
}
