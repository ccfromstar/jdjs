using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace JDJS.Web
{
    public partial class WXProDetail : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
              
            string Id = "";

            if (!string.IsNullOrEmpty(Request.QueryString["Id"]))
            {

                Id = Request.QueryString["Id"];
                JDJS.BLL.project_inforbase bll = new JDJS.BLL.project_inforbase();

                BindInfo2(int.Parse(Id));//未登录

            }
        }
       
      

        private void BindInfo2(int Id)
        {
            //Plinvite.Visible = true;
            JDJS.BLL.project_inforbase bll = new JDJS.BLL.project_inforbase();
            
            JDJS.Model.project_inforbase model = bll.GetModel(Id);
            Page.Title = "工程信息-" + model.proname + "-上海建定建设工程信息网";
            lbTitle.Text = model.proname;
            if (!string.IsNullOrEmpty(model.inforptime.ToString()))
            {
                lbTime.Text = DateTime.Parse(model.inforptime.ToString()).ToShortDateString();
            }
            else 
            {
                lbTime.Text = "";
            }

            lbType.Text = model.prosort;
            lbstate.Text = model.prostate;
            lbplace.Text = model.proplace;
            lbaddress.Text = model.proaddress;
          
            //lbaddress.Text = lbOther1.Text;
            //lbaddress.Font.Bold = lbOther1.Font.Bold;
            //lbaddress.Font.Size = lbOther1.Font.Size;
            //lbaddress.ForeColor = lbOther1.ForeColor;
            if (!string.IsNullOrEmpty(model.prostime.ToString()))
            {
                lbstime.Text = DateTime.Parse(model.prostime.ToString()).ToShortDateString();
            }
            else
            {
                lbstime.Text = "";
            }
            if (!string.IsNullOrEmpty(model.proftime.ToString()))
            {
                lbftime.Text = DateTime.Parse(model.proftime.ToString()).ToShortDateString();
            }
            else
            {
                lbftime.Text = "";
            }
            lbmoney.Text = model.promoney;

            lbRemark.Text = model.prorek;
            //lbowner.Text = model.proowner;
            //lbdesigner.Text = model.prodesigner;
            //lbbuilder.Text = model.probuilder;
            if (Session["AdminInfo"] != null)
            {  
                Bindproowner(Id.ToString());
                Bindprodesigner(Id.ToString());
                Bindprobuilder(Id.ToString());
    
            }
            else
            {
                ownertext.Visible = true;
                lbowner.Text = lbOther1.Text;
                lbowner.Font.Bold = lbOther1.Font.Bold;
                lbowner.Font.Size = lbOther1.Font.Size;
                lbowner.ForeColor = lbOther1.ForeColor;

                designertext.Visible = true;
                lbdesigner.Text = lbOther1.Text;
                lbdesigner.Font.Bold = lbOther1.Font.Bold;
                lbdesigner.Font.Size = lbOther1.Font.Size;
                lbdesigner.ForeColor = lbOther1.ForeColor;

                buildertext.Visible = true;
                lbbuilder.Text = lbOther1.Text;
                lbbuilder.Font.Bold = lbOther1.Font.Bold;
                lbbuilder.Font.Size = lbOther1.Font.Size;
                lbbuilder.ForeColor = lbOther1.ForeColor;
            }
            //lbOther.Text = model.其他;
        }

        private void Bindproowner(string Id)
        {
            string strwhere;
            //strwhere = " id in (select pepid from pro_linkman_list where proid =" + proid + ")";
            //JDJS.BLL.TClinkman bll = new JDJS.BLL.TClinkman();
            JDJS.BLL.Pro_linkman_View bll = new JDJS.BLL.Pro_linkman_View();
            strwhere = "  proid =" + Id + " and compid=0";
            if (bll.GetCount(strwhere) > 0)
            {
                Repproowner.Visible = true;
                lbowner.Visible = false;
                Repproowner.DataSource = bll.GetList(strwhere);
                Repproowner.DataBind();
            }
        }
        private void Bindprodesigner(string Id)
        {
            string strwhere;
            //strwhere = " id in (select pepid from pro_linkman_list where proid =" + proid + ")";
            //JDJS.BLL.TClinkman bll = new JDJS.BLL.TClinkman();
            JDJS.BLL.Pro_linkman_View bll = new JDJS.BLL.Pro_linkman_View();
            strwhere = "  proid =" + Id + " and compid=1";
            if (bll.GetCount(strwhere) > 0)
            {
                Repprodesigner.Visible = true;
                lbdesigner.Visible = false;
                Repprodesigner.DataSource = bll.GetList(strwhere);
                Repprodesigner.DataBind();
            }
        }
        private void Bindprobuilder(string Id)
        {
            string strwhere;
            //strwhere = " id in (select pepid from pro_linkman_list where proid =" + proid + ")";
            //JDJS.BLL.TClinkman bll = new JDJS.BLL.TClinkman();
            JDJS.BLL.Pro_linkman_View bll = new JDJS.BLL.Pro_linkman_View();
            strwhere = "  proid =" + Id + " and compid=2";

            if (bll.GetCount(strwhere) > 0)
            {
                Repprobuilder.Visible = true;
                lbbuilder.Visible = false;
                Repprobuilder.DataSource = bll.GetList(strwhere);
                Repprobuilder.DataBind();
            }
        }

    }
}