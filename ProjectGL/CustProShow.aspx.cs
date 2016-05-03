using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace JDJS.Web.ProjectGL
{
    public partial class CustProShow : System.Web.UI.Page
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
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["AdminInfo"] != null)
            {
                BindInfo2(proid);
            }
            else
            {
                Response.Redirect("Login.aspx");
            }

        }
        private void BindInfo2(string Id)
        {

            JDJS.BLL.project_inforbase bll = new JDJS.BLL.project_inforbase();

            JDJS.Model.project_inforbase model = bll.GetModel(Convert.ToInt32(Id));
            Page.Title = "工程信息-" + model.proname + "-上海建定建设工程信息网";
            LabelID.Text = model.id.ToString();
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

            // lbaddress.Text = lbOther1.Text;
            // lbaddress.Font.Bold = lbOther1.Font.Bold;
            // lbaddress.Font.Size = lbOther1.Font.Size;
            // lbaddress.ForeColor = lbOther1.ForeColor;
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
            if (Bindproowner(proid))
            {
                lbowner.Visible = true;
                lbowner.Text = model.proowner;
            }
            if (Bindprodesigner(proid))
            {
                lbdesigner.Visible = true;
                lbdesigner.Text = model.prodesigner;
            }
            if (Bindprobuilder(proid))
            {
                lbbuilder.Visible = true;
                lbbuilder.Text = model.probuilder;
            }
            //lbowner.Text = model.proowner;
            //lbdesigner.Text = model.prodesigner;
            //lbbuilder.Text = model.probuilder;

        }
        private bool Bindproowner(string Id)
        {
            string strwhere;
            //strwhere = " id in (select pepid from pro_linkman_list where proid =" + proid + ")";
            //JDJS.BLL.TClinkman bll = new JDJS.BLL.TClinkman();
            JDJS.BLL.Pro_linkman_View bll = new JDJS.BLL.Pro_linkman_View();
            strwhere = "  proid =" + Id + " and compid=0";
            if (bll.GetCount(strwhere) > 0)
            {
                Repproowner.DataSource = bll.GetList(strwhere);
                Repproowner.DataBind();
                return false;
            }
            else
            {
                return true;

            }

        }
        private bool Bindprodesigner(string Id)
        {
            string strwhere;
            //strwhere = " id in (select pepid from pro_linkman_list where proid =" + proid + ")";
            //JDJS.BLL.TClinkman bll = new JDJS.BLL.TClinkman();
            JDJS.BLL.Pro_linkman_View bll = new JDJS.BLL.Pro_linkman_View();
            strwhere = "  proid =" + Id + " and compid=1";

            if (bll.GetCount(strwhere) > 0)
            {
                Repprodesigner.DataSource = bll.GetList(strwhere);
                Repprodesigner.DataBind();
                return false;
            }
            else
            {
                return true;

            }


        }
        private bool Bindprobuilder(string Id)
        {
            string strwhere;
            //strwhere = " id in (select pepid from pro_linkman_list where proid =" + proid + ")";
            //JDJS.BLL.TClinkman bll = new JDJS.BLL.TClinkman();
            JDJS.BLL.Pro_linkman_View bll = new JDJS.BLL.Pro_linkman_View();
            strwhere = "  proid =" + Id + " and compid=2";

            if (bll.GetCount(strwhere) > 0)
            {
                Repprobuilder.DataSource = bll.GetList(strwhere);
                Repprobuilder.DataBind();
                return false;
            }
            else
            {
                return true;

            }


        }
    }
}