using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace JDJS.Web
{
    public partial class GreenChinaList : System.Web.UI.Page
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
        private void BindInfo(string Part, string strwhere)
        {
            switch (Part)
            {
                case "6":
                    BindInfo1(strwhere);
                    break;
                case "7":
                    BindInfo2(strwhere);
                    break;
                case "8":
                    BindInfo3(strwhere);
                    break;
                case "9":
                    BindInfo4(strwhere);
                    break;
                default:
                    break;
            }

        }
        private void BindInfo1(string strwhere)
        {
            ImgBg.ImageUrl = "style/images/应用案例.gif";
            JDJS.BLL.HYDT bll = new JDJS.BLL.HYDT();
            Pager.PageSize = 24;
            Pager.RecordCount = bll.GetCount("type='应用案例' " + strwhere);//.Tables[0].Rows.Count;
            RepInfo.DataSource = bll.GetList(Pager.PageSize, Pager.PageIndex, "type='应用案例' " + strwhere, "ptime", 1);
            RepInfo.DataBind();
        }
        private void BindInfo2(string strwhere)
        {
            //ImgBg.ImageUrl = "style/images/new-md2.gif";
            //JDJS.BLL.new_material bll = new JDJS.BLL.new_material();
            //Pager.PageSize = 24;
            //Pager.RecordCount = bll.GetCount("1=1 " + strwhere);//.Tables[0].Rows.Count;
            //RepInfo.DataSource = bll.GetList(Pager.PageSize, Pager.PageIndex, "1=1 " + strwhere, "ptime", 1);
            //RepInfo.DataBind();
            ImgBg.ImageUrl = "style/images/绿动态.gif";
            JDJS.BLL.HYDT bll = new JDJS.BLL.HYDT();
            Pager.PageSize = 24;
            Pager.RecordCount = bll.GetCount("type='绿动态' " + strwhere);//.Tables[0].Rows.Count;
            RepInfo.DataSource = bll.GetList(Pager.PageSize, Pager.PageIndex, "type='绿动态' " + strwhere, "ptime", 1);
            RepInfo.DataBind();
        }
        private void BindInfo3(string strwhere)
        {
            ImgBg.ImageUrl = "style/images/协会奖项.gif";
            JDJS.BLL.HYDT bll = new JDJS.BLL.HYDT();
            Pager.PageSize = 24;
            Pager.RecordCount = bll.GetCount("type='协会奖项' " + strwhere);//.Tables[0].Rows.Count;
            RepInfo.DataSource = bll.GetList(Pager.PageSize, Pager.PageIndex, "type='协会奖项' " + strwhere, "ptime", 1);
            RepInfo.DataBind();
        }
        private void BindInfo4(string strwhere)
        {
            ImgBg.ImageUrl = "style/images/绿标小贴士.gif";
            JDJS.BLL.HYDT bll = new JDJS.BLL.HYDT();
            Pager.PageSize = 24;
            Pager.RecordCount = bll.GetCount("type='绿标小贴士' " + strwhere);//.Tables[0].Rows.Count;
            RepInfo.DataSource = bll.GetList(Pager.PageSize, Pager.PageIndex, "type='绿标小贴士'", "ptime", 1);
            RepInfo.DataBind();
        }
        protected void btnSeach_Click(object sender, EventArgs e)
        {
            string SeachTo = "GreenChinaList.aspx?Part=" + Part;
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
        private void Seach()
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
            string strwhere = "and title like '%" + KeyWord + "%' ";
            if (!string.IsNullOrEmpty(Begin))
            {
                strwhere += " and ptime>'" + Begin + "' ";
            }
            if (!string.IsNullOrEmpty(End))
            {
                strwhere += " and ptime<'" + End + "' ";
            }
            BindInfo(Part, strwhere);
        }
        public string NewStr(string dt)
        {
            try
            {
                DateTime newdt = DateTime.Parse(dt);
                if (Math.Abs(LTP.Common.TimeParser.DayDiff(DateTime.Now, newdt)) < 7)
                {
                    return "<img src=\"style/icon/New.gif\" />";
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
    }
}