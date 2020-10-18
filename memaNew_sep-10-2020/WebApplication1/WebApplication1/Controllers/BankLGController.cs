using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using WebApplication1.Models;
using System.Threading;
namespace WebApplication1.Controllers
{
    public class BankLGController : Controller
    {
        // GET: BankLG1

        Mima_Finance_DevEntities ddb = new Mima_Finance_DevEntities();
        Mima_Finance_Entities db = new Mima_Finance_Entities();
        public ActionResult Index()
        {
            
            DateTime EDate = DateTime.Now;
            DateTime startDate = new DateTime(2020, 6, 10);
            DateTime endDate = new DateTime(2020, 7, 1);
            var data = ddb.Usp_BankGL(startDate, endDate, 1).ToList();
            // ViewBag.banks = ddb.Banks.Select(i=> new {i.Bank_Name }).Distinct().ToList();
            ViewBag.banks = ddb.Banks.ToList();
            return View(data);
        }
        public ActionResult Usp_APLG()
        {
            DateTime EDate = DateTime.Now;
            DateTime startDate = new DateTime(2020, 6, 10);
            DateTime endDate = new DateTime(2020, 7, 1);
            var data = ddb.Usp_APGL(startDate, endDate, 1).ToList();
            ViewBag.Paid_To = ddb.Paid_To.ToList();
            return View(data);
        }
        public ActionResult Usp_ProjectLG()
        {
            DateTime EDate = DateTime.Now;
            DateTime startDate = new DateTime(2020, 6, 1);
            DateTime endDate = new DateTime(2020, 12, 1);
            var data = ddb.Usp_ProjectGL(startDate, endDate, 1).ToList();
            ViewBag.controll = ddb.Controls.ToList();
            return View(data);
        }


        public ActionResult FilterData(DateTime startDate,DateTime endDate, int id,string idd, int type) {
           

            if (type == 1)
            {
                return PartialView("Index_", ddb.Usp_BankGL(startDate, endDate, id).ToList());
            }
            else if (type == 2)
            {
                return PartialView("Usp_APLG_", ddb.Usp_APGL(startDate, endDate, id).ToList());
            }
            else 
            {
                return PartialView("Usp_ProjectLG_Result_", ddb.Usp_ProjectGL(startDate, endDate, id).ToList());
            }
           

        }

        public JsonResult spCall() {
           bool status= true;
            Thread.Sleep(2000);
            try
            {
                ddb.Usp_Populate_Dev();
                status = true;
            }
            catch (Exception ex)
            {
                status = false;
                
            }


            return Json(status, JsonRequestBehavior.AllowGet); 


        }
    }
}