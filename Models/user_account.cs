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
    
    public partial class user_account
    {
        public int id { get; set; }
        public string user_name { get; set; }
        public string email { get; set; }
        public string password_salt { get; set; }
        public string password_hash_algorithm { get; set; }
    }
}
