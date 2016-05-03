using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using PageControl;
namespace JDJS.Web
{
    public partial class ProjectList : PageBase
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
                if (!LTP.Common.UserInfo.IsLogin())
                {
                    Session["FromPage"] = HttpContext.Current.Request.Url.PathAndQuery;
                    Response.Redirect("Login.aspx");
                }
                else
                {
                    Session["FromPage"] = null;
                    Seach();
                }
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
            ImgBg.ImageUrl = "style/images/Project-md1.gif";
            JDJS.BLL.Trade_invite bll = new JDJS.BLL.Trade_invite();
            Pager.PageSize = 24;
            Pager.RecordCount = bll.GetCount("1=1" + strwhere);//.Tables[0].Rows.Count;
            RepInfo.DataSource = bll.GetList(Pager.PageSize, Pager.PageIndex, "1=1"+strwhere, "发布日期", 1);
            RepInfo.DataBind();
            ddlClass.DataSource = bll.GetSql("SELECT 类型 FROM Trade_invite GROUP BY 类型");
            ddlClass.DataValueField = "类型";
            ddlClass.DataTextField = "类型";
            ddlClass.DataBind();
            ddlClass.Items.Insert(0, "全部信息");
        }
        private void BindInfo2(string strwhere)
        {
            ImgBg.ImageUrl = "style/images/Project-md2.gif";
            JDJS.BLL.Trade_result bll = new JDJS.BLL.Trade_result();
            Pager.PageSize = 24;
            Pager.RecordCount = bll.GetCount("1=1" + strwhere);//.Tables[0].Rows.Count;
            RepInfo.DataSource = bll.GetList(Pager.PageSize, Pager.PageIndex, "1=1" + strwhere, "发布日期", 1);
            RepInfo.DataBind();
            ddlClass.DataSource = bll.GetSql("SELECT 类型 FROM Trade_result GROUP BY 类型");
            ddlClass.DataValueField = "类型";
            ddlClass.DataTextField = "类型";
            ddlClass.DataBind();
            ddlClass.Items.Insert(0, "全部信息");
        }
        protected void btnSeach_Click(object sender, EventArgs e)
        {
            string SeachTo = "ProjectList.aspx?Part=" + Part;
            if (!string.IsNullOrEmpty(ddlClass.SelectedValue))
            {
                SeachTo += "&Type=" + LTP.Common.StringPlus.htmlstr(ddlClass.SelectedValue);
            }
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
            string Type = "";
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
            if (!string.IsNullOrEmpty(Request.QueryString["Type"]))
            {
                Type = LTP.Common.StringPlus.htmlstr(Request.QueryString["Type"]);
            }
            string strwhere = " and 项目名称 like '%" + KeyWord + "%' ";
            if (!string.IsNullOrEmpty(Begin))
            {
                strwhere += " and 发布日期>'" + Begin + "' ";
            }
            if (!string.IsNullOrEmpty(End))
            {
                strwhere += " and 发布日期<'" + End + "' ";
            }
            if (!string.IsNullOrEmpty(Type) && Type != "全部信息")
            {
                strwhere += " and 类型='" + Type + "' ";
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
