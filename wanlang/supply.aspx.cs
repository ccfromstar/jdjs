using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Xml;

namespace JDJS.Web.wanlang
{
    public partial class supply : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            
            string midcode = "";
            string cidcode=XMLOperate("dsFile.xml", "dscider");
            string keyword = "";
            string orderfl = "";
            int desc;
            if (!string.IsNullOrEmpty(Request.QueryString["mid"]))
            {
                midcode = LTP.Common.StringPlus.htmlstr(Request.QueryString["mid"].ToString());
            }
            if (!string.IsNullOrEmpty(Request.QueryString["keyword"]))
            {
                keyword = LTP.Common.StringPlus.htmlstr(Request.QueryString["keyword"].ToString());
            }
            if (!string.IsNullOrEmpty(Request.QueryString["orderfl"]))
            {
                orderfl = LTP.Common.StringPlus.htmlstr(Request.QueryString["orderfl"].ToString());
            }
            else
            {
                orderfl = "id";
            }
            if (!string.IsNullOrEmpty(Request.QueryString["desc"]))
            {
                desc = Convert.ToInt32(LTP.Common.StringPlus.htmlstr(Request.QueryString["desc"].ToString()));
            }
            else
            {
                desc = 1;
            }
            if (!IsPostBack)
            {
                BindInfo(cidcode, midcode, keyword, orderfl, desc);
            }
        }
       

        private void BindInfo(string cid, string mid,string keyword ,string orderf,int desc)
        {
            string strwhere = " 1=1 ";
            JDJS.BLL.mat_tree_View bll = new JDJS.BLL.mat_tree_View();
            if (!string.IsNullOrEmpty(cid))
            {
                cid = " and cid='" + cid + "'";
            }
            if (!string.IsNullOrEmpty(mid))
            {
                mid = " and mid like '%" + mid + "%'";
            }
            if (!string.IsNullOrEmpty(keyword))
            {
                keyword = " and zname like '%" + keyword + "%'";
            }

            if (string.IsNullOrEmpty(orderf))
            {
                orderf = "id";
            }
            strwhere = strwhere + cid + mid + keyword+" and dsflag=1";
            Pager.PageSize = 10;
            Pager.RecordCount = bll.GetCount(strwhere);//.Tables[0].Rows.Count
            matspecial.DataSource = bll.GetdsList(Pager.PageSize, Pager.PageIndex, strwhere, orderf, desc);
            matspecial.DataBind();

            //matitem.DataSource = bll.GetAllList();
            //matitem.DataBind();
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
        public string Getpic(string pic)
        {
            if (string.IsNullOrEmpty(pic))
            {
                pic = "../../uploads/nullpic.jpg";
            }
            return pic;
        }
        public string NewStr(string dt)
        {
            try
            {
                //DateTime newdt = DateTime.Parse(dt);
                string riqi = Convert.ToDateTime(dt).ToShortDateString();
                return riqi;
            }
            catch
            {
                return "";
            }
        }

        public string Geturl(string order,int desc)
        {
            string url="./supply.aspx?";
            string midcode = "";
            //string cidcode = XMLOperate("dsFile.xml", "dscider");
            if (!string.IsNullOrEmpty(Request.QueryString["mid"]))
            {
                midcode = LTP.Common.StringPlus.htmlstr(Request.QueryString["mid"].ToString());
            }
            url = url + "mid=" + midcode + "&orderfl=" + order + "&desc=" + desc.ToString();
            return url;
        }
       
    }
}