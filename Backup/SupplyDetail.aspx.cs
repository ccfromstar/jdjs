using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace JDJS.Web
{
    public partial class SupplyDetail : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

            if (!IsPostBack)
            {
                string Part = "";
                string Id = "";
                if (!string.IsNullOrEmpty(Request.QueryString["Part"]) && !string.IsNullOrEmpty(Request.QueryString["Id"]))
                {
                    Part = Request.QueryString["Part"];
                    Id = Request.QueryString["Id"];
                    if (!LTP.Common.UserInfo.IsLogin())
                    {
                        Session["FromPage"] = HttpContext.Current.Request.Url.PathAndQuery;
                        Response.Redirect("Login.aspx");
                    }
                    else
                    {
                        Session["FromPage"] = null;
                        BindInfo(Part, Id);
                    }
                }

            }
        }
        private void BindInfo(string Part, string Id)
        {
            try
            {
                int InfoId = int.Parse(Id);
                switch (Part)
                {
                    case "1":
                        ImgBg.ImageUrl = "style/images/Supply-md1.gif";
                        BindInfo1(InfoId);
                        break;
                    case "2":
                        ImgBg.ImageUrl = "style/images/Supply-md2.gif";
                        BindInfo1(InfoId);
                        break;
                    default:
                        break;
                }
            }
            catch
            {
                
            }

        }
        private void BindInfo1(int Id)
        {
            JDJS.BLL.Mat_Trade_Info bll = new JDJS.BLL.Mat_Trade_Info();
            JDJS.Model.Mat_Trade_Info model = bll.GetModel(Id);
            if (model != null)
            {
                JDJS.BLL.Wssc_Cust_Base_Info bll1 = new JDJS.BLL.Wssc_Cust_Base_Info();
                JDJS.Model.Wssc_Cust_Base_Info model1 = bll1.GetModel(model.newcode);

                lbTitle.Text = model.title;
                if (model1 != null)
                {
                    lbCp.Text = model1.unit;
                    lbLxr.Text = model1.linkman;
                    lbPhone.Text = model1.phone;
                    lbAdd.Text = model1.address;
                    lbYb.Text = model1.post;
                    lbFax.Text = model1.fax;
                }
                lbHname.Text = model.mname;
                switch (model.mtype)
                {
                    case 0:
                        lbType.Text = "人工";
                        break;
                    case 1:
                        lbType.Text = "材料";
                        break;
                    case 2:
                        lbType.Text = "机械";
                        break;
                    case 3:
                        lbType.Text = "设备";
                        break;
                }
                lbDw.Text = model.munit;
                lbPrice.Text = model.mprice;
                lbAllCount.Text = model.mamount;
                lbAllPrice.Text = model.allmoney;
                lbDate.Text = DateTime.Parse(model.ptime.ToString()).ToShortDateString();
                lbContent.Text = model.beizhu;
            }
        }

    }
}
