using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace JDJS.Web.Controls
{
    public partial class JDdsleft : System.Web.UI.UserControl
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

            JDJS.BLL.ds_data bll = new JDJS.BLL.ds_data();
            RepJDds.DataSource = bll.GetList(" dsflag=0 order by id desc");
            RepJDds.DataBind();
        }
    }
}