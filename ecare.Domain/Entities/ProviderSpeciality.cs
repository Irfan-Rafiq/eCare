using System;
using System.Collections.Generic;

#nullable disable

namespace ecare.Domain.Entities
{
    public partial class ProviderSpeciality
    {
        public int SpecialtiesId { get; set; }
        public int? ProviderId { get; set; }
        public string Description { get; set; }

        public virtual ServiceProvider Provider { get; set; }
    }
}
