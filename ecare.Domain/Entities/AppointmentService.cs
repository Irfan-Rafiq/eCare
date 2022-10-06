using System;
using System.Collections.Generic;

#nullable disable

namespace ecare.Domain.Entities
{
    public partial class AppointmentService
    {
        public long AppointServiceId { get; set; }
        public long? AppointmentId { get; set; }
        public int? ServiceId { get; set; }
        public string Status { get; set; }
        public int? CreatedBy { get; set; }
        public DateTime? CreatedOn { get; set; }
        public int? ModifiedBy { get; set; }
        public DateTime? ModifiedOn { get; set; }

        public virtual Appointment Appointment { get; set; }
        public virtual Service Service { get; set; }
    }
}
