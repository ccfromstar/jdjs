using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace JDJS.Web
{
    public partial class WXtradeBase : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

            string KeyWord = "";

            string begin = "";
            string end = "";
            if (!string.IsNullOrEmpty(Request.QueryString["KeyWord"]))
            {
                KeyWord = LTP.Common.StringPlus.htmlstr(Request.QueryString["KeyWord"].ToString());
            }

            if (!string.IsNullOrEmpty(Request.QueryString["begin"]))
            {
                begin = Request.QueryString["begin"].ToString();
            }

            if (!string.IsNullOrEmpty(Request.QueryString["end"]))
            {
                end = LTP.Common.StringPlus.htmlstr(Request.QueryString["end"].ToString());
            }
            if (!IsPostBack)
            {
                SeachAll();
            }

        }
      
        private void BindInfo(string KeyWord, string strwhere)
        {
            JDJS.BLL.Trade_invite bll = new JDJS.BLL.Trade_invite();
            Pager.PageSize = 15;
            if (strwhere == "1=1" && string.IsNullOrEmpty(KeyWord))
            {
                Pager.RecordCount = 30;
                RepInfo.DataSource = bll.GetList(Pager.PageSize, Pager.PageIndex, "1=1", "发布日期", 1);
            }
            else
            {

                Pager.RecordCount = bll.GetCount(strwhere);//.Tables[0].Rows.Count
                RepInfo.DataSource = bll.GetList(Pager.PageSize, Pager.PageIndex,strwhere, "发布日期", 1);

            }
            RepInfo.DataBind();
        }

        protected void btnSeach_Click(object sender, EventArgs e)
        {
            string SeachTo = "WXtradeBase.aspx?1=1";
            if (!string.IsNullOrEmpty(txtTitle.Text.Trim()))
            {
                SeachTo += "&KeyWord=" + LTP.Common.StringPlus.htmlstr(txtTitle.Text.Trim());
            }
            if (!string.IsNullOrEmpty(txtBg.Text.Trim()))
            {
                SeachTo += "&Begin=" + LTP.Common.StringPlus.htmlstr(txtBg.Text.Trim());
            }
            if (!string.IsNullOrEmpty(txtEnd.Text.Trim()))
            {
                SeachTo += "&End=" + LTP.Common.StringPlus.htmlstr(txtEnd.Text.Trim());
            }
            Response.Redirect(SeachTo);
        }
        private void SeachAll()
        {
            string KeyWord = "";
          
            string Begin = "";
            string End = "";
          
            if (!string.IsNullOrEmpty(Request.QueryString["KeyWord"]))
            {
                KeyWord = LTP.Common.StringPlus.htmlstr(Request.QueryString["KeyWord"]);
            }
          
            if (!string.IsNullOrEmpty(Request.QueryString["Begin"]))
            {
                Begin = LTP.Common.StringPlus.htmlstr(Request.QueryString["Begin"]);
            }
            if (!string.IsNullOrEmpty(Request.QueryString["End"]))
            {
                End = LTP.Common.StringPlus.htmlstr(Request.QueryString["End"]);
            }
           
            string strwhere = "1=1";

            if (!string.IsNullOrEmpty(KeyWord))
            {
                strwhere += " and 项目名称 like '%" + KeyWord + "%' ";
            }
            if (!string.IsNullOrEmpty(Begin))
            {
                strwhere += " and 发布日期>'" + Begin + "' ";
            }
            if (!string.IsNullOrEmpty(End))
            {
                strwhere += " and 发布日期<'" + End + "' ";
            }
          
            BindInfo(KeyWord, strwhere);
            txtTitle.Text = KeyWord;
           
            txtBg.Text = Begin; txtEnd.Text = End;
        }

    }
}