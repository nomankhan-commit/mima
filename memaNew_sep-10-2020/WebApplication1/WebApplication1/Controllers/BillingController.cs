﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using WebApplication1.Models;
using WebApplication1.mima_img_processing;
using System.IO;

namespace WebApplication1.Controllers
{
    public class BillingController : Controller
    {
        // GET: Billing
        Mima_Finance_Entities db = new Mima_Finance_Entities();
        BillimgUpload img = new BillimgUpload();

        public ActionResult Index()
        {
            return View();
        }

        public ActionResult vBilling()
        {

            return View(db.Billings.ToList());
        }

        public ActionResult Add(int? id)
        {

            if (id == 0)
            {
                ViewBag.isAutoId = true;
            var id_ = 0;
            string finalVoucherNum;
            var idList = db.Billings.Select(x => x.Bill_id).ToList();

            if (idList.Count != 0)
            {
                var idd = idList.Last();
                var iddd = Convert.ToInt16(idd);
                id_ = iddd + 1;

                finalVoucherNum = Convert.ToString("000" + id_);
                ViewBag.vNum = finalVoucherNum;
            }
            else
            {
                finalVoucherNum = Convert.ToString("000" + 1);
                ViewBag.vNum = finalVoucherNum;
            }
            }
            else
            {
                ViewBag.isAutoId =false;
            }

            ViewBag.control = db.Control_Details.ToList();
            ViewBag.paidTo = db.Paid_to_Details.ToList();
            var dataa = db.Billings.Find(id);
            if (id!=0)
            {
                dataa.amountWithComma = string.Format("{0:#,0}", (dataa.Amount == null ? 0 : dataa.Amount));
            }
            
            return PartialView("Add",dataa);
        }

        [HttpPost]
        public ActionResult Add(Billing data)
        {


            if (data.id==0)
            {
                string computer_name = Path.GetFileNameWithoutExtension(data.ImageFile.FileName);// file name before save. 


                string extension = Path.GetExtension(data.ImageFile.FileName);
                var name1 = DateTime.Now.ToString("yymmssfff") + extension;

                var name2 = name1;
                var fileSize = data.ImageFile.ContentLength;
                string fileType = data.ImageFile.ContentType;

                Stream a = data.ImageFile.InputStream;
                System.Drawing.Image image = System.Drawing.Image.FromStream(a);
                int height = image.Height;
                int width = image.Width;

                string folder = "Image";

                string fileName = Path.Combine(Server.MapPath(folder), name1);

                string isFolder_exist = Path.Combine(Server.MapPath(folder));

                bool isexist = Directory.Exists(isFolder_exist);
                if (!isexist)
                {
                    Directory.CreateDirectory(isFolder_exist);
                }
                
                data.ImageFile.SaveAs(fileName);
                ModelState.Clear();
                data.imgPath = name2;
                data.createAt = DateTime.Now;
                data.isCancell = false;
                data.isPending = false;
                data.Amount = Convert.ToInt32(data.amountWithComma.Replace(",", ""));
                db.Billings.Add(data);
            }
            else {
                db.Entry(data).State = System.Data.Entity.EntityState.Modified;

            }
            db.SaveChanges();
             return RedirectToAction("vBilling", "Billing"); 
            //return PartialView("_vBilling", db.Billings.ToList());
        }


    }



   

}