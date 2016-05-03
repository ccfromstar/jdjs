using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace JDJS.Web.ProjectGL
{
    public partial class realDetail : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["AdminInfo"] != null)
            {
            }
            else
            {
                Response.Redirect("Login.aspx");
            }
        }

        private void BindInfo(string id)
        {
            JDJS.BLL.real_material_data bll = new BLL.real_material_data();
            JDJS.Model.real_material_data model = bll.GetModel(id);
            lbName.Text = model.zname;
            lbGg.Text = model.standard;
            lbPp.Text = model.Class;
            lbCz.Text = model.material;
            lbCd.Text = model.place;
            lbCp.Text = model.cpname;
            lbDw.Text = model.zunit;
            lbCode.Text = model.seachid;
            lbDate.Text = ((DateTime)model.ptime).ToShortDateString();
            lbRemark.Text = "";
            lbTgj.Text = "$" + model.bid.ToString();
            if (!string.IsNullOrEmpty(model.imgpath))
            {
                ProImg.ImageUrl = model.imgpath;
            }
            ProImg.ImageUrl = "/style/images/nophoto.gif";
            if (GetCpName(model.cid) != null)
            {
                JDJS.Model.material_company md = GetCpName(model.cid);
                lbGys.Text=md.company;
                lbAddress.Text = md.address;
                lbPhone.Text = md.tel;
                lbMobile.Text = md.handset;
                lbFax.Text = md.fax;
                lbLxr.Text = md.linkman;
                lbYb.Text = md.post;
                lbSite.Text = md.url;
                lbEmail.Text = md.email;
            }
        }

        public JDJS.Model.material_company GetCpName(string id)
        {
            JDJS.BLL.material_company bll = new BLL.material_company();
            JDJS.Model.material_company model = bll.GetModel(id);
            if (model != null)
            {
                return model;
            }
            else
            {
                return null;
            }
        }

        protected void lbSeach_Click(object sender, EventArgs e)
        {
            BindInfo(txtId.Text.Trim());
        }
    }
}