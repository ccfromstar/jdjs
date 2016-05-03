using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace JDJS.Web.ProjectGL
{
    public partial class WordToHtml : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["AdminInfo"] != null)
            {
            }
            else
            {
                Response.Redirect("Login.aspx");
            }
        }
        #region 上传文件并转换为html wordToHtml(wordFilePath)
        /// 
        /// 上传文件并转存为html
        /// 
        /// word文档在客户机的位置
        /// 上传的html文件的地址
        public string wordToHtml(System.Web.UI.HtmlControls.HtmlInputFile wordFilePath)
        {
            Microsoft.Office.Interop.Word.ApplicationClass word = new Microsoft.Office.Interop.Word.ApplicationClass();
            Type wordType = word.GetType();
            Microsoft.Office.Interop.Word.Documents docs = word.Documents;

            // 打开文件
            Type docsType = docs.GetType();

            string filename = System.DateTime.Now.Year.ToString() + System.DateTime.Now.Month.ToString() + System.DateTime.Now.Day.ToString() +
            System.DateTime.Now.Hour.ToString() + System.DateTime.Now.Minute.ToString() + System.DateTime.Now.Second.ToString(); ;

            //应当先把文件上传至服务器然后再解析文件为html
            string filePath = uploadWord(wordFilePath, filename);

            //判断是否上传文件成功
            if (filePath == "0")
                return "0";
            //判断是否为word文件
            if (filePath == "1")
                return "1";

            object fileName = filePath;

            Microsoft.Office.Interop.Word.Document doc = (Microsoft.Office.Interop.Word.Document)docsType.InvokeMember("Open",
            System.Reflection.BindingFlags.InvokeMethod, null, docs, new Object[] { fileName, true, true });

            // 转换格式，另存为html
            Type docType = doc.GetType();


            //被转换的html文档保存的位置
            string ConfigPath = HttpContext.Current.Server.MapPath("/html/" + filename + ".html");
            object saveFileName = ConfigPath;

            /*下面是Microsoft Word 9 Object Library的写法，如果是10，可能写成：
            * docType.InvokeMember("SaveAs", System.Reflection.BindingFlags.InvokeMethod,
            * null, doc, new object[]{saveFileName, Word.WdSaveFormat.wdFormatFilteredHTML});
            * 其它格式：
            * wdFormatHTML
            * wdFormatDocument
            * wdFormatDOSText
            * wdFormatDOSTextLineBreaks
            * wdFormatEncodedText
            * wdFormatRTF
            * wdFormatTemplate
            * wdFormatText
            * wdFormatTextLineBreaks
            * wdFormatUnicodeText
            */
            docType.InvokeMember("SaveAs", System.Reflection.BindingFlags.InvokeMethod,
            null, doc, new object[] { saveFileName, Microsoft.Office.Interop.Word.WdSaveFormat.wdFormatFilteredHTML });

            // 退出 Word
            wordType.InvokeMember("Quit", System.Reflection.BindingFlags.InvokeMethod, null, word, null);
            //转到新生成的页面
            return filename;
        }
        #endregion

        public string uploadWord(System.Web.UI.HtmlControls.HtmlInputFile uploadFiles, string newName)
        {
            if (uploadFiles.PostedFile != null)
            {
                string fileName = uploadFiles.PostedFile.FileName;
                int extendNameIndex = fileName.LastIndexOf(".");
                string extendName = fileName.Substring(extendNameIndex);

                try
                {
                    //验证是否为word格式
                    if (extendName == ".doc")
                    {
                        //上传路径 指当前上传页面的同一级的目录下面的wordTmp路径
                        uploadFiles.PostedFile.SaveAs(System.Web.HttpContext.Current.Server.MapPath("/files/" + newName + extendName));
                    }
                    else
                    {
                        return "1";
                    }
                }
                catch
                {
                    return "0";
                }
                //return "http://" + HttpContext.Current.Request.Url.Host + HttpContext.Current.Request.ApplicationPath + "/wordTmp/" + newName + extendName;
                return System.Web.HttpContext.Current.Server.MapPath("/files/" + newName + extendName);
            }

            else
            {
                return "0";
            }
        }

        protected void btnUpload_Click(object sender, EventArgs e)
        {

            try
            {
                //转换
                wordToHtml(File1);
            }
            catch
            {
            }
            finally
            {
                Response.Write(Server.MapPath("/html"));
            }
        }
    }
}