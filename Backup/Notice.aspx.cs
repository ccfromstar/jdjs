using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace JDJS.Web
{
    public partial class Notice : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (!string.IsNullOrEmpty("Id"))
                {
                    try
                    {
                        int Id = int.Parse(Request.QueryString["Id"]);
                        BindInfo(Id);
                    }
                    catch
                    {
                    }
                }
            }
        }
        private void BindInfo(int Id)
        {
            JDJS.BLL.xtgg bll = new JDJS.BLL.xtgg();
            JDJS.Model.xtgg model = new JDJS.Model.xtgg();
            model=bll.GetModel(Id);
            lbTitle.Text = model.title;
            lbBody.Text = model.title;
        }
    }
}
