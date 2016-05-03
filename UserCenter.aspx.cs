using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using PageControl;
using System.Text.RegularExpressions;

namespace JDJS.Web
{
    public partial class UserCenter : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            //if (!this.IsPostBack)
            //{
               // clearLogin();
            //}
            IfLogin();
        }
        private void IfLogin()
        {
            if (Session["User"] != null)
            {

                JDJS.Model.cust_base_info modelmb = ((JDJS.Model.cust_base_info)Session["User"]);
                JDJS.BLL.member_point bll = new JDJS.BLL.member_point();
                JDJS.Model.member_point modeljf = bll.GetModel(modelmb.newcode);
                newcode.Text = modelmb.newcode;
                point.Text = modeljf.point.ToString();
                money.Text = modeljf.JDB.ToString();

                //BindProject(" and custreadrec like '%" + modelmb.newcode + "%'");
                //BindCompany(" and newcode like '%" + modelmb.newcode + "%'");

            }
            else
            {
                Session["FromPage"] = HttpContext.Current.Request.Url.PathAndQuery;
                Response.Redirect("Login.aspx");
                //newcode.Text = "您尚未登录！";
                //point.Text = "尚未登录！";
                //money.Text = "尚未登录！";
                //BindProject(" and id=-999");
                //BindCompany(" and pcid=-999");
               
            }

        }

        protected void ImageButton1_Click(object sender, ImageClickEventArgs e)
        {
            Response.Redirect("UserProject.aspx");
        }

        protected void ImageButton2_Click(object sender, ImageClickEventArgs e)
        {
            Response.Redirect("UserCompany.aspx");
        }
        /* private void BindProject(string strwhere)
         {
             ImgBg.ImageUrl = "style/images/Project-md3.gif";
             JDJS.BLL.project_inforbase bll = new JDJS.BLL.project_inforbase();
             Pager.PageSize = 24;
             Pager.RecordCount = bll.GetCount("1=1" + strwhere);
             RepInfo.DataSource = bll.GetList(Pager.PageSize, Pager.PageIndex, "1=1" + strwhere, "id", 1);
             RepInfo.DataBind();
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
         public string ReplaceStr(string content, string regularexpression, string changestring)
         {


             try
             {
                 Regex regex = new Regex(regularexpression);
                 Regex regex2 = new Regex(@"""");
                 string str = regex2.Replace(content, changestring);
                 str = regex.Replace(str, changestring);
                 return str;
             }
             catch
             {


                 return content;
             }

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
         }*/
    }
}