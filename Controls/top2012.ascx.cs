using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
namespace JDJS.Web.Controls
{
    public partial class top2012 : System.Web.UI.UserControl
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
            JDJS.BLL.mat_special bll = new JDJS.BLL.mat_special();
            matindex.DataSource = bll.GetAllList();
            matindex.DataBind();
        }
    }
}