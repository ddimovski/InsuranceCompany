namespace InsuranceCompanyWebApp.Migrations
{
    using System;
    using System.Data.Entity.Migrations;
    
    public partial class admin : DbMigration
    {
        public override void Up()
        {
            AddColumn("dbo.AspNetUsers", "admin", c => c.Boolean(nullable: false));
        }
        
        public override void Down()
        {
            DropColumn("dbo.AspNetUsers", "admin");
        }
    }
}
