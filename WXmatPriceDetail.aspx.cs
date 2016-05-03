using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace JDJS.Web
{
    public partial class WXmatPriceDetail : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            string Id = "";

            if (!string.IsNullOrEmpty(Request.QueryString["Id"]))
            {

                Id = Request.QueryString["Id"];
                //JDJS.BLL.project_inforbase bll = new JDJS.BLL.project_inforbase();

                BindInfo2(int.Parse(Id));//未登录

            }
        }



        private void BindInfo2(int Id)
        {
            //Plinvite.Visible = true;
            JDJS.BLL.material_data bll = new JDJS.BLL.material_data();

            JDJS.Model.material_data model = bll.GetModel(Id);
            //Page.Title = "工程信息-" + model.proname + "-上海建定建设工程信息网";
            lbTitle.Text = model.zname;
            if (!string.IsNullOrEmpty(model.ptime.ToString()))
            {
                lbTime.Text = DateTime.Parse(model.ptime.ToString()).ToShortDateString();
            }
            else
            {
                lbTime.Text = "";
            }

            lbType.Text = model.standard;
            lbunit.Text = model.zunit;
            lbplace.Text = model.place;
            if (!string.IsNullOrEmpty(model.lprice.ToString()) && (model.lprice > 0))
            {
                lbprice.Text = model.lprice.ToString() + " 元";
            }
            else
            {
                lbprice.Text = "面议";
            }

          
            lbclass.Text = model.Class;

            lbRemark.Text = model.rek;
            lbamount.Text = model.amount;
            lbmat.Text = model.material;
            if (model.cid != null)
            {
                BindCompany(model.cid);
                //Bindprodesigner(Id.ToString());
                //Bindprobuilder(Id.ToString());

            }
            else
            {
              
            }
            if (!string.IsNullOrEmpty(model.pic) && model.pic != "")
            {
                LabelImageMat.Visible = false;
                ImageMat.Visible=true;
                ImageMat.ImageUrl = model.pic;
            }
            else 
            { 
                ImageMat.Visible = false;
                LabelImageMat.Text = "尚未提供产品图片！";
                LabelImageMat.Visible = true;            
            }

            //lbOther.Text = model.其他;
        }

        private void BindCompany(string cid)
        {
            string strwhere;
            
            JDJS.BLL.material_company bll = new JDJS.BLL.material_company();
             JDJS.Model.material_company model = bll.GetModel(cid);
            strwhere = "  cid =" + cid;
            if (bll.GetCount(strwhere) > 0)
            {
                companyname.Text = model.company;
                companyname.NavigateUrl = "WXmatCompanyDetail.aspx?Id=" + model.cid;
                companyname.Font.Bold = true;
                address.Text = model.address;
                Cpost.Text = model.post;
                leader.Text = model.leader;
                tel.Text = model.tel;
                fax.Text = model.fax;
                web.Text = model.url;
                email.Text = model.email;
                linkman.Text = model.linkman;
                handset.Text = model.handset;
            }
        }
     

    }
}