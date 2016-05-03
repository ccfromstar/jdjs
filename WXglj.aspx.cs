using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace JDJS.Web
{
    public partial class WXglj : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {

                string KeyWord = "";
                if (!string.IsNullOrEmpty(Request.QueryString["KeyWord"]))
                {
                    KeyWord = Request.QueryString["KeyWord"];
                }
                if (!string.IsNullOrEmpty(KeyWord))
                {
                    Seach();
                }

            }
        }
        private void Seach()
        {
            string KeyWord = "";
           

            if (!string.IsNullOrEmpty(Request.QueryString["KeyWord"]))
            {
                KeyWord = LTP.Common.StringPlus.htmlstr(Request.QueryString["KeyWord"]);
            }
          



            string strwhere = "1=1";

            if (!string.IsNullOrEmpty(KeyWord))
            {
                strwhere += " and ysname like '%" + KeyWord + "%' ";
            }

          
            BindGLJInfo(strwhere);

            txtTitle.Text = KeyWord;

          

        }
        private void BindGLJInfo(string strwhere)
        {
            //string strwhere;
            //strwhere = " id in (select pepid from pro_linkman_list where proid =" + proid + ")";
            //JDJS.BLL.TClinkman bll = new JDJS.BLL.TClinkman();
            JDJS.BLL.glj bll = new JDJS.BLL.glj();
            // strwhere = "  proid =" + proid + " and pepid=" + pepid;

            UcfarPager6.PageSize = 10;
            UcfarPager6.RecordCount = bll.GetCount(strwhere);//.Tables[0].Rows.Count;
            Repmatlist.DataSource = bll.GetList(UcfarPager6.PageSize, UcfarPager6.PageIndex, strwhere, "id", 1);

            //Repmatlist.DataSource = bll.GetList(strwhere);
            Repmatlist.DataBind();
        }

        protected void LinkButton2_Click(object sender, EventArgs e)
        {
            string SeachTo = "WXglj.aspx?1=1";

            //ssort.SelectedValue = Request.Form["ssort"].ToString();
            if (!string.IsNullOrEmpty(txtTitle.Text.Trim()))
            {
                SeachTo += "&KeyWord=" + LTP.Common.StringPlus.htmlstr(txtTitle.Text.Trim());
            }
           


            Response.Redirect(SeachTo);
        }
    }
}