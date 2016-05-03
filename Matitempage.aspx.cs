using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

namespace JDJS.Web
{
    public partial class Matitempage : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            string specialCode = "";
           
            
            if (!IsPostBack)
            {
                if (!string.IsNullOrEmpty(Request.QueryString["specialCode"]))
                {
                    specialCode = Request.QueryString["specialCode"];
                    //spname = LTP.Common.StringPlus.htmlstr(Request.QueryString["spname"]);
                    BindInfo(specialCode);
                }  
                
            }
        }
        private void BindInfo(string specialCode)
        {
            //specialname.Text = spname.ToString();
            JDJS.BLL.mat_item bll = new JDJS.BLL.mat_item();
            matitemlist.DataSource = bll.GetList("specialCode='" + specialCode + "'");
            matitemlist.DataBind();
            JDJS.BLL.mat_special bll2 = new JDJS.BLL.mat_special();
            DataSet ds = bll2.GetList("specialCode='" + specialCode + "'");
            specialname.Text = LTP.Common.StringPlus.htmlstr(ds.Tables[0].Rows[0]["name"].ToString());
        }
    }
}