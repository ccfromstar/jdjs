using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace JDJS.Web
{
    public partial class SeachForAdmin : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnSeach_Click(object sender, EventArgs e)
        {
            BindInfo(txtTitle.Text.Trim());
        }
        private void BindInfo(string code)
        {
            JDJS.BLL.real_material_data bll = new JDJS.BLL.real_material_data();
            JDJS.Model.real_material_data model = bll.GetModel(code);
        }
    }
}
