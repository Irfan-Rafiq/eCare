using System;
using System.Collections.Generic;

#nullable disable

namespace ecare.Domain.Entities
{
    public partial class Service
    {
        public Service()
        {
            AppointmentServices = new HashSet<AppointmentService>();
        }

        public int ServiceId { get; set; }
        public string Description { get; set; }
        public decimal? Fee { get; set; }
        public int? AccountId { get; set; }
        public int? CreatedBy { get; set; }
        public DateTime? CreateOn { get; set; }
        public int? ModifiedBy { get; set; }
        public DateTime? ModifiedOn { get; set; }

        public virtual Account Account { get; set; }
        public virtual ICollection<AppointmentService> AppointmentServices { get; set; }
    }
}
