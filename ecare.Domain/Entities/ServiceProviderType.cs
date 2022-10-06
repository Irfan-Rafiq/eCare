using System;
using System.Collections.Generic;

#nullable disable

namespace ecare.Domain.Entities
{
    public partial class ServiceProviderType
    {
        public ServiceProviderType()
        {
            ServiceProviders = new HashSet<ServiceProvider>();
        }

        public int ProviderTypeId { get; set; }
        public string Description { get; set; }

        public virtual ICollection<ServiceProvider> ServiceProviders { get; set; }
    }
}
