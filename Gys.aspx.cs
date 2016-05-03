using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace JDJS.Web
{
    public partial class Gys : System.Web.UI.Page
    {
        public string Id
        {
            get
            {
                if (!string.IsNullOrEmpty(Request.QueryString["Id"]))
                {
                    try
                    {
                        return Request.QueryString["Id"];
                    }
                    catch
                    {
                        return "";
                    }
                }
                else
                {
                    return "";
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
                    BindGys(Id);
                }
            }
        }


        private void BindGys(string Id)
        {
            try
            {
                Id = LTP.Common.StringPlus.htmlstr(Id);
                ImgBg.ImageUrl = "style/images/Market-md4.gif";
                JDJS.BLL.material_company bll = new JDJS.BLL.material_company();
                JDJS.Model.material_company model = bll.GetModel(Id);
                lbBody.Text = model.company;
                lbAddress.Text = model.address;
                lbPhone.Text = model.tel;
                lbMobile.Text = model.handset;
                lbFax.Text = model.fax;
                lbLxr.Text = model.linkman;
                lbYb.Text = model.post;
                lbSite.Text = model.url;
                lbEmail.Text = model.email;
                PanCp.Visible = true;

            }
            catch
            {
            }

        }

        protected void btnReturn_Click(object sender, EventArgs e)
        {
            Response.Redirect("SeachReal.aspx");
        }

    }
}