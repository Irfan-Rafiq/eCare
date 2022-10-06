using ecare.Domain.Contracts;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ecare.Infrastructure.Implementations
{
    public class UnitofWork : IUnitofWork
    {
        public void Commit()
        {
            throw new NotImplementedException();
        }

        public Task CommitAsync()
        {
            throw new NotImplementedException();
        }

        public void RollbackChanges()
        {
            throw new NotImplementedException();
        }
    }
}
