using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using PageControl;
using System.Text.RegularExpressions;
using System.Xml;

namespace JDJS.Web.hongsheng.dsControls
{
    public partial class dsMatTree : System.Web.UI.UserControl
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                Bind_Tv(exe_Table(XMLOperate("dsFile.xml", "dscider")), TreeView1.Nodes, null, "itemcode", "specialCode", "name", "itemname");
            }
        }
        #region 绑定TreeView
       
      

        /// <summary>
        /// 绑定TreeView（利用TreeNodeCollection）
        /// </summary>
        /// <param name="tnc">TreeNodeCollection（TreeView的节点集合）</param>
        /// <param name="pid_val">父id的值</param>
        /// <param name="id">数据库 id 字段名</param>
        /// <param name="pid">数据库 父id 字段名</param>
        /// <param name="text">数据库 文本 字段值</param>
        private void Bind_Tv(DataTable dt, TreeNodeCollection tnc, string pid_val, string itemcode, string specialCode, string name, string itemname)
        {
            int rowcnt,i,j;
           
            DataView dv = new DataView(dt);//将DataTable存到DataView中，以便于筛选数据
        
            rowcnt = dt.Rows.Count;
            for (i = 0; i < rowcnt; i++)
            {
                TreeNode tn,sectn;
                
                if (string.IsNullOrEmpty(pid_val))
                {
                    tn = new TreeNode();//建立一个新节点（学名叫：一个实例）
                    tn.Value = dt.Rows[i][specialCode].ToString();//节点的Value值，一般为数据库的id值
                    tn.Text = dt.Rows[i][name].ToString();//节点的Text，节点的文本显示
                    tn.NavigateUrl = "../supply.aspx?mid=" + tn.Value;
                    tnc.Add(tn);//将该节点加入到TreeNodeCollection（节点集合）中
                    
                    //string filter = string.Format(specialCode + "='{0}'", dt.Rows[i][specialCode].ToString());
                    //dv.RowFilter = filter;//利用DataView将数据进行筛选，选出相同 父id值 的数据
                    for (j = 0; j < rowcnt; j++)
                    {
                        if (dt.Rows[j][specialCode].ToString() == dt.Rows[i][specialCode].ToString())
                        {
                            sectn = new TreeNode();
                            sectn.Value = dt.Rows[j][itemcode].ToString();//节点Value值
                            sectn.Text = dt.Rows[j][itemname].ToString();//节点Text值
                            sectn.NavigateUrl = "../supply.aspx?mid=" + sectn.Value;
                            tn.ChildNodes.Add(sectn);//该节点加入到上级节点中
                        }
                    }
                   
                    
                    pid_val = pid_val + ";" + tn.Value;
                }
                else 
                {
                    if (pid_val.IndexOf(dt.Rows[i][specialCode].ToString()) < 0)
                    {
                        tn = new TreeNode();//建立一个新节点（学名叫：一个实例）
                        tn.Value = dt.Rows[i][specialCode].ToString();//节点的Value值，一般为数据库的id值
                        tn.Text = dt.Rows[i][name].ToString();//节点的Text，节点的文本显示
                        tn.NavigateUrl = "../supply.aspx?mid=" + tn.Value;
                        tnc.Add(tn);//将该节点加入到TreeNodeCollection（节点集合）中

                        for (j = 0; j < rowcnt; j++)
                        {
                            if (dt.Rows[j][specialCode].ToString() == dt.Rows[i][specialCode].ToString())
                            {
                                sectn = new TreeNode();
                                sectn.Value = dt.Rows[j][itemcode].ToString();//节点Value值
                                sectn.Text = dt.Rows[j][itemname].ToString();//节点Text值
                                sectn.NavigateUrl = "../supply.aspx?mid=" + sectn.Value;
                                tn.ChildNodes.Add(sectn);//该节点加入到上级节点中
                            }
                        }

                        pid_val = pid_val + ";" + tn.Value;
                    }
                    
                }
              
            }
            
        }
        #endregion
        /// <summary>
        /// 取出数据库中数据，生成DataTable
        /// </summary>
        /// <param name="str_Con">数据库连接</param>
        /// <param name="str_Cmd">sql语句</param>
        /// <returns></returns>
        private DataTable exe_Table(string wherecid)
        {
            string strwhere=" cid='"+wherecid+"'";
            DataSet ds = new DataSet();
            JDJS.BLL.mat_tree_View bll = new JDJS.BLL.mat_tree_View();
            ds = bll.GettreeList(strwhere); 
          
            return ds.Tables[0];
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