using System;
using System.Collections.Generic;

#nullable disable

namespace ecare.Domain.Entities
{
    public partial class SaleAccount
    {
        public SaleAccount()
        {
            Appointments = new HashSet<Appointment>();
        }

        public int SaleAccountId { get; set; }
        public string Name { get; set; }
        public decimal? Latitude { get; set; }
        public decimal? Longitude { get; set; }
        public string Location { get; set; }
        public int? AccountId { get; set; }

        public virtual Account Account { get; set; }
        public virtual ICollection<Appointment> Appointments { get; set; }
    }
}
