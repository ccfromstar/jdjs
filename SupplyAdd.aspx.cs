using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace JDJS.Web
{
    public partial class SupplyAdd : System.Web.UI.Page
    {
        public string Part = "";
        public string Id = "";
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!string.IsNullOrEmpty(Request.QueryString["Id"]))
            {
                Id = Request.QueryString["Id"];
            }
            if (!string.IsNullOrEmpty(Request.QueryString["Part"]))
            {
                Part = Request.QueryString["Part"];
                
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
                        BindInfo(Part,Id);
                    }
                }
            }
        }
        private void BindInfo(string Part, string Id)
        {
            switch (Part)
            {
                case "1":
                    ImgBg.ImageUrl = "style/images/Supply-md1.gif";
                    BindInfo(Id);
                    break;
                case "2":
                    ImgBg.ImageUrl = "style/images/Supply-md2.gif";
                    BindInfo(Id);
                    break;
                default:
                    break;
            }

        }
        private void BindInfo(string Id)
        {
            try
            {
                if (!LTP.Common.UserInfo.IsLogin())
                {
                    Session["FromPage"] = HttpContext.Current.Request.Url.PathAndQuery;
                    Response.Redirect("Login.aspx");
                }
                else
                {
                    Session["FromPage"] = null;
                    string userid = ((JDJS.Model.cust_base_info)Session["User"]).newcode;
                    JDJS.BLL.Wssc_Cust_Base_Info bll1 = new JDJS.BLL.Wssc_Cust_Base_Info();
                    JDJS.Model.Wssc_Cust_Base_Info model1 = bll1.GetModel(userid);
                    if (model1 != null)
                    {
                        PanUser.Visible = false;
                    }
                }
               
                int NowId = int.Parse(Id);
                JDJS.BLL.Mat_Trade_Info bll = new JDJS.BLL.Mat_Trade_Info();
                JDJS.Model.Mat_Trade_Info model = bll.GetModel(NowId);
                if (model != null)
                {
                    txtZname.Text = model.mname;
                    txtDw.Text = model.munit;
                    txtDj.Text = model.mprice;
                    txtCount.Text = model.mamount;
                    txtAllPrice.Text = model.allmoney;
                    txtRemark.Text = model.beizhu;
                    txtTitle.Text = model.title;
                }
            }
            catch
            {
            }
        }
        protected void btnSubmit_Click(object sender, EventArgs e)
        {




            if (!LTP.Common.UserInfo.IsLogin())
            {
                Session["FromPage"] = HttpContext.Current.Request.Url.PathAndQuery;
                Response.Redirect("Login.aspx");
            }
            else
            {
                Session["FromPage"] = null;
                string userid = ((JDJS.Model.cust_base_info)Session["User"]).newcode;
                JDJS.BLL.Wssc_Cust_Base_Info bll1 = new JDJS.BLL.Wssc_Cust_Base_Info();
                JDJS.Model.Wssc_Cust_Base_Info model1 = bll1.GetModel(userid);
                if (model1 != null) { }
                else 
                {
                    model1.newcode = userid;
                    model1.unit=lbCp.Text;
                    model1.linkman=lbLxr.Text;
                    model1.phone=lbPhone.Text;
                    model1.address=lbAdd.Text;
                    model1.post=lbYb.Text;
                    model1.fax=lbFax.Text;
                    model1.ftime = DateTime.Now;
                    model1.enddate = DateTime.Now;
                    model1.deputy = "";
                    model1.sex = "男";
                    model1.mobile = "";
                    model1.pwd = "";
                    model1.email = "";
                    model1.url = "";
                    model1.duty = "";
                    model1.brief = "";
                    model1.product = "";
                    model1.needinfo = "";
                    model1.mailadder = "";
                    model1.mailman = "";
                    model1.mailunit="";
                    model1.mailpost = "";
                    model1.addrerror = "n";
                    model1.norecieve = 0;
                    model1.sendtype = 0;
                    model1.freeflag = 0;
                    model1.overflag = 0;
                    model1.custtype = "赠阅";
                    model1.cflag = 0;
                    model1.tflag = 0;
                    model1.ctkflag = 0;
                    model1.hfdate = DateTime.Now;
                    model1.hfflag = 0;
                    model1.hfcnt = 0;
                    model1.LastIntent = 0;
                    bll1.Add(model1);
                }
            }

            JDJS.BLL.Mat_Trade_Info bll = new JDJS.BLL.Mat_Trade_Info();
            JDJS.Model.Mat_Trade_Info model = new JDJS.Model.Mat_Trade_Info();
            model.newcode = ((JDJS.Model.cust_base_info)Session["User"]).newcode;
            int freecust;
            string upsname;
            upsname = model.newcode.ToUpper();
            if (upsname.StartsWith("S"))
            {
                freecust = 1;
            }
            else
            {
                freecust = 0;
            }
            model.freecust = freecust;
            model.infotype = Getinfotype(Part);
            model.mname = LTP.Common.StringPlus.htmlstr(txtZname.Text.Trim());
            model.munit = LTP.Common.StringPlus.htmlstr(txtDw.Text.Trim());
            model.mprice = LTP.Common.StringPlus.htmlstr(txtDj.Text.Trim());
            model.mamount = LTP.Common.StringPlus.htmlstr(txtCount.Text.Trim());
            model.allmoney = LTP.Common.StringPlus.htmlstr(txtAllPrice.Text.Trim());
            model.beizhu = LTP.Common.StringPlus.htmlstr(txtRemark.Text.Trim());
            model.showflag = 0;
            model.title = LTP.Common.StringPlus.htmlstr(txtTitle.Text.Trim());
            model.mtype = int.Parse(ddlClass.SelectedValue);
            model.ptime = DateTime.Now;
            bll.Add(model);
            LTP.Common.MessageBox.Show(this, "发布成功！");
        }
        private int Getinfotype(string part)
        {
            if (part == "1")
            {
                return 0;
            }
            else
            {
                return 1;
            }
        }
    }
}
