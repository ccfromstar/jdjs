using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using PageControl;
namespace JDJS.Web
{
    public partial class SupplyList : PageBase
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
                case "1":
                    if (!LTP.Common.UserInfo.IsLogin())
                    {
                        Session["FromPage"] = HttpContext.Current.Request.Url.PathAndQuery;
                        Response.Redirect("Login.aspx");
                    }
                    else
                    {
                        Session["FromPage"] = null;
                        BindInfo1(strwhere);
                    }
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
            ImgBg.ImageUrl = "style/images/Supply-md1.gif";
            JDJS.BLL.Mat_Trade_Info bll = new JDJS.BLL.Mat_Trade_Info();
            Pager.PageSize = 24;
            Pager.RecordCount = bll.GetCount("infotype=0 and showflag=1" + strwhere);//.Tables[0].Rows.Count;
            RepInfo.DataSource = bll.GetList(Pager.PageSize, Pager.PageIndex, "infotype=0 and showflag=1" + strwhere, "ptime", 1);
            RepInfo.DataBind();
        }
        private void BindInfo2(string strwhere)
        {
            ImgBg.ImageUrl = "style/images/Supply-md2.gif";
            JDJS.BLL.Mat_Trade_Info bll = new JDJS.BLL.Mat_Trade_Info();
            Pager.PageSize = 24;
            Pager.RecordCount = bll.GetCount("infotype=1 and showflag=1" + strwhere);//.Tables[0].Rows.Count;
            RepInfo.DataSource = bll.GetList(Pager.PageSize, Pager.PageIndex, "infotype=1 and showflag=1" + strwhere, "ptime", 1);
            RepInfo.DataBind();
        }
        protected void btnSeach_Click(object sender, EventArgs e)
        {
            string SeachTo = "SupplyList.aspx?Part=" + Part;
            if (!string.IsNullOrEmpty(ddlClass.SelectedValue))
            {
                SeachTo += "&Type=" + LTP.Common.StringPlus.htmlstr(ddlClass.SelectedValue);
            }
            if (!string.IsNullOrEmpty(txtCid.Text.Trim()))
            {
                SeachTo += "&Cid=" + LTP.Common.StringPlus.htmlstr(txtCid.Text.Trim());
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
        protected void btnMy_Click(object sender, EventArgs e)
        {
            string newcode = "";
            JDJS.Model.cust_base_info model = (JDJS.Model.cust_base_info)Session["User"];
            newcode = model.newcode;
            string SeachTo = "SupplyList.aspx?Part=" + Request.QueryString["Part"];
            if (!string.IsNullOrEmpty(ddlClass.SelectedValue))
            {
                SeachTo += "&Type=" + LTP.Common.StringPlus.htmlstr(ddlClass.SelectedValue);
            }
            if (!string.IsNullOrEmpty(txtCid.Text.Trim()))
            {
                SeachTo += "&Cid=" + LTP.Common.StringPlus.htmlstr(txtCid.Text.Trim());
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
            if (!string.IsNullOrEmpty(newcode))
            {
                SeachTo += "&newcode=" + LTP.Common.StringPlus.htmlstr(newcode);
            }
            Response.Redirect(SeachTo);

        }
        private void Seach()
        {
            string KeyWord = "";
            string Cid = "";
            string Begin = "";
            string End = "";
            string Type = "";
            string newcode = "";
            if (!string.IsNullOrEmpty(Request.QueryString["KeyWord"]))
            {
                KeyWord = LTP.Common.StringPlus.htmlstr(Request.QueryString["KeyWord"]);
            }
            if (!string.IsNullOrEmpty(Request.QueryString["Cid"]))
            {
                Cid = LTP.Common.StringPlus.htmlstr(Request.QueryString["Cid"]);
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
            if (!string.IsNullOrEmpty(Request.QueryString["newcode"]))
            {
                newcode = LTP.Common.StringPlus.htmlstr(Request.QueryString["newcode"]);
                newcode = " and newcode='" + newcode + "' ";
            }
            string strwhere = "";
            strwhere += newcode;
            strwhere += " and title like '%" + KeyWord + "%' and mname like '%" + Cid + "%' ";
            if (!string.IsNullOrEmpty(Begin))
            {
                strwhere += " and ptime>'" + Begin + "' ";
            }
            if (!string.IsNullOrEmpty(End))
            {
                strwhere += " and ptime<'" + End + "' ";
            }
            if (!string.IsNullOrEmpty(Type) && Type != "全部")
            {
                strwhere += " and mtype=" + Type;
            }
            BindInfo(Part, strwhere);
        }
        protected void btnAdd_Click(object sender, EventArgs e)
        {
            string Part = Request.QueryString["Part"];
            Response.Redirect("SupplyAdd.aspx?Part=" + Part);
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
