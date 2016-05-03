using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace JDJS.Web
{
    public partial class DsCompanySeach : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            string keyword = "";
            if (!string.IsNullOrEmpty(Request.QueryString["keyword"]))
            {
                keyword = LTP.Common.StringPlus.htmlstr(Request.QueryString["keyword"].ToString());
                //keyw.Text = keyword;
            }
            if (!IsPostBack)
            {
                BindInfo(keyword);
                keyw.Text = keyword;
            }
        }
        public string Getpic(string pic)
        {
            if (string.IsNullOrEmpty(pic))
            {
                pic = "../uploads/nullpic.jpg";
            }
            return pic;
        }
        private void BindInfo(string keyword)
        {
            string strwhere = " 1=1 ";
            JDJS.BLL.ds_data bll = new JDJS.BLL.ds_data();
          
            if (!string.IsNullOrEmpty(keyword))
            {
                keyword = " and HtmlTitle like '%" + keyword + "%'";
            }
           
            strwhere = strwhere +  keyword +" and dsflag=0";
            Pager.PageSize = 20;
            Pager.RecordCount = bll.GetCount(strwhere);//.Tables[0].Rows.Count
            matspecial.DataSource = bll.GetList(Pager.PageSize, Pager.PageIndex, strwhere, "id", 1);
            matspecial.DataBind();

            //matitem.DataSource = bll.GetAllList();
            //matitem.DataBind();
        }
        protected void ImageButton1_Click(object sender, ImageClickEventArgs e)
        {
            string SeachTo = "./DsCompanySeach.aspx?1=1";
            if (!string.IsNullOrEmpty(keyw.Text.Trim()))
            {
                SeachTo += "&keyword=" + LTP.Common.StringPlus.htmlstr(keyw.Text.Trim());
            }
            Response.Redirect(SeachTo);
        }

        protected void ImageButton2_Click(object sender, ImageClickEventArgs e)
        {
            Response.Redirect("./DsSupplySeach.aspx");
        }
    }
}