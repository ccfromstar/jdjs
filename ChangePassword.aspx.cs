using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace JDJS.Web
{
    public partial class ChangePassword : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            IsLogin();
            if (!this.IsPostBack)
            {
                this.ViewState["GUID"] = System.Guid.NewGuid().ToString();
                this.lblGUID.Text = this.ViewState["GUID"].ToString();
            }
        }

        protected void btnChange_Click(object sender, EventArgs e)
        {
            #region 检查验证码
            if ((Session["CheckCode"] != null) || (Session["CheckCode"].ToString() != ""))
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
                    JDJS.Model.cust_base_info model = (JDJS.Model.cust_base_info)Session["User"];
                    if (bll.Exists(model.newcode, LTP.Common.StringPlus.htmlstr(LoginName.Text.Trim())))
                    {
                        model.pwd = LTP.Common.StringPlus.htmlstr(PassWord.Text.Trim());
                        bll.Update(model);
                        Session["User"] = model;
                        LTP.Common.MessageBox.Show(this.Page, "密码修改成功！");
                    }
                }
            }
            else
            {
                LTP.Common.MessageBox.Show(this.Page, "所填写的验证码与所给的不符！");
            }
            #endregion           
           
        }
        private void IsLogin()
        {
            if (Session["User"] != null)
            {

            }
            else
            {
                Response.Redirect("Login.aspx");
            }
        }
    }
}
