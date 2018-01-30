using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.ComponentModel.DataAnnotations;

namespace PartyInvites.Models
{
    /// <summary>
    /// 
    /// <purpose>
    ///  Describes Incoming Guest Responses
    /// </purpose>
    /// 
    ///<properties description>
    /// Name : Guest Name, string
    /// Email : Guest Email, string
    /// Phone : Guest Phone Number, string
    /// WillAttend: Guest attendance, nullable boolean (true, false or null)
    ///</properties description>
    /// 
    /// </summary>
    
    public class GuestResponse
    {
        [Required(ErrorMessage="Please enter your name.")]
        public string Name { get; set; }

        [Required(ErrorMessage = "Please enter your email address.")]
        [RegularExpression(".+\\@.+\\..+")]
        public string Email { get; set; }

        [Required(ErrorMessage="Please enter your phone number.")]
        public string Phone { get; set; }

        [Required(ErrorMessage = "Please let us know if you are coming or not.")]
        public bool? WillAttend { get; set; }

    }
}