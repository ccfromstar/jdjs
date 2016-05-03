using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Xml;

namespace JDJS.Web.yejia
{
    public partial class companyRyzz : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                string cid;
                cid = XMLOperate("dsFile.xml", "dscider");
                GetTheCompanyRY(cid);
                GetTheCompanyZZ(cid);
                GetTheCompanyAL(cid);
            }
        }
        public string GetTheCompanyRY(string cid)
        {

            string strwhere = " cid='" + cid + "' and retype='企业荣誉'";
            JDJS.BLL.dsrecord bll = new JDJS.BLL.dsrecord();
            CmpRY.DataSource = bll.GetList(strwhere);
            CmpRY.DataBind();
            //JDJS.Model.dsrecord model = bll1.GetList(strwhere);


            return "";
        }

        public string GetTheCompanyZZ(string cid)
        {

            string strwhere = " cid='" + cid + "' and retype='企业资质'";
            JDJS.BLL.dsrecord bll = new JDJS.BLL.dsrecord();
            CmpZZ.DataSource = bll.GetList(strwhere);
            CmpZZ.DataBind();
            //JDJS.Model.dsrecord model = bll1.GetList(strwhere);


            return "";
        }

        public string GetTheCompanyAL(string cid)
        {

            string strwhere = " cid='" + cid + "' and retype='工程案例'";
            JDJS.BLL.dsrecord bll = new JDJS.BLL.dsrecord();
            CmpAL.DataSource = bll.GetList(strwhere);
            CmpAL.DataBind();
            //JDJS.Model.dsrecord model = bll1.GetList(strwhere);


            return "";
        }

        public string XMLOperate(string xmlFileName, string nodeRootsName)
        {
            string cidcode = "";

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