using System;
using System.Collections.Generic;
using System.Linq.Expressions;
using System.Threading.Tasks;

namespace ecare.Domain.Contracts
{
    public interface IRepository<T> where T : class
    {
        void SaveEntity(T entity);
        Task SaveEntityAsync(T entity);
        void UpdateEntity(T entity);
        T GetEntityById(object id);
        Task<T> GetEntityByIdAsync(object id);
        IEnumerable<T> Find(Expression<Func<T, bool>> predicate);
        Task<IEnumerable<T>> FindAsync(Expression<Func<T, bool>> predicate);
        Task<IEnumerable<T>> FindAsync(Expression<Func<T, bool>> predicate, string[] navigationProperties);
        IEnumerable<T> GetAllEntities();

    }
}
