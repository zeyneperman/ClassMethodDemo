using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ClassMethodDemo
{
    class CustomerManager
    {
        public void Add(Customer customer)
        {
            Console.WriteLine(customer.Id + " " + customer.Name + " " + customer.SurName + " " + "İsimli müşteri eklendi.");
            Console.WriteLine("***");
        }
        public void Remove (Customer customer)
        {
            Console.WriteLine(customer.Id+ " " + customer.Name + " "  + customer.SurName + " " + "İsimli müşteri silindi.");
            Console.WriteLine("***");
        }
    }
}
