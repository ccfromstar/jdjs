using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace JDJS.Web.Controls
{
    public partial class zcdw : System.Web.UI.UserControl
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
           
            //JDJS.BLL.yqlj2 bll = new JDJS.BLL.yqlj2();
            //RepLink.DataSource = bll.GetList(20, "iftop<0", " id");
            //RepLink.DataBind();
            JDJS.BLL.yqlj2 bll = new JDJS.BLL.yqlj2();
            DropDownListzcdw.DataSource = bll.GetList(20, "iftop<0", " id");
            
            
            DropDownListzcdw.DataTextField = "company"; //dropdownlist的Text的字段

            DropDownListzcdw.DataValueField = "url";//dropdownlist的Value的字段


            
            DropDownListzcdw.DataBind();
        }

        protected void DropDownListzcdw_SelectedIndexChanged(object sender, EventArgs e)
        {
            string url = DropDownListzcdw.SelectedItem.Value.ToString();
            //Response.Write("<script language='javascript'>window.open('http://"+url+"');</script>"); 

            Response.Redirect("http://"+url);
        }

        
    }
     
}