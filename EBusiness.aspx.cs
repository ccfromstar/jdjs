using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;


namespace JDJS.Web
{
    public partial class EBusiness : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void ImageButton1_Click(object sender, ImageClickEventArgs e)
        {
            if (DropDownList1.SelectedIndex == 0)
            {
                string KeyWords = TextBox1.Text;
                Response.Redirect("DsSupplySeach.aspx?keyword=" + KeyWords);
            }
            else
            {
                string KeyWords = TextBox1.Text;
                Response.Redirect("DsCompanySeach.aspx?keyword=" + KeyWords);
            }
        }
    }
}