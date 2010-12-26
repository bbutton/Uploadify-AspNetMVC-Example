using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace UploadifyTest.Controllers
{
    public class ResourceController : Controller
    {
        
        public ActionResult Upload(HttpPostedFileBase uploadedFile)
        {
            if (uploadedFile.ContentLength == 0) return new EmptyResult();

            string savedFileName = Path.Combine(HttpContext.Server.MapPath("~/Uploads"), uploadedFile.FileName);
            uploadedFile.SaveAs(savedFileName);

            return new EmptyResult();
        }
    }
}
