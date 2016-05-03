using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace JDJS.Web.Controls
{
    public partial class other : System.Web.UI.UserControl
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
            JDJS.BLL.member_point bll = new JDJS.BLL.member_point();
            Repintegral.DataSource = bll.GetList(3, "id not in ('jd1-500106','jd1-500107','JD1-500106','JD1-500108')", "current_point desc");
            Repintegral.DataBind();
        }

    }
}