using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.ComponentModel.DataAnnotations;

namespace TahDo.Models
{
    public class TahDoList
    {
        [Editable(false)]
        public int Id { get; set; }

        [Required]
        public string Title { get; set; }

        [Display(Name = "Date Created")]
        public DateTime? CreatedAt { get; set; }

        [Range(0, 5),UIHint("IntSlider")]
        public int Priority { get; set; }

        [Range(0, 1000000)]
        public decimal Cost { get; set; }

        [DataType(DataType.MultilineText)]
        public string Summary { get; set; }

        public bool Done { get; set; }

        [Display(Name = "Date Completed")]
        public DateTime? DoneAt { get; set; }

        public ICollection<TahDoItem> TahDoItems { get; set; }

    }

    public class TahDoItem
    {
        [Editable(false)]
        public int Id { get; set; }

        [Required]
        public string Title { get; set; }

        [Display(Name = "Date Created")]
        public DateTime? CreatedAt { get; set; }

        [Range(0, 5), UIHint("IntSlider")]
        public int Priority { get; set; }

        [DataType(DataType.MultilineText)]
        public string Note { get; set; }

        public int TahDoListId { get; set; }

        public TahDoList TahDoList { get; set; }

        public bool Done { get; set; }

        [Display(Name = "Date Completed")]
        public DateTime? DoneAt { get; set; }
    }

}