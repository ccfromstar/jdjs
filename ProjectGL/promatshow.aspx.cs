using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace JDJS.Web.ProjectGL
{
    public partial class promatshow : System.Web.UI.Page
    {
        public string proid
        {
            get
            {
                if (!string.IsNullOrEmpty(Request.QueryString["proid"]))
                {
                    return Request.QueryString["proid"];
                }
                else
                {
                    return "";
                }
            }
        }

        public string pepid
        {
            get
            {
                if (!string.IsNullOrEmpty(Request.QueryString["pepid"]))
                {
                    return Request.QueryString["pepid"];
                }
                else
                {
                    return "";
                }
            }
        }
        
        protected void Page_Load(object sender, EventArgs e)
        {
            BindlinkmanInfo(pepid,proid);
            BindpromatInfo(pepid,proid);
        }
        private void BindlinkmanInfo(string pepid,string proid)
        {
            JDJS.BLL.Pro_linkman_View bll = new JDJS.BLL.Pro_linkman_View();

            JDJS.Model.Pro_linkman_View model = bll.GetModel(Convert.ToInt32(pepid), Convert.ToInt32(proid));
            lblinkman.Text = model.linkman;
            lbchenghu.Text = model.chenghu;
            lbcompany.Text = model.companyname;
            lbjob.Text = model.job;
            lbaddress.Text = model.address;
            lbphone.Text = model.phone;
            lbfax.Text = model.fax;
            lbEmail.Text = model.email;
            lbjuese.Text = model.juese;
            lbrek.Text = model.rek;
        }

        private void BindpromatInfo(string pepid,string proid)
        {
            string strwhere;
            //strwhere = " id in (select pepid from pro_linkman_list where proid =" + proid + ")";
            //JDJS.BLL.TClinkman bll = new JDJS.BLL.TClinkman();
            JDJS.BLL.pro_mat_view bll = new JDJS.BLL.pro_mat_view();
            strwhere = "  proid =" + proid + " and pepid=" + pepid;

            UcfarPager6.PageSize = 15;
            UcfarPager6.RecordCount = bll.GetCount(strwhere);//.Tables[0].Rows.Count;
            Repmatlist.DataSource = bll.GetList(UcfarPager6.PageSize, UcfarPager6.PageIndex, strwhere, "id", 1);

            //Repmatlist.DataSource = bll.GetList(strwhere);
            Repmatlist.DataBind();
        }
    }
}