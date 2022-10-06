using System;
using System.Collections.Generic;

#nullable disable

namespace ecare.Domain.Entities
{
    public partial class ServiceProvider
    {
        public ServiceProvider()
        {
            Appointments = new HashSet<Appointment>();
            ProviderSpecialities = new HashSet<ProviderSpeciality>();
        }

        public int ProviderId { get; set; }
        public int? AccountId { get; set; }
        public int? UserId { get; set; }
        public int? ProviderTypeId { get; set; }
        public string FirstName { get; set; }
        public string MiddleName { get; set; }
        public string LastName { get; set; }
        public string ContactNo { get; set; }
        public string Email { get; set; }
        public decimal? Latitude { get; set; }
        public decimal? Longitude { get; set; }
        public string Location { get; set; }
        public int? CityId { get; set; }
        public int? StateId { get; set; }
        public int? CountryId { get; set; }
        public string Qualification { get; set; }
        public string Experience { get; set; }
        public DateTime? CreatedOn { get; set; }
        public int? ModifiedBy { get; set; }
        public int? ModifiedOn { get; set; }

        public virtual Account Account { get; set; }
        public virtual ServiceProviderType ProviderType { get; set; }
        public virtual User User { get; set; }
        public virtual ICollection<Appointment> Appointments { get; set; }
        public virtual ICollection<ProviderSpeciality> ProviderSpecialities { get; set; }
    }
}
