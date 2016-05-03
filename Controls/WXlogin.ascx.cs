using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace JDJS.Web.Controls
{
    public partial class WXlogin : System.Web.UI.UserControl
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!this.IsPostBack)
            {
                clearLogin();
            }
            IfLogin();
        }
        private void clearLogin()
        {

            Labeid.Text = "您尚未登录";
            //Labepoint.Text = "登录后显示";
            //LabeJDB.Text = "登录后显示";
            loginroad1.Style.Add("display", "");
            logined.Style.Add("display", "none");
        }

        private void IfLogin()
        {
            if (Session["AdminInfo"] != null)
            {


                loginroad1.Style.Add("display", "none");
                logined.Style.Add("display", "");
                JDJS.Model.Admin modelmb = ((JDJS.Model.Admin)Session["AdminInfo"]);
                //JDJS.BLL.member_point bll = new JDJS.BLL.member_point();
                //JDJS.Model.member_point modeljf = bll.GetModel(modelmb.newcode);
                Labeid.Text = modelmb.uid;
                //Labepoint.Text = modeljf.point.ToString();
                //LabeJDB.Text = modeljf.JDB.ToString();


            }
            else
            {
                loginroad1.Style.Add("display", "");
                logined.Style.Add("display", "none");
            }

        }

        /*protected void tcButton_Click(object sender, EventArgs e)
        {
            clearLogin();
            LTP.Common.UserInfo.LoginOut();
            System.Web.HttpContext.Current.Session["AdminInfo"] = null;
            Response.Redirect("WXprobase.aspx");
        }*/

        protected void ImageButton1_Click(object sender, EventArgs e)
        {
            clearLogin();
            LTP.Common.UserInfo.LoginOut();
            System.Web.HttpContext.Current.Session["AdminInfo"] = null;
            Response.Redirect("WXprobase.aspx");
        }

        protected void ImageSeach_Click(object sender, ImageClickEventArgs e)
        {
            if (!ProGLLogin())
            {
               
                LTP.Common.MessageBox.Show(this.Page, "所填写的帐号或密码不正确，或两者不匹配！");
               
                clearLogin();
            }
        }
        public bool ProGLLogin()
        {

            JDJS.BLL.Admin bll = new JDJS.BLL.Admin();
            JDJS.Model.Admin model = bll.GetModel(TOPLoginName.Text.Trim(), TOPPassWord.Text.Trim());
            Session["AdminInfo"] = model;
            if (Session["AdminInfo"] != null)
            {
                Response.Redirect(Request.Url.ToString());
                return true;
            }
            else
            {
                return false;
            }
        }
    }
}