using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Security;

using System.Data.SqlClient;
using System.IO;
using System.Text;
using System.Xml;
using System.Xml.XPath;
using System.Security;
using System.Net;
using System.Collections;
using System.Security.Cryptography;

namespace JDJS.Web
{
    /// <summary>
    /// WXService 的摘要说明
    /// </summary>
    public class WXService : IHttpHandler
    {

        /// <summary>
        /// TOKEN
        /// </summary>
        private const string TOKEN = "finder";
        //private const string TOKEN = "bdjsweixinToken150319";
        /// <summary>
        /// 签名
        /// </summary>
        private const string SIGNATURE = "signature";
        //private const string SIGNATURE =HttpContext.Current.Request.QueryString["signature"];
        /// <summary>
        /// 时间戳
        /// </summary>
        private const string TIMESTAMP = "timestamp";
        //private const string TIMESTAMP = HttpContext.Current.Request.QueryString["timestamp"];
        /// <summary>
        /// 随机数
        /// </summary>
        private const string NONCE = "nonce";
        //private const string NONCE = HttpContext.Current.Request.QueryString["nonce"];
        /// <summary>
        /// 随机字符串
        /// </summary>
        private const string ECHOSTR = "echostr";
        //private const string ECHOSTR = HttpContext.Current.Request.QueryString["echoStr"];
        /// <summary>
        /// 
        /// </summary>
        private HttpRequest Request { get; set; }
        /// <summary>
        /// 构造函数
        /// </summary>
        /// <param name="request"></param>
        /// 
        public void ProcessRequest(HttpContext context)
        {
            //由微信服务接收请求，具体处理请求
            
            Response();
          

        }

        public bool IsReusable
        {
            get
            {
                return false;
            }
        }
   
        public string Response()
        {
            string method = HttpContext.Current.Request.HttpMethod.ToUpper();
            //验证签名
            //string method = Request.HttpMethod.ToUpper();
            //验证签名
            if (method == "GET")
            {
                if (Response2())
                {
                    //return Request.QueryString[ECHOSTR];
                    return HttpContext.Current.Request.QueryString["echoStr"];
                }
                else
                {
                    return "error";
                }
            }

            //处理消息
            if (method == "POST")
            {
                return ResponseMsg();
            }
            else
            {
                return "无法处理";
            }

        
        }
        public bool InterfaceTest()
        {
            string TOKEN = "bdjsweixinToken150319";
            /*if (string.IsNullOrEmpty(TOKEN))
             {
                   return;
              }*/

            string echoString = HttpContext.Current.Request.QueryString["echoStr"];
            string signature = HttpContext.Current.Request.QueryString["signature"];
            string timestamp = HttpContext.Current.Request.QueryString["timestamp"];
            string nonce = HttpContext.Current.Request.QueryString["nonce"];

            List<string> list = new List<string>();
            list.Add(TOKEN);
            list.Add(timestamp);
            list.Add(nonce);
            //排序
            list.Sort();
            //拼串
            string input = string.Empty;
            foreach (var item in list)
            {
                input += item;
            }
            //加密
            //string new_signature = SecurityUtility.SHA1Encrypt(input);
            string new_signature = System.Web.Security.FormsAuthentication.HashPasswordForStoringInConfigFile(input, "SHA1");

            //验证
            if (new_signature == signature)
            {
                return true;
            }
            else
            {
                return false;
            }


            /*if (!string.IsNullOrEmpty(echoString))
            {
               HttpContext.Current.Response.Write(echoString);
               HttpContext.Current.Response.End();
            }*/
        }
      
        public bool Response2()
        {
            string Token = "bdjsweixinToken150319";
            if (string.IsNullOrEmpty(Token))
             {
                   return false;
             }

            string echoString = HttpContext.Current.Request.QueryString["echoStr"];
            string signature = HttpContext.Current.Request.QueryString["signature"];
            string timestamp = HttpContext.Current.Request.QueryString["timestamp"];
            string nonce = HttpContext.Current.Request.QueryString["nonce"];

         
            //加密
            string[] ArrTmp = { Token, timestamp, nonce };
　　　　    Array.Sort(ArrTmp);　　 //字典排序　
　　　　    string tmpStr = string.Join("", ArrTmp);
　　　　    tmpStr = FormsAuthentication.HashPasswordForStoringInConfigFile(tmpStr, "SHA1");
            tmpStr = tmpStr.ToLower();

            //验证
            if (tmpStr == signature)
            {
                HttpContext.Current.Response.Write(echoString);
                HttpContext.Current.Response.End();
                return true;
            }
            else
            {
                return false; 
              
            }

            
        }
        /// <summary>
        /// 处理请求
        /// </summary>
        /// <returns></returns>
        private string ResponseMsg()
        {
            string requestXml = LTP.Common.Common.ReadRequest(this.Request);
            LTP.Common.IHandler handler = LTP.Common.HandlerFactory.CreateHandler(requestXml);
            if (handler != null)
            {
                return handler.HandleRequest();
            }

            return string.Empty;
        }
    }
}