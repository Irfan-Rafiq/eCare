using System;
using System.Collections.Generic;

#nullable disable

namespace ecare.Domain.Entities
{
    public partial class User
    {
        public User()
        {
            ServiceProviders = new HashSet<ServiceProvider>();
        }

        public int UserId { get; set; }
        public string UserName { get; set; }
        public string AspUserId { get; set; }
        public DateTime? LastLogin { get; set; }

        public virtual AspNetUser AspUser { get; set; }
        public virtual ICollection<ServiceProvider> ServiceProviders { get; set; }
    }
}
