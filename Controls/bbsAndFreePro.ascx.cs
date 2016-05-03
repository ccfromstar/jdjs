using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace JDJS.Web.Controls
{
    public partial class bbsAndFreePro : System.Web.UI.UserControl
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                BindInfoBBS();
                BindInfoFREEpro();
            }
        }
        private void BindInfoBBS()
        {
            JDJS.BLL.dnt_topics bll = new JDJS.BLL.dnt_topics();
            RepentBBS.DataSource = bll.GetList(5);
            RepentBBS.DataBind();
        }
        private void BindInfoFREEpro()
        {
            JDJS.BLL.project_inforbase bll = new JDJS.BLL.project_inforbase();
            RepeaterFREEpro.DataSource = bll.GetList(5, "", "id desc, NEWID()");
            RepeaterFREEpro.DataBind();
        }
    }
}