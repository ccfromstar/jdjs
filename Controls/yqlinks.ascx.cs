using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace JDJS.Web.Controls
{
    public partial class yqlinks : System.Web.UI.UserControl
    {
        protected void Page_Load(object sender, EventArgs e)
        {
              if (!IsPostBack)
            {
                BindInfo();
            }
        }
        private void BindInfo()
        {
            JDJS.BLL.yqlj2 bll = new JDJS.BLL.yqlj2();
            RepLink2.DataSource = bll.GetAllList();
            RepLink2.DataBind();
        }
        
    }
}