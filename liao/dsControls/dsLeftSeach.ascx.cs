using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace JDJS.Web.liao.dsControls
{
    public partial class dsLeftSeach : System.Web.UI.UserControl
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Button1_Click(object sender, EventArgs e)
        {

            if (!string.IsNullOrEmpty(TextBox1.Text))
            {
                Response.Redirect("./supply.aspx?keyword=" + TextBox1.Text);
            }
        }
    }
}