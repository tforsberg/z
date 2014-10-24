using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Linq;
using System.Web;

namespace EventPlanner.Models
{
	public class EventPlannerEntities : DbContext
	{
		public DbSet<EventObj> Events { get; set; }

		public EventPlannerEntities()
		{
			Database.CreateIfNotExists();
		}
	}
}