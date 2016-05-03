using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace JDJS.Web
{
    public partial class WXContactBase : System.Web.UI.Page
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

            string Company = "";

            string Job = "";


            if (!string.IsNullOrEmpty(Request.QueryString["KeyWord"]))
            {
                KeyWord = LTP.Common.StringPlus.htmlstr(Request.QueryString["KeyWord"]);
            }

            if (!string.IsNullOrEmpty(Request.QueryString["Company"]))
            {
                Company = LTP.Common.StringPlus.htmlstr(Request.QueryString["Company"]);
            }

            if (!string.IsNullOrEmpty(Request.QueryString["Job"]))
            {
                Job = LTP.Common.StringPlus.htmlstr(Request.QueryString["Job"]);
            }





            string strwhere = "1=1";

            if (!string.IsNullOrEmpty(KeyWord))
            {
                strwhere += " and linkman like '%" + KeyWord + "%' ";
            }

            if (!string.IsNullOrEmpty(Company))
            {
                strwhere += " and companyname like '%" + Company + "%' ";
            }

            if (!string.IsNullOrEmpty(Job))
            {
                strwhere += " and job like '%" + Job + "%' ";
            }

           


            BindInfo(strwhere);

            linkmantxt.Text = KeyWord;

            companytxt.Text = Company;

            partjob.Text = Job;


        }
        private void BindInfo(string strwhere)
        {

            JDJS.BLL.TClinkman bll = new JDJS.BLL.TClinkman();
            Pager.PageSize = 15;
            if (strwhere != "1=1")
            {
                Pager.RecordCount = bll.GetCount(strwhere);//.Tables[0].Rows.Count;
                RepInfo.DataSource = bll.GetList(Pager.PageSize, Pager.PageIndex, strwhere, "id", 1);
            }
            else
            {
                Pager.RecordCount = 35;//.Tables[0].Rows.Count;
                //RepInfo.DataSource = bll.GetList(35, strwhere, "id", "Desc");
                RepInfo.DataSource = bll.GetList(Pager.PageSize, Pager.PageIndex, strwhere, "id", 1);
            }

            RepInfo.DataBind();

        }

        protected void btnSeach_Click(object sender, EventArgs e)
        {
            string SeachTo = "WXContactBase.aspx?Part=3";
            if (!string.IsNullOrEmpty(companytxt.Text.Trim()))
            {
                SeachTo += "&Company=" + LTP.Common.StringPlus.htmlstr(companytxt.Text);
            }

            if (!string.IsNullOrEmpty(partjob.Text.Trim()))
            {
                SeachTo += "&Job=" + LTP.Common.StringPlus.htmlstr(partjob.Text); ;
            }

            if (!string.IsNullOrEmpty(linkmantxt.Text.Trim()))
            {
                SeachTo += "&KeyWord=" + LTP.Common.StringPlus.htmlstr(linkmantxt.Text.Trim());
            }


            Response.Redirect(SeachTo);
        }
    }
}