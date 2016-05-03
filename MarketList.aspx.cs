using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Web.UI;
using System.Web.UI.WebControls;
using Microsoft.Web.UI.WebControls;
using PageControl;
namespace JDJS.Web
{
    public partial class MarketList : PageBase
    {
        public string Part
        {
             get
             {
                 if (!string.IsNullOrEmpty(Request.QueryString["Part"]))
                 {
                     return Request.QueryString["Part"];
                 }
                 else
                 {
                     return "";
                 }
             }
        }
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                Seach();
            }
        }
        private void BindInfo(string Part,string strwhere)
        {
            switch (Part)
            {
                case "1":
                    BindInfo1(Part);
                    break;
                case "2":
                    BindInfo2(Part);
                    break;
                case "3":
                    BindInfo3();
                    break;
                case "4":
                    BindInfo4(strwhere);
                    break;
                default:
                    break;
            }

        }
        private void BindInfo1(string Part)
        {
            ImgBg.ImageUrl = "style/images/Market-md1.gif";
            Response.Redirect("MarketPrice.aspx?Part=" + Part);

        }
        private void BindInfo2(string Part)
        {
            ImgBg.ImageUrl = "style/images/Market-md2.gif";
            Response.Redirect("MarketPrice.aspx?Part=" + Part);
          
        }
        private void BindInfo3()
        {
            ImgBg.ImageUrl = "style/images/Market-md3.gif";
        }
        private void BindInfo4(string strwhere)
        {
            ImgBg.ImageUrl = "style/images/Market-md4.gif";
            JDJS.BLL.CustBase_DcustWebShow_View bll = new JDJS.BLL.CustBase_DcustWebShow_View();
            Pager.PageSize = 44;
            Pager.RecordCount = bll.GetCount("cflag=0" + strwhere);//.Tables[0].Rows.Count;
            RepInfo.DataSource = bll.GetList(Pager.PageSize, Pager.PageIndex, "cflag=0" + strwhere, "newcode", 1);
            RepInfo.DataBind();
        }
        public string GetStyle(string webshow)
        {
            if (webshow == "3")
            {
                return " color:red; ";
            }
            else
            {
                return "";
            }
        }
        public string GetStyle1(string webshow)
        {
            if (webshow == "3")
            {
                return "【含报价】";
            }
            else
            {
                return "";
            }
        }
        public string GetSubString(string code)
        {
            if (code.Length > 6)
            {
                return code.Substring((code.Length-6),6);
            }
            else
            {
                return code;
            }
        }
        protected void btnSeach_Click(object sender, EventArgs e)
        {
            string SeachTo = "MarketList.aspx?Part=" + Part;
            if (!string.IsNullOrEmpty(txtTitle.Text.Trim()))
            {
                SeachTo += "&KeyWord=" + LTP.Common.StringPlus.htmlstr(txtTitle.Text.Trim());
            }
            if (!string.IsNullOrEmpty(txtCode.Text.Trim()))
            {
                SeachTo += "&Code=" + LTP.Common.StringPlus.htmlstr(txtCode.Text.Trim());
            }
            Response.Redirect(SeachTo);
        }
        private void Seach()
        {
            string KeyWord = "";
            string Code = "";
           
            if (!string.IsNullOrEmpty(Request.QueryString["KeyWord"]))
            {
                KeyWord = LTP.Common.StringPlus.htmlstr(Request.QueryString["KeyWord"]);
            }
            if (!string.IsNullOrEmpty(Request.QueryString["Code"]))
            {
                Code = LTP.Common.StringPlus.htmlstr(Request.QueryString["Code"]);
            }
            string strwhere = " and newcode like '%" + Code + "%' and company like '%" + KeyWord + "%' ";
            BindInfo(Part, strwhere);
        }
    }
}
