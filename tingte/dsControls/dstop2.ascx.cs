using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Xml;

namespace JDJS.Web.tingte.dsControls
{
    public partial class dstop2 : System.Web.UI.UserControl
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            
        }
        public string NewStr(string cid )
        {
            string PicURL;
            //JDJS.Web.dsMasterPage master = dsMasterPage();
            

            try
            {
                JDJS.BLL.ds_data bll = new JDJS.BLL.ds_data();
                //JDJS.Model.ds_data model = bll.GetModel(cid);
                JDJS.Model.ds_data model = bll.GetModel(XMLOperate("dsFile.xml", "dscider"));
                
                PicURL = model.TopPicUrl;

                if (!string.IsNullOrEmpty(PicURL))
                {
                    return PicURL;
                }
                else
                {
                    return "";
                }
            }
            catch
            {
                return "";
            }
        }

        public string XMLOperate(string xmlFileName, string nodeRootsName)
        {
            string cidcode="";
 
            #region  文件读取,并看文件是否符合要求
            System.Xml.XmlDocument doc = new System.Xml.XmlDocument();
            try
            {
                //doc.Load(xmlFileName);
                doc.Load(Server.MapPath(@"./" + xmlFileName));
                
            }
            catch (System.Exception e1)
            {
                //this.err = "读取文件失败！\n"+e1.Message; 
                return "读取文件失败！";
            }

            System.Xml.XmlNodeList nodeRoots = doc.GetElementsByTagName(nodeRootsName);//与之相配的节点数
            if (nodeRoots.Count == 0)
            {
                string sErr = "格式不对，请用标准的格式文件编写!\n";
                //err = sErr;
                return sErr;
            }
            #endregion  文件读取完成

            //System.Xml.XmlNode nodeRoot = nodeRoots[0];//第一级子目录
            //XmlNodeList xnl = doc.SelectSingleNode("dscider").ChildNodes;
            foreach (XmlNode xn in nodeRoots)
            {
                try
                {                  
                    cidcode = xn.InnerText.ToString();
                }
                catch (System.Exception e1)
                {
                    //this.err = "读取文件失败！\n"+e1.Message; 
                    return "读取文件失败！";
                }
              
            }
            
            
            return cidcode;
        }
    }
}