﻿using PizzaShoppe.Domain.Entities;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace PizzaShoppe.Domain.Abstract
{
    public interface IBeverageRepository
    {
        IEnumerable<Beverage> BeveragesList { get; }
    }
}
