using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using PageControl;

namespace JDJS.Web
{
    public partial class StaffInfo : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            string Id = "";

            if (!string.IsNullOrEmpty(Request.QueryString["Id"]))
            {

                Id = Request.QueryString["Id"];
                
                //Plinvite.Visible = true;
                if (!LTP.Common.UserInfo.IsLogin())
                {

                    Session["FromPage"] = HttpContext.Current.Request.Url.PathAndQuery;
                    Response.Redirect("Login.aspx");
                    //ImgBg.ImageUrl = "style/images/Project-md3.gif";

                    //BindInfo2(int.Parse(Id));//未登录

                }
                else
                {
                    Session["FromPage"] = null;
                    BindInfo(int.Parse(Id));//登录后
                }
            }
        }
        private void BindInfo(int Id)
        {
            string Notbuy = "您尚未解锁该员工信息";
            string NULLstr = "未知";
            JDJS.BLL.TClinkman bll = new JDJS.BLL.TClinkman();
            JDJS.Model.TClinkman model = bll.GetModel(Id);
            JDJS.BLL.cust_base_info cbll = new JDJS.BLL.cust_base_info();
            JDJS.Model.cust_base_info cmodel = ((JDJS.Model.cust_base_info)Session["User"]);

            if (model.code.IndexOf(cmodel.newcode) > -1)
            {
                lpname.Text = model.linkman +"  "+ model.chenghu;
                if (!string.IsNullOrEmpty(model.companyname))
                {
                    lpcompany.Text = model.companyname;
                }
                else
                {
                    lpcompany.Text = NULLstr;
                }

                if (!string.IsNullOrEmpty(model.job))
                {
                    lpjob.Text = model.job;
                }
                else
                {
                    lpjob.Text = NULLstr;
                }
                if (!string.IsNullOrEmpty(model.place))
                {
                    lpplace.Text = model.place;
                }
                else 
                {
                    lpplace.Text = NULLstr;
                }
                if (!string.IsNullOrEmpty(model.address))
                {
                    lpaddress.Text = model.address;
                }
                else
                {
                    lpaddress.Text = NULLstr;
                }
                if (!string.IsNullOrEmpty(model.phone))
                {
                    lpphone.Text = model.phone;
                }
                else
                {
                    lpphone.Text = NULLstr;
                }
                if (!string.IsNullOrEmpty(model.fax))
                {
                    lpfax.Text = model.fax;
                }
                else
                {
                    lpfax.Text = NULLstr;
                }
                if (!string.IsNullOrEmpty(model.email))
                {
                    lpemail.Text = model.email;
                }
                else
                {
                    lpemail.Text = NULLstr;
                }
            }
            else
            {
                lpname.Text = Notbuy;
                lpcompany.Text = Notbuy;
                lpjob.Text = Notbuy;
                lpplace.Text = Notbuy;
                lpaddress.Text = Notbuy;
                lpphone.Text = Notbuy;
                lpfax.Text = Notbuy;
                lpemail.Text = Notbuy;
            }
        }
    }
}