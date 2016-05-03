using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using PageControl;
namespace JDJS.Web
{
    public partial class PolicyList : PageBase
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
                    BindInfo1(strwhere);
                    break;
                case "2":
                    BindInfo2(strwhere);
                    break;
                default:
                    break;
            }
        }
        private void BindInfo1(string strwhere)
        {
            ImgBg.ImageUrl = "style/images/Policy-md1.gif";
            JDJS.BLL.zcfg bll = new JDJS.BLL.zcfg();
            Pager.PageSize = 24;
            Pager.RecordCount = bll.GetCount(" sort in('法律','行政部门','部门规章','地方性法规和规章','各类文件') " + strwhere);//.Tables[0].Rows.Count;
            RepInfo.DataSource = bll.GetList(Pager.PageSize, Pager.PageIndex, " sort in('法律','行政部门','部门规章','地方性法规和规章','各类文件') " + strwhere, "ptime", 1);
            RepInfo.DataBind();
        }
        private void BindInfo2(string strwhere)
        {
            ImgBg.ImageUrl = "style/images/Policy-md2.gif";
            JDJS.BLL.zcfg bll = new JDJS.BLL.zcfg();
            Pager.PageSize = 24;
            Pager.RecordCount = bll.GetCount(" sort in ('最新公告','通知提示','诚信手册','安全生产许可证') " + strwhere);//.Tables[0].Rows.Count;
            RepInfo.DataSource = bll.GetList(Pager.PageSize, Pager.PageIndex, " sort in ('最新公告','通知提示','诚信手册','安全生产许可证') " + strwhere, "ptime", 1);
            RepInfo.DataBind();
        }
        protected void btnSeach_Click(object sender, EventArgs e)
        {
            string SeachTo = "PolicyList.aspx?Part=" + Part;
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
