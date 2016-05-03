using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace JDJS.Web
{
    public partial class promatindex : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
              
                Seach();
               
            }
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
                Begin = ReplacetimeStr(LTP.Common.StringPlus.htmlstr(Request.QueryString["Begin"]));
            }
            if (!string.IsNullOrEmpty(Request.QueryString["End"]))
            {
                End = ReplacetimeStr(LTP.Common.StringPlus.htmlstr(Request.QueryString["End"]));
            }
         


            string strwhere = "1=1";

            if (!string.IsNullOrEmpty(KeyWord))
            {
                strwhere += " and matname like '%" + KeyWord + "%' ";
            }

            if (!string.IsNullOrEmpty(Begin))
            {
                strwhere += " and ptime>='" + Begin + "' ";
            }
            if (!string.IsNullOrEmpty(End))
            {
                strwhere += " and ptime<='" + End + "' ";
            }
          

            strwhere += " and disflag=0";
            BindpromatInfo(strwhere);

            txtTitle.Text = KeyWord;

           

            txtBg.Text = Begin; txtEnd.Text = End;
           

        }

        private void BindpromatInfo(string strwhere)
        {
            //string strwhere;
            //strwhere = " id in (select pepid from pro_linkman_list where proid =" + proid + ")";
            //JDJS.BLL.TClinkman bll = new JDJS.BLL.TClinkman();
            JDJS.BLL.pro_mat_view bll = new JDJS.BLL.pro_mat_view();
           // strwhere = "  proid =" + proid + " and pepid=" + pepid;

            UcfarPager6.PageSize = 35;
            UcfarPager6.RecordCount = bll.GetCount(strwhere);//.Tables[0].Rows.Count;
            Repmatlist.DataSource = bll.GetList(UcfarPager6.PageSize, UcfarPager6.PageIndex, strwhere, "id", 1);

            //Repmatlist.DataSource = bll.GetList(strwhere);
            Repmatlist.DataBind();
        }
        public string ReplacetimeStr(string timestr)
        {
            try
            {
                DateTime dat = DateTime.Parse(timestr); 
                string str = dat.ToString("yyyy-MM-dd");//这样写就行了。
                //timestr=(Convert.ToDateTime(timestr)).Date.ToString();
                return str;
            }
            catch
            {
                return "";
            }
        }

        protected void LinkButton2_Click(object sender, EventArgs e)
        {
            string SeachTo = "promatindex.aspx?1=1";
          
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
    }
}