using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.ComponentModel.DataAnnotations;
using System.Data.Objects.DataClasses;

namespace WijMarket.Models.EntityClass
{
	public class StockEntity
	{
		[Key]
		public int StockId
		{
			get;
			set;
		}

		public int? SectorId
		{
			get;
			set;
		}

		public string StockCode
		{
			get;
			set;
		}

		public int ExchangeId
		{
			get;
			set;
		}

		public string StockName
		{
			get;
			set;
		}
	}
}