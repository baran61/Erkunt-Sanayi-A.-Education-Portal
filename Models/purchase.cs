//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated from a template.
//
//     Manual changes to this file may cause unexpected behavior in your application.
//     Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace Website.Models
{
    using System;
    using System.Collections.Generic;
    
    public partial class purchase
    {
        public int id { get; set; }
        public byte[] purchase_date { get; set; }
        public Nullable<int> user_account_id { get; set; }
        public Nullable<int> delivery_address_id { get; set; }
        public Nullable<int> total_price { get; set; }
    }
}
