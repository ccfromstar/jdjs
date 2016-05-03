using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace JDJS.Web
{
    public partial class UserCompany : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                IfLogin();
                //Seach();

            }
        }
        private void IfLogin()
        {
            if (Session["User"] != null)
            {

                JDJS.Model.cust_base_info modelmb = ((JDJS.Model.cust_base_info)Session["User"]);
                JDJS.BLL.member_point bll = new JDJS.BLL.member_point();
                JDJS.Model.member_point modeljf = bll.GetModel(modelmb.newcode);


                Seach(" and newcode like '%" + modelmb.newcode + "%'");
                //BindCompany(" and newcode like '%" + modelmb.newcode + "%'");

            }
            else
            {
                Session["FromPage"] = HttpContext.Current.Request.Url.PathAndQuery;
                Response.Redirect("Login.aspx");
                //BindCompany(" and pcid=-999");

            }

        }

        private void Seach(string newcode )
        {
           

            string KeyWord = "";

            string strwhere = "";

            if (!string.IsNullOrEmpty(Request.QueryString["KeyWord"]))
            {
                KeyWord = LTP.Common.StringPlus.htmlstr(Request.QueryString["KeyWord"]);
                strwhere += " and company like '%" + KeyWord + "%' ";

            }
            else
            {
                // LTP.Common.MessageBox.Show(this.Page, "企业名称关键字不得为空!");
                //string KeyWordNULL = "关键字为空";
                //strwhere += " and company like '%" + KeyWordNULL + "%' ";
                strwhere = "";
                //ImgBg.ImageUrl = "style/images/Project-md5.gif";
            }
            strwhere = strwhere + newcode;

            BindCompany(strwhere);

            txtTitle.Text = KeyWord;
        }
        private void BindCompany(string strwhere)
        {

            Image1.ImageUrl = "style/images/Project-md5.gif";
            JDJS.BLL.TCcompany bll = new JDJS.BLL.TCcompany();
            pagecmp.PageSize = 24;
            pagecmp.RecordCount = bll.GetCount("1=1" + strwhere);
            Repcmp.DataSource = bll.GetList(pagecmp.PageSize, pagecmp.PageIndex, "1=1" + strwhere, "pcid", 1);
            Repcmp.DataBind();

        }

        protected void btnSeach_Click(object sender, EventArgs e)
        {
            string SeachTo = "UserCompany.aspx?";


            if (!string.IsNullOrEmpty(txtTitle.Text.Trim()))
            {
                SeachTo += "KeyWord=" + LTP.Common.StringPlus.htmlstr(txtTitle.Text.Trim());
            }

            Response.Redirect(SeachTo);
        }
    }
}