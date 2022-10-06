using System;
using System.Collections.Generic;

#nullable disable

namespace ecare.Domain.Entities
{
    public partial class Appointment
    {
        public Appointment()
        {
            AppointmentServices = new HashSet<AppointmentService>();
        }

        public long AppointmentId { get; set; }
        public int? SalesAccountId { get; set; }
        public int? ProviderId { get; set; }
        public DateTime? AppointDate { get; set; }
        public decimal? Fee { get; set; }
        public decimal? Paid { get; set; }
        public string Status { get; set; }
        public int? CreatedBy { get; set; }
        public DateTime? CreatedOn { get; set; }

        public virtual ServiceProvider Provider { get; set; }
        public virtual SaleAccount SalesAccount { get; set; }
        public virtual ICollection<AppointmentService> AppointmentServices { get; set; }
    }
}
