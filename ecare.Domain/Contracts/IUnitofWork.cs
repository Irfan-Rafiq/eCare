using System.Threading.Tasks;

namespace ecare.Domain.Contracts
{
    public interface IUnitofWork
    {
        void Commit();
        Task CommitAsync();
        void RollbackChanges();
    }
}
