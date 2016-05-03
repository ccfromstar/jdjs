using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace JDJS.Web.Controls
{
    public partial class loginroad : System.Web.UI.UserControl
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
            Labepoint.Text = "登录后显示";
            LabeJDB.Text = "登录后显示";
            loginroad1.Style.Add("display", "");
            logined.Style.Add("display", "none");
        }

        private void IfLogin()
        {
            if (Session["User"] != null)
            {


                loginroad1.Style.Add("display", "none");
                logined.Style.Add("display", "");
                JDJS.Model.cust_base_info modelmb = ((JDJS.Model.cust_base_info)Session["User"]);
                JDJS.BLL.member_point bll = new JDJS.BLL.member_point();
                JDJS.Model.member_point modeljf = bll.GetModel(modelmb.newcode);
                Labeid.Text = modelmb.newcode;
                Labepoint.Text = modeljf.point.ToString();
                LabeJDB.Text = modeljf.JDB.ToString();
               
                
            }
            else
            {
                loginroad1.Style.Add("display", "");
                logined.Style.Add("display", "none");
            }

        }

        protected void tcButton_Click(object sender, EventArgs e)
        {
            clearLogin();
            LTP.Common.UserInfo.LoginOut();
            Response.Redirect("Default.aspx");
        }

        protected void ImageButton1_Click(object sender, EventArgs e)
        {
            clearLogin();
            LTP.Common.UserInfo.LoginOut();
            Response.Redirect("Default.aspx");
        }

        protected void ImageSeach_Click(object sender, ImageClickEventArgs e)
        {
        #region 检查验证码
            /*    
            if ((Session["CheckCode"] != null) || (Session["CheckCode"].ToString() != ""))
            {
                if (Session["CheckCode"].ToString().ToLower() != this.TOPCheckCode.Text.Trim().ToLower())
                {
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "", "alert('所填写的验证码与所给的不符！')", true);
                    Session["CheckCode"] = null;
                    return;
                }
                else
                {
                    JDJS.BLL.cust_base_info bll = new JDJS.BLL.cust_base_info();
                    if (bll.Login(LTP.Common.StringPlus.htmlstr(TOPLoginName.Text.Trim()), LTP.Common.StringPlus.htmlstr(TOPPassWord.Text.Trim())))
                    {
                        JDJS.Model.cust_base_info model = bll.GetModel(LTP.Common.StringPlus.htmlstr(TOPLoginName.Text.Trim()));
                        Session["User"] = model;
                        //Session["UserNewcode"] = model.newcode;
                        Session["seachpower"] = model.seachplace;
                        JDJS.BLL.member_point mpbll = new BLL.member_point();
                        JDJS.Model.member_point mpmodel = mpbll.GetModel(model.newcode);
                        mpmodel.today_login_count += 1;
                        mpmodel.point += 1;
                        if (mpmodel.today_login_count <= 5)
                        {
                            mpbll.Update(mpmodel);
                        }
                        DiscuzIntegration.Integration.Login(model.newcode, model.pwd);
                        Response.Redirect(Request.Url.ToString());

                    
                        IfLogin();
                    }
                }
            }
            else
            {
                LTP.Common.MessageBox.Show(this.Page, "所填写的验证码与所给的不符！");
            }
            //ClearAll();
            clearLogin();
           */
             #endregion
            if (!ProGLLogin())
            {
                JDJS.BLL.cust_base_info bll = new JDJS.BLL.cust_base_info();
                if (bll.Login(LTP.Common.StringPlus.htmlstr(TOPLoginName.Text.Trim()), LTP.Common.StringPlus.htmlstr(TOPPassWord.Text.Trim())))
                {
                    JDJS.Model.cust_base_info model = bll.GetModel(LTP.Common.StringPlus.htmlstr(TOPLoginName.Text.Trim()));
                    Session["User"] = model;
                    //Session["UserNewcode"] = model.newcode;
                    Session["seachpower"] = model.seachplace;
                    JDJS.BLL.member_point mpbll = new BLL.member_point();
                    JDJS.Model.member_point mpmodel = mpbll.GetModel(model.newcode);
                    mpmodel.today_login_count += 1;
                    mpmodel.point += 1;
                    if (mpmodel.today_login_count <= 5)
                    {
                        mpbll.Update(mpmodel);
                    }
                    DiscuzIntegration.Integration.Login(model.newcode, model.pwd);
                    Response.Redirect(Request.Url.ToString());

                    IfLogin();

                }
                else
                {
                    LTP.Common.MessageBox.Show(this.Page, "所填写的帐号或密码不正确，或两者不匹配！");
                }
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
                Response.Redirect("ProjectGL/Main.aspx");
                return true;
            }
            else
            {
                return false;
            }
        }
    }
}