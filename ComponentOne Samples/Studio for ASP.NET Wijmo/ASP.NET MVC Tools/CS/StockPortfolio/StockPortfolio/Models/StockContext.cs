using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data.Entity;

namespace WijMarket.Models.EntityClass
{
	public class StockContext:DbContext
	{
		public DbSet<StockEntity> StockEntitys
		{
			get;
			set;
		}
	}
}