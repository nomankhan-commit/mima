//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated from a template.
//
//     Manual changes to this file may cause unexpected behavior in your application.
//     Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace WebApplication1.Models
{
    using System;
    using System.Collections.Generic;
    
    public partial class Billing
    {
        public int id { get; set; }
        public string Bill_id { get; set; }
        public string Name { get; set; }
        public string Control { get; set; }
        public string Category { get; set; }
        public Nullable<long> Amount { get; set; }
        public Nullable<System.DateTime> Date { get; set; }
        public string imgPath { get; set; }
        public string base64 { get; set; }
        public Nullable<System.DateTime> createAt { get; set; }
        public Nullable<bool> isCancell { get; set; }
        public Nullable<bool> isPending { get; set; }
    }
}
