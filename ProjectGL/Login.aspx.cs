using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace JDJS.Web.ProjectGL
{
    public partial class Login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            Title = "您好，欢迎使用建定工程通！";
            if (!this.IsPostBack)
            {
                //JDJS.BLL.Admin bll = new JDJS.BLL.Admin();
                //JDJS.Model.Admin model = bll.GetModel("admin", "bdjs884784");
                //Session["AdminInfo"] = model;
                //Response.Redirect("Main.aspx");
                this.ViewState["GUID"] = System.Guid.NewGuid().ToString();
                this.lblGUID.Text = this.ViewState["GUID"].ToString();
            }
        }

        protected void ImageLogin_Click(object sender, ImageClickEventArgs e)
        {
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
                    JDJS.BLL.Admin bll = new JDJS.BLL.Admin();
                    JDJS.Model.Admin model = bll.GetModel(txtUserName.Text.Trim(), txtPwd.Text.Trim());
                    Session["AdminInfo"] = model;
                    Response.Redirect("Main.aspx");
                }
            }
            else
            {
                LTP.Common.MessageBox.Show(this.Page, "所填写的验证码与所给的不符！");
            }
        }
    }
}
