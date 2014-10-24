using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web;

namespace EventPlanner.Models
{
	public class EventObj
	{
		[Key]
		public int Id { get; set; }
		public string Subject { get; set; }
		public string Location { get; set; }
		public DateTime Start { get; set; }
		public DateTime End { get; set; }
		public string Description { get; set; }
		public bool AllDay { get; set; }
	}
}