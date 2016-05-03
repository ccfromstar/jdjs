using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace JDJS.Web
{
    public partial class WebForm1 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
        }

        //转换office到swf
        protected void Button1_Click(object sender, EventArgs e)
        {
            bool isconvert = ConvertPdfToSwf("officeroot\\a.doc", "swfroot\\a1.swf");
        }

        /// <summary>
        /// 文档转swf
        /// </summary>
        /// <param name="inFilename"></param>
        /// <param name="swfFilename"></param>
        public bool ConvertPdfToSwf(string inFilename, string swfFilename)
        {
            bool isStart;
            try
            {
                string flashPrinter = string.Concat(AppDomain.CurrentDomain.BaseDirectory, "flashpaper\\FlashPrinter.exe");//FlashPrinter.exe  
                System.Diagnostics.ProcessStartInfo startInfo = new System.Diagnostics.ProcessStartInfo(flashPrinter);
                startInfo.Arguments = string.Concat(Server.MapPath(inFilename), " -o ", Server.MapPath(swfFilename));
                System.Diagnostics.Process process = new System.Diagnostics.Process();
                process.StartInfo = startInfo;
                isStart = process.Start();
                process.WaitForExit();
                process.Close();
            }
            catch (Exception ex)
            {
                throw ex;
            }
            return isStart;
        }

    }
}