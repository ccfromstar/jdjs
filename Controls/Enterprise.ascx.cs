using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace JDJS.Web.Controls
{
    public partial class Enterprise : System.Web.UI.UserControl
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
            JDJS.BLL.CustBase_DcustWebShow_View bll = new JDJS.BLL.CustBase_DcustWebShow_View();
            Repent.DataSource = bll.GetList(30, "cflag=0", "webshow desc, NEWID()");
            Repent.DataBind();
        }
    }
}