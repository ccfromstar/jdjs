using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace JDJS.Web
{
    public partial class Rgxj : System.Web.UI.Page
    {
        public int Id
        {
            get
            {
                if (!string.IsNullOrEmpty(Request.QueryString["Id"]))
                {
                    try
                    {
                        return int.Parse(Request.QueryString["Id"]);
                    }
                    catch
                    {
                        return -1;
                    }
                }
                else
                {
                    return -1;
                }
            }
        }
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (!LTP.Common.UserInfo.IsLogin())
                {
                    Session["FromPage"] = HttpContext.Current.Request.Url.PathAndQuery;
                    Response.Redirect("Login.aspx");
                }
                else
                {
                    Session["FromPage"] = null;
                    BindReal();
                }
            }
        }

        private void BindReal()
        {
            if (Id >= 0)
            {
                JDJS.BLL.real_material_data bll = new JDJS.BLL.real_material_data();
                JDJS.Model.real_material_data model = bll.GetModel(Id);
                lbCode.Text = model.seachid;
                JDJS.Model.cust_base_info NowUser = (JDJS.Model.cust_base_info)Session["User"];
                lbUserName.Text = NowUser.newcode;
                lbName.Text = model.zname;
            }

        }

        protected void btnReturn_Click(object sender, EventArgs e)
        {
            Response.Redirect("SeachReal.aspx");
        }
    }
}