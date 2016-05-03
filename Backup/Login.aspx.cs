using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Discuz.Common;

using System.Data;

namespace JDJS.Web
{
    public partial class Login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!this.IsPostBack)
            {
                //this.ViewState["GUID"] = System.Guid.NewGuid().ToString();
                //this.lblGUID.Text = this.ViewState["GUID"].ToString();
            }
            IsLogin();
        }

        protected void btnLogin_Click(object sender, EventArgs e)
        {
            #region 检查验证码
           /* if ((Session["CheckCode"] != null) || (Session["CheckCode"].ToString() != ""))
            {
                if (Session["CheckCode"].ToString().ToLower() != this.CheckCode.Text.Trim().ToLower())
                {
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "", "alert('所填写的验证码与所给的不符！')", true);
                    Session["CheckCode"] = null;
                    return;
                }
                else
                {
                    JDJS.BLL.cust_base_info bll = new JDJS.BLL.cust_base_info();
                    if (bll.Login(LTP.Common.StringPlus.htmlstr(LoginName.Text.Trim()), LTP.Common.StringPlus.htmlstr(PassWord.Text.Trim())))
                    {
                        JDJS.Model.cust_base_info model = bll.GetModel(LTP.Common.StringPlus.htmlstr(LoginName.Text.Trim()));
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
                        try
                        {
                            if (!string.IsNullOrEmpty(Session["FromPage"].ToString()))
                            {
                                Response.Redirect(Session["FromPage"].ToString());
                            }
                        }
                        catch 
                        {
                            
                        }
                        IsLogin();
                    }
                }
            }
            else
            {
                LTP.Common.MessageBox.Show(this.Page, "所填写的验证码与所给的不符！");
            }
            ClearAll();*/
            #endregion

            if (!ProjectLogin())
            {

                JDJS.BLL.cust_base_info bll = new JDJS.BLL.cust_base_info();
                if (bll.Login(LTP.Common.StringPlus.htmlstr(LoginName.Text.Trim()), LTP.Common.StringPlus.htmlstr(PassWord.Text.Trim())))
                {
                    JDJS.Model.cust_base_info model = bll.GetModel(LTP.Common.StringPlus.htmlstr(LoginName.Text.Trim()));
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
                    try
                    {
                        if (!string.IsNullOrEmpty(Session["FromPage"].ToString()))
                        {
                            Response.Redirect(Session["FromPage"].ToString());
                        }
                    }
                    catch
                    {

                    }
                    IsLogin();
                }
                else
                {
                    LTP.Common.MessageBox.Show(this.Page, "所填写的帐号或密码不正确，或两者不匹配！");
                }
                ClearAll();
            }
        }

        public bool ProjectLogin()
        {

            JDJS.BLL.Admin bll = new JDJS.BLL.Admin();
            JDJS.Model.Admin model = bll.GetModel(LoginName.Text.Trim(), PassWord.Text.Trim());
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
        private void IsLogin()
        {
            if (Session["User"] != null)
            {
                JDJS.Model.cust_base_info modelmb = ((JDJS.Model.cust_base_info)Session["User"]);
                JDJS.BLL.member_point bll = new JDJS.BLL.member_point();
                JDJS.Model.member_point modeljf = bll.GetModel(modelmb.newcode);
                labName.Text = "您好！";
                labPassWord.Text = "当年积分：";
                JDBtit.Text = "剩余建定币：";
                LoginName.Visible = false;
                PassWord.Visible = false;
                btnForgot.Visible = false;
                btnLogin.Visible = false;
                btnReg.Visible = false;
                //lbCheck.Visible = false;
                //panCheck.Visible = false;
                labLoginUser.Visible = true;
                labJf.Visible = true;
                LabJDB.Visible = true;
                btnZX.Visible = true;
                btnChange.Visible = true;
                labLoginUser.Text = modelmb.newcode;
                labJf.Text = modeljf.point.ToString();
                LabJDB.Text = modeljf.JDB.ToString();
                ClearAll();
                DiscuzIntegration.Integration.Login(modelmb.newcode, modelmb.pwd);
            }
            else
            {
                DiscuzIntegration.Integration.Logout();
            }
            
        }
        private void ClearAll()
        {
            LoginName.Text = "";
            PassWord.Text = "";
            //CheckCode.Text = "";
        }
        protected void btnReg_Click(object sender, EventArgs e)
        {
            Response.Redirect("Registration.aspx");
        }

        protected void btnForgot_Click(object sender, EventArgs e)
        {
            Response.Redirect("Forgot.aspx");
        }

        protected void btnChange_Click(object sender, EventArgs e)
        {
            Response.Redirect("ChangePassword.aspx");
        }

        protected void btnZX_Click(object sender, EventArgs e)
        {
            LTP.Common.UserInfo.LoginOut();
            Response.Redirect("Default.aspx");
        }

        protected void btnXX_Click(object sender, EventArgs e)
        {
            Response.Redirect("Registration.aspx");
        }
    }
}
