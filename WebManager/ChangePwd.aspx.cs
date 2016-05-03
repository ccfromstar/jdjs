using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace JDJS.Web.WebManager
{
    public partial class ChangePwd : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["AdminInfo"] != null)
            {
            }
            else
            {
                Response.Redirect("Login.aspx");
            }
        }

        protected void lbSubmit_Click(object sender, EventArgs e)
        {
            if (Session["AdminInfo"] != null)
            {
                JDJS.BLL.Admin bll = new JDJS.BLL.Admin();
                JDJS.Model.Admin model = ((JDJS.Model.Admin)Session["AdminInfo"]);
                if (model.pwd == txtNewPwd.Text.Trim())
                {
                    if (txtNewPwd.Text == txtSdPwd.Text)
                    {
                        model.pwd = txtNewPwd.Text;
                        bll.Update(model);
                        LTP.Common.MessageBox.Show(this.Page, "密码修改成功!");
                    }
                }
            }
            else
            {
                Response.Redirect("Login.aspx");
            }
        }
    }
}
