using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace JDJS.Web
{
    public partial class RealDetail : System.Web.UI.Page
    {
        public int Id
        {
            get {
                if(!string.IsNullOrEmpty(Request.QueryString["Id"]))
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
        public JDJS.Model.real_material_data Gys
        {
            get
            {
                if (Id >= 0)
                {
                    JDJS.BLL.real_material_data bll = new JDJS.BLL.real_material_data();
                    return bll.GetModel(Id);
                }
                else
                {
                    return null;
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
            if (Gys != null)
            {
                lbName.Text = Gys.zname;
                lbGg.Text = Gys.standard;
                lbPp.Text = Gys.Class;
                lbCz.Text = Gys.material;
                lbCd.Text = Gys.place;
                lbCp.Text = Gys.cpname;
                lbDw.Text = Gys.zunit;
                lbCode.Text = Gys.seachid;
                lbDate.Text = ((DateTime)Gys.ptime).ToShortDateString();
                lbRemark.Text = "";
                lbTgj.Text = "￥" + Gys.bid.ToString();
                lbGys.Text = GetCpName(Gys.cid);
                if (Gys.mid == "1")
                {
                    lbGys.PostBackUrl = "Rgxj.aspx?Id=" + Gys.id;
                }
                else
                {
                    lbGys.PostBackUrl = "Gys.aspx?Id=" + Gys.cid;
                }
                if (!string.IsNullOrEmpty(Gys.imgpath))
                {
                    ProImg.ImageUrl = Gys.imgpath;
                }
                ProImg.ImageUrl = "style/images/nophoto.gif";

            }

        }
        public string GetCpName(string id)
        {
            JDJS.BLL.material_company bll = new BLL.material_company();
            JDJS.Model.material_company model = bll.GetModel(id);
            if (model != null)
            {
                return model.company;
            }
            else
            {
                return "";
            }
        }
        protected void btnReturn_Click(object sender, EventArgs e)
        {
            Response.Redirect("SeachReal.aspx");
        }

        protected void btnGys_Click(object sender, EventArgs e)
        {
            if (Gys.mid == "1")
            {
                Response.Redirect("Rgxj.aspx?Id=" + Gys.id);
            }
            else
            {
                Response.Redirect("Gys.aspx?Id=" + Gys.cid);
            }
            
        }

        protected void btnRgxj_Click(object sender, EventArgs e)
        {
            Response.Redirect("Rgxj.aspx?Id=" + Gys.id);
        }
    }
}