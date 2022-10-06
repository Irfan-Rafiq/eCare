//using ecare.Domain.Contracts;
//using System;
//using System.Collections.Generic;
//using System.Linq;
//using System.Text;
//using System.Threading.Tasks;
//using System.Linq.Expressions;
//using ecare.Infrastructure.DBContext;
//using System.Data.Entity;

//namespace ecare.Infrastructure.Implementations
//{
//    public class Repository<T> : IRepository<T> where T : class
//    {
//        protected eCareContext dbContext;
//        protected DbSet<T> entity;

//        public Repository(eCareContext _dbContext)
//        {
//            this.dbContext = _dbContext;
//            this.entity = _dbContext.Set<T>();
//        }
//        public IEnumerable<T> Find(Expression<Func<T, bool>> predicate)
//        {
//            return dbContext.Set<T>().Where(predicate).ToList();
//        }

//        public async Task<IEnumerable<T>> FindAsync(Expression<Func<T, bool>> predicate)
//        {
//            return await dbContext.Set<T>().Where(predicate).ToListAsync();
//        }

//        public async Task<IEnumerable<T>> FindAsync(Expression<Func<T, bool>> predicate, string[] navigationProperties)
//        {
//            var result = dbContext.Set<T>().Where(predicate);
//            foreach (string navigationProperty in navigationProperties)
//            {
//                result.Include(navigationProperty);
//            }
//            return await result.ToListAsync();

//        }

//        public IEnumerable<T> GetAllEntities()
//        {
//            return dbContext.Set<T>().ToList();
//        }

//        public T GetEntityById(object id)
//        {
//            throw new NotImplementedException();
//        }

//        public Task<T> GetEntityByIdAsync(object id)
//        {
//            throw new NotImplementedException();
//        }

//        public void SaveEntity(T entity)
//        {
//            throw new NotImplementedException();
//        }

//        public Task SaveEntityAsync(T entity)
//        {
//            throw new NotImplementedException();
//        }

//        public void UpdateEntity(T entity)
//        {
//            throw new NotImplementedException();
//        }
//    }
//}
