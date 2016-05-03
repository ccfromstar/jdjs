using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Xml;
namespace JDJS.Web.lvjin
{
    public partial class companyInfo : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                string cid;
                cid = XMLOperate("dsFile.xml", "dscider");
                GetTheCompanyRek(cid);
                GetTheCompanyTD(cid);
                GetTheCompanyFM(cid);
            }
        }

        public string GetTheCompanyTD(string cid)
        {

            string strwhere = " cid='" + cid + "' and retype='团队风采'";
            JDJS.BLL.dsrecord bll = new JDJS.BLL.dsrecord();
            CmpTD.DataSource = bll.GetList(strwhere);
            CmpTD.DataBind();
            //JDJS.Model.dsrecord model = bll1.GetList(strwhere);


            return "";
        }

        public string GetTheCompanyFM(string cid)
        {

            string strwhere = " cid='" + cid + "' and retype='企业风貌'";
            JDJS.BLL.dsrecord bll = new JDJS.BLL.dsrecord();
            CmpFM.DataSource = bll.GetList(strwhere);
            CmpFM.DataBind();
            //JDJS.Model.dsrecord model = bll1.GetList(strwhere);


            return "";
        }
        public string GetTheCompanyRek(string cid)
        {

            JDJS.BLL.CustBase_DcustWebShow_View bll1 = new JDJS.BLL.CustBase_DcustWebShow_View();
            JDJS.Model.CustBase_DcustWebShow_View model1 = bll1.GetModel(cid);


            CPBody.Text = Server.HtmlDecode(model1.content);
            return CPBody.Text;
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