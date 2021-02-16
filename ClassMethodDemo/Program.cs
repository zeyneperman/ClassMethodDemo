using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ClassMethodDemo
{
    class Program
    {
        static void Main(string[] args)
        {
            CustomerManager manager = new CustomerManager();
            Customer customer = new Customer();
            customer.Id = "1";
            customer.Name = "müşteri";
            customer.SurName = "kullanıcı";

            manager.Add(customer);
            manager.Remove(customer);
            Console.ReadKey();
        }
    }
}
