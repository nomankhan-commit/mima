﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using Newtonsoft;
using WebApplication1.Models;
using iTextSharp.text;
using iTextSharp.text.pdf;
using System.IO;


namespace WebApplication1.Controllers
{
    public class shartRecCachController : Controller
    {
        // GET: shartRecCach
        int _tablecolumn = 3;
        Document _document;
        Font _fontStyle;
        PdfPTable _PdfTable = new PdfPTable(3);
        PdfPTable _table1 = new PdfPTable(2);
        PdfPTable _table2 = new PdfPTable(3);
        PdfPTable _table4 = new PdfPTable(3);
        PdfPCell _PdfCell;
        MemoryStream _memoryStream = new MemoryStream();

        Mima_Finance_DevEntities dd = new Mima_Finance_DevEntities();

        Mima_Finance_Entities db = new Mima_Finance_Entities();
        // GET: shart
        public JsonResult Index(CashReceiptVoucher data)

        {


            byte[] abytes = prepareReport(data);
            string base64String = Convert.ToBase64String(abytes, 0, abytes.Length);
            return Json(base64String, JsonRequestBehavior.AllowGet);
            //return File(base64String, "application/pdf");
            //Response.AppendHeader("content-disposition", "inline; filename=file.pdf");
            //return new FileStreamResult(prepareReport(data), "application/pdf");
            #region

            #endregion


        }

        public byte[] prepareReport(CashReceiptVoucher data)
        {
            //public MemoryStream prepareReport(cashPaymentVoucher data) { 

            _document = new Document(PageSize.A4, 0f, 0f, 0f, 0f);
            _document.SetPageSize(PageSize.A4);
            _document.SetMargins(20f, 20f, 20f, 20f);

            _PdfTable.WidthPercentage = 100;
            _table1.WidthPercentage = 100;
            _table1.HorizontalAlignment = Element.ALIGN_LEFT;
            _PdfTable.HorizontalAlignment = Element.ALIGN_LEFT;

            _table2.WidthPercentage = 100;
            _table2.HorizontalAlignment = Element.ALIGN_LEFT;


            _table4.WidthPercentage = 100;
            _table4.HorizontalAlignment = Element.ALIGN_LEFT;


            _fontStyle = FontFactory.GetFont("Tahoma", 8f, 1);
            PdfWriter.GetInstance(_document, _memoryStream);
            _document.Open();
            _PdfTable.SetWidths(new float[] { 40f, 10f, 10f });

            _table1.SetWidths(new float[] { 10f, 30f });
            _table2.SetWidths(new float[] { 40f, 10f, 20f });
            _table4.SetWidths(new float[] { 40f, 40f, 40f });


            _PdfTable.SpacingBefore = 10;
            _table2.SpacingBefore = 50;
            _table2.SpacingBefore = 50;
            this.ReportHeader(data);
            this.ReportBody(data);
            _PdfTable.HeaderRows = 2;

            _document.Add(_PdfTable);
            _document.Add(_table1);
            _document.Add(_table2);
            _document.Add(_table4);
            _document.Close();
            //return _memoryStream.ToArray();

            return _memoryStream.ToArray();

        }

        public void ReportHeader(CashReceiptVoucher data)
        {

            var logo = iTextSharp.text.Image.GetInstance(Server.MapPath("~/Content/img/LOGO.jpg"));
            //logo.SetAbsolutePosition(400,2000);
            //_document.Add(logo);

            string imageURL = Server.MapPath("~/Content/img/LOGO.jpg");

            iTextSharp.text.Image jpg = iTextSharp.text.Image.GetInstance(imageURL);

            //Resize image depend upon your need

            jpg.ScaleToFit(140f, 120f);

            //Give space before image

            jpg.SpacingBefore = 10f;

            //Give some space after the image

            jpg.SpacingAfter = 1f;

            jpg.Alignment = Element.ALIGN_LEFT;

            _document.Add(jpg);

            _fontStyle = _fontStyle = FontFactory.GetFont(FontFactory.TIMES_ROMAN, 14f, BaseColor.BLACK);
            _PdfCell = new PdfPCell(new Phrase(" ", _fontStyle));
            _PdfCell.Colspan = _tablecolumn;
            _PdfCell.HorizontalAlignment = Element.ALIGN_CENTER;
            _PdfCell.Border = 0;
            _PdfCell.BackgroundColor = BaseColor.WHITE;
            _PdfCell.ExtraParagraphSpace = 0;
            _PdfTable.AddCell(_PdfCell);
            _PdfTable.CompleteRow();


            _fontStyle = _fontStyle = FontFactory.GetFont(FontFactory.TIMES_ROMAN, 14f, 1);
            _PdfCell = new PdfPCell(new Phrase("Cash Reciept Voucher", _fontStyle));
            _PdfCell.Colspan = _tablecolumn;
            _PdfCell.HorizontalAlignment = Element.ALIGN_CENTER;
            _PdfCell.Border = 0;
            _PdfCell.BackgroundColor = BaseColor.WHITE;
            _PdfCell.ExtraParagraphSpace = 0;
            _PdfTable.AddCell(_PdfCell);
            _PdfTable.CompleteRow();






        }

        public void ReportBody(CashReceiptVoucher data)
        {
            _fontStyle = FontFactory.GetFont("Tahoma", 12f, 1);
            _PdfCell = new PdfPCell(new Phrase("\n"));
            _PdfCell.Border = 0;
            _PdfCell.Colspan = 3;
            _PdfCell.HorizontalAlignment = Element.ALIGN_RIGHT;
            _PdfTable.AddCell(_PdfCell);
            _PdfTable.CompleteRow();            

            _fontStyle = FontFactory.GetFont("Tahoma", 12f, 1);
            _PdfCell = new PdfPCell(new Phrase("", _fontStyle));
            _PdfCell.Border = 0;
            _PdfCell.HorizontalAlignment = Element.ALIGN_RIGHT;
            _PdfTable.AddCell(_PdfCell);

            _fontStyle = FontFactory.GetFont("Tahoma", 12f, 1);
            _PdfCell = new PdfPCell(new Phrase("Voucer No: ", _fontStyle));
            //_PdfCell.Colspan = 2;
            //  _PdfCell.Width = 2; 
            _PdfCell.HorizontalAlignment = Element.ALIGN_LEFT;
            _PdfCell.Border = 0;
            _PdfTable.AddCell(_PdfCell);

            _PdfCell = new PdfPCell(new Phrase(data.VNumber.ToString(), _fontStyle));
            _PdfCell.HorizontalAlignment = Element.ALIGN_LEFT;
            _PdfCell.Border = 0;
            _PdfTable.AddCell(_PdfCell);
            _PdfTable.CompleteRow();
            //-------------//

            _fontStyle = FontFactory.GetFont("Tahoma", 12f, 1);
            _PdfCell = new PdfPCell(new Phrase("", _fontStyle));
            _PdfCell.Border = 0;
            _PdfCell.HorizontalAlignment = Element.ALIGN_RIGHT;
            _PdfTable.AddCell(_PdfCell);

            _fontStyle = FontFactory.GetFont("Tahoma", 12f, 1);
            _PdfCell = new PdfPCell(new Phrase("Date : ", _fontStyle));
            //_PdfCell.Colspan = 2;
            // _PdfCell.Width = 2;
            _PdfCell.HorizontalAlignment = Element.ALIGN_LEFT;
            _PdfCell.Border = 0;
            _PdfTable.AddCell(_PdfCell);

            _PdfCell = new PdfPCell(new Phrase(data.Date.ToString(), _fontStyle));
            _PdfCell.HorizontalAlignment = Element.ALIGN_LEFT;
            _PdfCell.Border = 0;
            //_PdfCell.Width = 2;
            _PdfTable.AddCell(_PdfCell);
            _PdfTable.CompleteRow();

            //-------------//

            //-------------//

            _fontStyle = FontFactory.GetFont("Tahoma", 12f, 1);
            _PdfCell = new PdfPCell(new Phrase("", _fontStyle));
            _PdfCell.Border = 0;
            _PdfCell.HorizontalAlignment = Element.ALIGN_RIGHT;
            _PdfTable.AddCell(_PdfCell);

            _fontStyle = FontFactory.GetFont("Tahoma", 12f, 1);
            _PdfCell = new PdfPCell(new Phrase("Category : ", _fontStyle));
            //_PdfCell.Colspan = 2;
            // _PdfCell.Width = 2;
            _PdfCell.HorizontalAlignment = Element.ALIGN_LEFT;
            _PdfCell.Border = 0;
            _PdfTable.AddCell(_PdfCell);

            _PdfCell = new PdfPCell(new Phrase(data.Category, _fontStyle));
            _PdfCell.HorizontalAlignment = Element.ALIGN_LEFT;
            _PdfCell.Border = 0;
            //_PdfCell.Width = 2;
            _PdfTable.AddCell(_PdfCell);
            _PdfTable.CompleteRow();

            //-------------//


            //----------//
            _PdfCell = new PdfPCell(new Phrase("\n"));
            _PdfCell.HorizontalAlignment = Element.ALIGN_LEFT;
            _PdfCell.Border = 0;
            _PdfCell.Colspan = 2;
            _table1.AddCell(_PdfCell);
            _table1.CompleteRow();



            _fontStyle = FontFactory.GetFont("Tahoma", 12f, 1);
            _PdfCell = new PdfPCell(new Phrase("Received From: ", _fontStyle));
            _PdfCell.Border = 0;
            _PdfCell.HorizontalAlignment = Element.ALIGN_LEFT;
            _table1.AddCell(_PdfCell);
            _PdfCell = new PdfPCell(new Phrase(data.Received_From.ToString(), _fontStyle));
            _PdfCell.HorizontalAlignment = Element.ALIGN_LEFT;
            _PdfCell.Border = 0;
            _table1.AddCell(_PdfCell);
            _table1.CompleteRow();


            _fontStyle = FontFactory.GetFont("Tahoma", 12f, 1);
            _PdfCell = new PdfPCell(new Phrase("Amount: ", _fontStyle));
            _PdfCell.Border = 0;
            _PdfCell.HorizontalAlignment = Element.ALIGN_LEFT;
            _table1.AddCell(_PdfCell);
            _PdfCell = new PdfPCell(new Phrase(data.AmountWithComma.ToString(), _fontStyle));
            _PdfCell.HorizontalAlignment = Element.ALIGN_LEFT;
            _PdfCell.Border = 0;
            _table1.AddCell(_PdfCell);
            _table1.CompleteRow();


            _fontStyle = FontFactory.GetFont("Tahoma", 12f, 1);
            _PdfCell = new PdfPCell(new Phrase("Rupees: ", _fontStyle));
            _PdfCell.Border = 0;
            _PdfCell.HorizontalAlignment = Element.ALIGN_LEFT;
            _table1.AddCell(_PdfCell);
            _PdfCell = new PdfPCell(new Phrase(data.Rupees.ToString(), _fontStyle));
            _PdfCell.HorizontalAlignment = Element.ALIGN_LEFT;
            _PdfCell.Border = 0;
            _table1.AddCell(_PdfCell);
            _table1.CompleteRow();

            _fontStyle = FontFactory.GetFont("Tahoma", 12f, 1);
            _PdfCell = new PdfPCell(new Phrase("AC Description: ", _fontStyle));
            _PdfCell.Border = 0;
            _PdfCell.HorizontalAlignment = Element.ALIGN_LEFT;
            _table1.AddCell(_PdfCell);
            _PdfCell = new PdfPCell(new Phrase(data.A_C_Description.ToString(), _fontStyle));
            _PdfCell.HorizontalAlignment = Element.ALIGN_LEFT;
            _PdfCell.Border = 0;
            _table1.AddCell(_PdfCell);
            _table1.CompleteRow();


            _fontStyle = FontFactory.GetFont("Tahoma", 12f, 1);
            _PdfCell = new PdfPCell(new Phrase("Narration: ", _fontStyle));
            _PdfCell.Border = 0;
            _PdfCell.HorizontalAlignment = Element.ALIGN_LEFT;
            _table1.AddCell(_PdfCell);
            _PdfCell = new PdfPCell(new Phrase(data.Narration.ToString(), _fontStyle));
            _PdfCell.HorizontalAlignment = Element.ALIGN_LEFT;
            _PdfCell.Border = 0;
            _table1.AddCell(_PdfCell);
            _table1.CompleteRow();



            //-------------//

            //----------//
            _PdfCell = new PdfPCell(new Phrase("\n"));
            _PdfCell.HorizontalAlignment = Element.ALIGN_LEFT;
            _PdfCell.Border = 0;
            _PdfCell.Colspan = 2;
            _table1.AddCell(_PdfCell);
            _table4.CompleteRow();

            _PdfCell = new PdfPCell(new Phrase("\n"));
            _PdfCell.HorizontalAlignment = Element.ALIGN_LEFT;
            _PdfCell.Border = 0;
            _PdfCell.Colspan = 2;
            _table1.AddCell(_PdfCell);
            _table4.CompleteRow();

            _PdfCell = new PdfPCell(new Phrase("\n"));
            _PdfCell.HorizontalAlignment = Element.ALIGN_LEFT;
            _PdfCell.Border = 0;
            _PdfCell.Colspan = 2;
            _table1.AddCell(_PdfCell);
            _table4.CompleteRow();





            _fontStyle = FontFactory.GetFont("Tahoma", 12f, 1);
            _PdfCell = new PdfPCell(new Phrase("Approval: ____________", _fontStyle));
            _PdfCell.Border = 0;
            _PdfCell.HorizontalAlignment = Element.ALIGN_LEFT;
            _table4.AddCell(_PdfCell);

            _fontStyle = FontFactory.GetFont("Tahoma", 12f, 1);
            _PdfCell = new PdfPCell(new Phrase("Posted: _____________", _fontStyle));
            //_PdfCell.Colspan = 2;
            // _PdfCell.Width = 2;
            _PdfCell.HorizontalAlignment = Element.ALIGN_CENTER;
            _PdfCell.Border = 0;
            _table4.AddCell(_PdfCell);

            _PdfCell = new PdfPCell(new Phrase("Received: _____________", _fontStyle));
            _PdfCell.HorizontalAlignment = Element.ALIGN_RIGHT;
            _PdfCell.Border = 0;
            //_PdfCell.Width = 2;
            _table4.AddCell(_PdfCell);
            _table4.CompleteRow();


            _PdfCell = new PdfPCell(new Phrase("\n", _fontStyle));
            _PdfCell.HorizontalAlignment = Element.ALIGN_LEFT;
            _PdfCell.Border = 0;
            _PdfCell.Colspan = 3;
            //_PdfCell.Width = 2;
            _table4.AddCell(_PdfCell);
            _table4.CompleteRow();


            _PdfCell = new PdfPCell(new Phrase("\n", _fontStyle));
            _PdfCell.HorizontalAlignment = Element.ALIGN_LEFT;
            _PdfCell.Border = 0;
            _PdfCell.Colspan = 3;
            //_PdfCell.Width = 2;
            _table4.AddCell(_PdfCell);
            _table4.CompleteRow();


            //-------------//




            //-------------//

            //_fontStyle = FontFactory.GetFont("Tahoma", 12f, 1);
            //_PdfCell = new PdfPCell(new Phrase("", _fontStyle));
            //_PdfCell.Border = 0;
            //_PdfCell.HorizontalAlignment = Element.ALIGN_RIGHT;
            //_table2.AddCell(_PdfCell);

            //_fontStyle = FontFactory.GetFont("Tahoma", 12f, 1);
            //_PdfCell = new PdfPCell(new Phrase("Signature : ", _fontStyle));
            ////_PdfCell.Colspan = 2;
            //// _PdfCell.Width = 2;
            //_PdfCell.HorizontalAlignment = Element.ALIGN_LEFT;
            //_PdfCell.Border = 0;
            //_table2.AddCell(_PdfCell);

            //_PdfCell = new PdfPCell(new Phrase("________________", _fontStyle));
            //_PdfCell.HorizontalAlignment = Element.ALIGN_LEFT;
            //_PdfCell.Border = 0;
            ////_PdfCell.Width = 2;
            //_table2.AddCell(_PdfCell);
            //_table2.CompleteRow();

            //-------------//
        }

    }
}