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
    public partial class MarketPrice : PageBase
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
                BindRepGroup();
                Seach();
            }
        }
        private void BindInfo(string strwhere)
        {
            JDJS.BLL.ysprice bll = new JDJS.BLL.ysprice();
            Pager.PageSize = 24;
            Pager.RecordCount = bll.GetCount(" 1=1 " + strwhere);//.Tables[0].Rows.Count;
            RepSeach.DataSource = bll.GetList(Pager.PageSize, Pager.PageIndex, " 1=1 " + strwhere, "id", 1);
            RepSeach.DataBind();
        }
        private string GetCode(string Code)
        {
            if (!string.IsNullOrEmpty(Code))
            {

                JDJS.BLL.ys_item bll = new JDJS.BLL.ys_item();
                JDJS.Model.ys_item model = bll.GetModel(Code);
                if (!string.IsNullOrEmpty(model.itemcode))
                {
                    return model.itemcode;
                }
                else
                {
                    return "";
                }
            }
            else
            {
                return "";
            }
        }
        private void BindRepGroup()
        {
            JDJS.BLL.ys_group bll = new JDJS.BLL.ys_group();
            RepGroups.DataSource = bll.GetAllList();
            RepGroups.DataBind();
        }
        protected void RepGroups_ItemDataBound(object sender, RepeaterItemEventArgs e)
        {
             if (e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem)
             {
                 string preid = ((DataRowView)e.Item.DataItem).Row["groupcode"].ToString();//获得对应ID
                 Repeater topBtnS = (Repeater)e.Item.FindControl("RepSpecials");
                 if (topBtnS != null)
                 {
                     JDJS.BLL.ys_special bll = new JDJS.BLL.ys_special();
                     topBtnS.DataSource = bll.GetList("groupCode='" + preid + "'");
                     topBtnS.DataBind();
                 }
             }
        }
        protected void RepSpecials_ItemDataBound(object sender, RepeaterItemEventArgs e)
        {
            if (e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem)
            {
                string preid = ((DataRowView)e.Item.DataItem).Row["specialCode"].ToString();//获得对应ID
                Repeater topBtnS = (Repeater)e.Item.FindControl("RepItems");
                if (topBtnS != null)
                {
                    JDJS.BLL.ys_item bll = new JDJS.BLL.ys_item();
                    topBtnS.DataSource = bll.GetList("specialCode='" + preid + "'");
                    topBtnS.DataBind();
                }
            }
        }
        protected void btnSeach_Click(object sender, EventArgs e)
        {
            string SeachTo = "MarketPrice.aspx?Part=" + Part;
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
            if (!string.IsNullOrEmpty(txtItem.Text.Trim()))
            {
                SeachTo += "&Code=" + LTP.Common.StringPlus.htmlstr(txtItem.Text.Trim());
            }
            Response.Redirect(SeachTo);
        }
        private void Seach()
        {
            string KeyWord = "";
            string Begin = "";
            string End = "";
            string Code = "";

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
            if (!string.IsNullOrEmpty(Request.QueryString["Code"]))
            {
                Code = LTP.Common.StringPlus.htmlstr(Request.QueryString["Code"]);
            }
            string strwhere = " and name like '%" + KeyWord + "%' ";
            if (!string.IsNullOrEmpty(Begin))
            {
                strwhere += " and date>'" + LTP.Common.StringPlus.htmlstr(Begin) + "' ";
            }
            if (!string.IsNullOrEmpty(End))
            {
                strwhere += " and date<'" + LTP.Common.StringPlus.htmlstr(End) + "' ";
            }
            string NewCode = GetCode(LTP.Common.StringPlus.htmlstr(Code));
            if (!string.IsNullOrEmpty(NewCode))
            {
                strwhere += " and itemCode='" + NewCode + "'";
            }
            BindInfo(strwhere);
        }
    }
}
