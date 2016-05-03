using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Xml;

namespace JDJS.Web.ProjectGL
{
    public partial class GG : System.Web.UI.Page
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

        protected void btnUpload_Click(object sender, EventArgs e)
        {
            try
            {
                string name = FileUpload1.FileName;
                string type = name.Substring(name.LastIndexOf(".") + 1).ToLower();
                if (type == "jpg" || type == "png" || type == "bmp" || type == "gif" || type == "jpeg")
                {
                    string savename = Guid.NewGuid().ToString() + "." + type;
                    FileUpload1.SaveAs(Server.MapPath("~/uploads/topimg/" + savename));
                    XmlDocument xmlDoc = new XmlDocument();
                    xmlDoc.Load(Server.MapPath("~/xml/viewerData.xml"));
                    XmlNode root = xmlDoc.SelectSingleNode("viewer");//查找<bookstore>
                    if (!string.IsNullOrEmpty(txtSd.Text.Trim()))
                    {
                        XmlElement newxe = (XmlElement)root;
                        newxe.SetAttribute("interval",txtSd.Text.Trim());
                    }
                    XmlElement xe1 = xmlDoc.CreateElement("item");//创建一个<book>节点
                    xe1.SetAttribute("title", txtTitle.Text);//设置该节点genre属性
                    xe1.SetAttribute("img", "uploads/topimg/" + savename);//设置该节点ISBN属性
                    xe1.SetAttribute("url", txtLink.Text);
                    xe1.SetAttribute("target", "_blank");

                    root.AppendChild(xe1);//添加到<bookstore>节点中
                    xmlDoc.Save(Server.MapPath("~/xml/viewerData.xml"));
                    Repeater1.DataBind();
                    LTP.Common.MessageBox.Show(this.Page, "添加成功!");
                }
                else
                {
                    LTP.Common.MessageBox.Show(this.Page, "文件必须是图片类型!");
                }
            }
            catch( Exception ex)
            {
                LTP.Common.MessageBox.Show(this.Page, ex.Message);
            }
        }

        public void Delete(string title)
        {
            XmlDocument xmlDoc = new XmlDocument();
            xmlDoc.Load(Server.MapPath("~/xml/viewerData.xml"));

            XmlNodeList xnl = xmlDoc.SelectSingleNode("viewer").ChildNodes;

            foreach (XmlNode xn in xnl)
            {
                XmlElement xe = (XmlElement)xn;
                if (xe.GetAttribute("title") == title)
                {
                    xe.ParentNode.RemoveChild(xe);
                   // xe.RemoveAll();//删除该节点的全部内容
                }
            }
            xmlDoc.Save(Server.MapPath("~/xml/viewerData.xml"));
            LTP.Common.MessageBox.Show(this.Page, "删除成功!");
        }


        protected void Delete_Click(object sender, EventArgs e)
        {
            LinkButton delbtn = (LinkButton)sender;
            if (delbtn != null && !string.IsNullOrEmpty(delbtn.CommandArgument))
            {
                Delete(delbtn.CommandArgument);
                Repeater1.DataBind();
            }
        }
    }
}