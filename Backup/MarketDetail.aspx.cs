using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using PageControl;
namespace JDJS.Web
{
    public partial class MarketDetail : PageBase
    {
        public string Id = "";
        protected void Page_Load(object sender, EventArgs e)
        {
            
            if (!string.IsNullOrEmpty(Request.QueryString["Id"]))
            {
                Id = Request.QueryString["Id"];
                if (!IsPostBack)
                {
                    BindInfo(Id);
                }

            }
        }
        private void BindInfo(string Id)
        {
            try
            {
                Id = LTP.Common.StringPlus.htmlstr(Id);
                ImgBg.ImageUrl = "style/images/Market-md4.gif";
                JDJS.BLL.material_company bll = new JDJS.BLL.material_company();
                JDJS.Model.material_company model = bll.GetModel(Id);
                JDJS.BLL.CustBase_DcustWebShow_View bll1 = new JDJS.BLL.CustBase_DcustWebShow_View();
                JDJS.Model.CustBase_DcustWebShow_View model1 = bll1.GetModel(Id);
                
                if (model != null)
                {
                    //lbAddress.Text = model.address;
                    //lbPhone.Text = model.tel;
                    //lbMobile.Text = model.handset;
                    //lbFax.Text = model.fax;
                    //lbLxr.Text = model.linkman;
                    //lbYb.Text = model.post;
                    //lbSite.Text = model.url;
                    //lbEmail.Text = model.email;
                    //lbTitle.Text = model.company;
                    
                }
                if (model1 != null && !string.IsNullOrEmpty(model1.content))
                {
                    lbBody.Text = Server.HtmlDecode(model1.content);
                    //lbTitle.Text += GetStyle(model1.webshow.ToString());
                    if (model1.webshow == 3)
                    {
                        Page.Title = model1.company + "-企业之窗-建定建设工程信息网";
                        PalDteail.Visible = true;
                        Pager.Visible = true;
                    }
                }
                else
                {
                    Page.Title = model.company + "-企业之窗-建定建设工程信息网";
                    lbcname.Text = model.company;
                    lbAddress.Text = model.address;
                    lbPhone.Text = model.tel;
                    lbMobile.Text = model.handset;
                    lbFax.Text = model.fax;
                    lbLxr.Text = model.linkman;
                    lbYb.Text = model.post;
                    lbSite.Text = model.url;
                    lbEmail.Text = model.email;
                    PanCp.Visible = true;
                }
                
                JDJS.BLL.v_material_data bll2 = new JDJS.BLL.v_material_data();
                JDJS.Model.v_material_data model2 = new JDJS.Model.v_material_data();
                BindCp(GetlistKey(), "", "cid="+Id);
            }
            catch
            {
            }

        }
        private List<string> GetlistKey()
        {
            List<string> listKey = new List<string>();
            listKey.Add("material");
            listKey.Add("zname");
            listKey.Add("standard");
            listKey.Add("class");
            return listKey;
        }
        private void BindCp(List<string> listKey, string KeyWord, string strwhere)
        {
            JDJS.BLL.v_material_data bll = new JDJS.BLL.v_material_data();
            Pager.PageSize = 10;
            Pager.RecordCount = bll.GetList(listKey, KeyWord, strwhere, "ptime desc").Tables[0].Rows.Count;
            RepSeach.DataSource = bll.GetList(Pager.PageSize, Pager.PageIndex, listKey, KeyWord, strwhere, "ptime desc");
            RepSeach.DataBind();
        }

        protected void btnSeach_Click(object sender, EventArgs e)
        {
            string KeyWord = LTP.Common.StringPlus.htmlstr(txtTitle.Text.Trim());
            string strwhere = "cid=" + Id;
            if (!string.IsNullOrEmpty(txtBg.Text.Trim()))
            {
                strwhere += " and stime>'" + LTP.Common.StringPlus.htmlstr(txtBg.Text.Trim()) + "' ";
            }
            if (!string.IsNullOrEmpty(txtEnd.Text.Trim()))
            {
                strwhere += " and stime<'" + LTP.Common.StringPlus.htmlstr(txtEnd.Text.Trim()) + "' ";
            }
            BindCp(GetlistKey(), KeyWord, strwhere);
        }

        //public string GetStyle(string webshow)
        //{
        //    if (webshow == "3")
        //    {
        //        return "（含报价）";
        //    }
        //    else
        //    {
        //        return "";
        //    }
        //}
    }
}
