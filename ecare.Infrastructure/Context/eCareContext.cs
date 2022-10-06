using System;
using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata;
using ecare.Domain.Entities;

#nullable disable

namespace ecare.Infrastructure
{
    public partial class eCareContext : DbContext
    {
        public eCareContext()
        {
        }

        public eCareContext(DbContextOptions<eCareContext> options)
            : base(options)
        {
        }

        public virtual DbSet<Account> Accounts { get; set; }
        public virtual DbSet<Appointment> Appointments { get; set; }
        public virtual DbSet<AppointmentService> AppointmentServices { get; set; }
        public virtual DbSet<AspNetRole> AspNetRoles { get; set; }
        public virtual DbSet<AspNetRoleClaim> AspNetRoleClaims { get; set; }
        public virtual DbSet<AspNetUser> AspNetUsers { get; set; }
        public virtual DbSet<AspNetUserClaim> AspNetUserClaims { get; set; }
        public virtual DbSet<AspNetUserLogin> AspNetUserLogins { get; set; }
        public virtual DbSet<AspNetUserRole> AspNetUserRoles { get; set; }
        public virtual DbSet<AspNetUserToken> AspNetUserTokens { get; set; }
        public virtual DbSet<ControlAccount> ControlAccounts { get; set; }
        public virtual DbSet<MainAccount> MainAccounts { get; set; }
        public virtual DbSet<ProviderSpeciality> ProviderSpecialities { get; set; }
        public virtual DbSet<SaleAccount> SaleAccounts { get; set; }
        public virtual DbSet<Service> Services { get; set; }
        public virtual DbSet<ServiceProvider> ServiceProviders { get; set; }
        public virtual DbSet<ServiceProviderType> ServiceProviderTypes { get; set; }
        public virtual DbSet<User> Users { get; set; }

        protected override void OnConfiguring(DbContextOptionsBuilder optionsBuilder)
        {
            if (!optionsBuilder.IsConfigured)
            {
#warning To protect potentially sensitive information in your connection string, you should move it out of source code. You can avoid scaffolding the connection string by using the Name= syntax to read it from configuration - see https://go.microsoft.com/fwlink/?linkid=2131148. For more guidance on storing connection strings, see http://go.microsoft.com/fwlink/?LinkId=723263.
                optionsBuilder.UseSqlServer("Data Source=.;Initial Catalog=eCare;Integrated Security=True");
            }
        }

        protected override void OnModelCreating(ModelBuilder modelBuilder)
        {
            modelBuilder.HasAnnotation("Relational:Collation", "SQL_Latin1_General_CP1_CI_AS");

            modelBuilder.Entity<Account>(entity =>
            {
                entity.Property(e => e.AccountName)
                    .HasMaxLength(100)
                    .IsUnicode(false);

                entity.Property(e => e.Balance)
                    .HasColumnType("decimal(18, 2)")
                    .HasDefaultValueSql("((0))");

                entity.Property(e => e.OpeningBalance)
                    .HasColumnType("decimal(18, 2)")
                    .HasDefaultValueSql("((0))");

                entity.HasOne(d => d.ControlAccount)
                    .WithMany(p => p.Accounts)
                    .HasForeignKey(d => d.ControlAccountId)
                    .HasConstraintName("FK_Accounts_ControlAccounts");
            });

            modelBuilder.Entity<Appointment>(entity =>
            {
                entity.Property(e => e.AppointDate).HasColumnType("datetime");

                entity.Property(e => e.CreatedOn).HasColumnType("datetime");

                entity.Property(e => e.Fee).HasColumnType("decimal(18, 2)");

                entity.Property(e => e.Paid).HasColumnType("decimal(18, 2)");

                entity.Property(e => e.Status)
                    .HasMaxLength(1)
                    .IsUnicode(false)
                    .IsFixedLength(true);

                entity.HasOne(d => d.Provider)
                    .WithMany(p => p.Appointments)
                    .HasForeignKey(d => d.ProviderId)
                    .HasConstraintName("FK_AppointmentMst_ServiceProviders");

                entity.HasOne(d => d.SalesAccount)
                    .WithMany(p => p.Appointments)
                    .HasForeignKey(d => d.SalesAccountId)
                    .HasConstraintName("FK_AppointmentMst_SaleAccounts");
            });

            modelBuilder.Entity<AppointmentService>(entity =>
            {
                entity.HasKey(e => e.AppointServiceId);

                entity.Property(e => e.CreatedOn).HasColumnType("datetime");

                entity.Property(e => e.ModifiedOn).HasColumnType("datetime");

                entity.Property(e => e.Status)
                    .HasMaxLength(1)
                    .IsUnicode(false)
                    .IsFixedLength(true);

                entity.HasOne(d => d.Appointment)
                    .WithMany(p => p.AppointmentServices)
                    .HasForeignKey(d => d.AppointmentId)
                    .HasConstraintName("FK_AppointmentServices_AppointmentMst");

                entity.HasOne(d => d.Service)
                    .WithMany(p => p.AppointmentServices)
                    .HasForeignKey(d => d.ServiceId)
                    .HasConstraintName("FK_AppointmentServices_Services");
            });

            modelBuilder.Entity<AspNetRole>(entity =>
            {
                entity.Property(e => e.Name).HasMaxLength(256);

                entity.Property(e => e.NormalizedName).HasMaxLength(256);
            });

            modelBuilder.Entity<AspNetRoleClaim>(entity =>
            {
                entity.Property(e => e.RoleId)
                    .IsRequired()
                    .HasMaxLength(450);

                entity.HasOne(d => d.Role)
                    .WithMany(p => p.AspNetRoleClaims)
                    .HasForeignKey(d => d.RoleId);
            });

            modelBuilder.Entity<AspNetUser>(entity =>
            {
                entity.Property(e => e.Email).HasMaxLength(256);

                entity.Property(e => e.NormalizedEmail).HasMaxLength(256);

                entity.Property(e => e.NormalizedUserName).HasMaxLength(256);

                entity.Property(e => e.UserName).HasMaxLength(256);
            });

            modelBuilder.Entity<AspNetUserClaim>(entity =>
            {
                entity.Property(e => e.UserId)
                    .IsRequired()
                    .HasMaxLength(450);

                entity.HasOne(d => d.User)
                    .WithMany(p => p.AspNetUserClaims)
                    .HasForeignKey(d => d.UserId);
            });

            modelBuilder.Entity<AspNetUserLogin>(entity =>
            {
                entity.HasKey(e => new { e.LoginProvider, e.ProviderKey });

                entity.Property(e => e.UserId)
                    .IsRequired()
                    .HasMaxLength(450);

                entity.HasOne(d => d.User)
                    .WithMany(p => p.AspNetUserLogins)
                    .HasForeignKey(d => d.UserId);
            });

            modelBuilder.Entity<AspNetUserRole>(entity =>
            {
                entity.HasKey(e => new { e.UserId, e.RoleId });

                entity.HasOne(d => d.Role)
                    .WithMany(p => p.AspNetUserRoles)
                    .HasForeignKey(d => d.RoleId);

                entity.HasOne(d => d.User)
                    .WithMany(p => p.AspNetUserRoles)
                    .HasForeignKey(d => d.UserId);
            });

            modelBuilder.Entity<AspNetUserToken>(entity =>
            {
                entity.HasKey(e => new { e.UserId, e.LoginProvider, e.Name });

                entity.HasOne(d => d.User)
                    .WithMany(p => p.AspNetUserTokens)
                    .HasForeignKey(d => d.UserId);
            });

            modelBuilder.Entity<ControlAccount>(entity =>
            {
                entity.Property(e => e.AccountName)
                    .HasMaxLength(100)
                    .IsUnicode(false);

                entity.HasOne(d => d.MainAccount)
                    .WithMany(p => p.ControlAccounts)
                    .HasForeignKey(d => d.MainAccountId)
                    .HasConstraintName("FK_ControlAccount_MainAccount");
            });

            modelBuilder.Entity<MainAccount>(entity =>
            {
                entity.Property(e => e.AccountName)
                    .HasMaxLength(100)
                    .IsUnicode(false);

                entity.Property(e => e.AccountType)
                    .HasMaxLength(1)
                    .IsUnicode(false)
                    .IsFixedLength(true);
            });

            modelBuilder.Entity<ProviderSpeciality>(entity =>
            {
                entity.HasKey(e => e.SpecialtiesId)
                    .HasName("PK_ServiceProviderSpecialties");

                entity.Property(e => e.Description)
                    .HasMaxLength(100)
                    .IsUnicode(false);

                entity.HasOne(d => d.Provider)
                    .WithMany(p => p.ProviderSpecialities)
                    .HasForeignKey(d => d.ProviderId)
                    .HasConstraintName("FK_ServiceProviderSpecialties_ServiceProviders");
            });

            modelBuilder.Entity<SaleAccount>(entity =>
            {
                entity.Property(e => e.Latitude).HasColumnType("decimal(18, 10)");

                entity.Property(e => e.Location).IsUnicode(false);

                entity.Property(e => e.Longitude).HasColumnType("decimal(18, 10)");

                entity.Property(e => e.Name)
                    .HasMaxLength(150)
                    .IsUnicode(false);

                entity.HasOne(d => d.Account)
                    .WithMany(p => p.SaleAccounts)
                    .HasForeignKey(d => d.AccountId)
                    .HasConstraintName("FK_SaleAccounts_Accounts");
            });

            modelBuilder.Entity<Service>(entity =>
            {
                entity.Property(e => e.CreateOn).HasColumnType("datetime");

                entity.Property(e => e.Description)
                    .HasMaxLength(200)
                    .IsUnicode(false);

                entity.Property(e => e.Fee).HasColumnType("decimal(18, 2)");

                entity.Property(e => e.ModifiedOn).HasColumnType("datetime");

                entity.HasOne(d => d.Account)
                    .WithMany(p => p.Services)
                    .HasForeignKey(d => d.AccountId)
                    .HasConstraintName("FK_Services_Accounts");
            });

            modelBuilder.Entity<ServiceProvider>(entity =>
            {
                entity.HasKey(e => e.ProviderId);

                entity.Property(e => e.ContactNo)
                    .HasMaxLength(30)
                    .IsUnicode(false);

                entity.Property(e => e.CreatedOn).HasColumnType("datetime");

                entity.Property(e => e.Email)
                    .HasMaxLength(40)
                    .IsUnicode(false);

                entity.Property(e => e.Experience)
                    .HasMaxLength(50)
                    .IsUnicode(false);

                entity.Property(e => e.FirstName)
                    .HasMaxLength(50)
                    .IsUnicode(false);

                entity.Property(e => e.LastName)
                    .HasMaxLength(50)
                    .IsUnicode(false);

                entity.Property(e => e.Latitude).HasColumnType("decimal(18, 10)");

                entity.Property(e => e.Location).IsUnicode(false);

                entity.Property(e => e.Longitude).HasColumnType("decimal(18, 10)");

                entity.Property(e => e.MiddleName)
                    .HasMaxLength(50)
                    .IsUnicode(false);

                entity.Property(e => e.Qualification)
                    .HasMaxLength(100)
                    .IsUnicode(false);

                entity.HasOne(d => d.Account)
                    .WithMany(p => p.ServiceProviders)
                    .HasForeignKey(d => d.AccountId)
                    .HasConstraintName("FK_ServiceProviders_Accounts");

                entity.HasOne(d => d.ProviderType)
                    .WithMany(p => p.ServiceProviders)
                    .HasForeignKey(d => d.ProviderTypeId)
                    .HasConstraintName("FK_ServiceProviders_ServiceProviderTypes");

                entity.HasOne(d => d.User)
                    .WithMany(p => p.ServiceProviders)
                    .HasForeignKey(d => d.UserId)
                    .HasConstraintName("FK_ServiceProviders_Users");
            });

            modelBuilder.Entity<ServiceProviderType>(entity =>
            {
                entity.HasKey(e => e.ProviderTypeId);

                entity.Property(e => e.Description)
                    .HasMaxLength(50)
                    .IsUnicode(false);
            });

            modelBuilder.Entity<User>(entity =>
            {
                entity.Property(e => e.AspUserId).HasMaxLength(450);

                entity.Property(e => e.LastLogin).HasColumnType("datetime");

                entity.Property(e => e.UserName)
                    .HasMaxLength(100)
                    .IsUnicode(false);

                entity.HasOne(d => d.AspUser)
                    .WithMany(p => p.Users)
                    .HasForeignKey(d => d.AspUserId)
                    .HasConstraintName("FK_Users_AspNetUsers");
            });

            OnModelCreatingPartial(modelBuilder);
        }

        partial void OnModelCreatingPartial(ModelBuilder modelBuilder);
    }
}
