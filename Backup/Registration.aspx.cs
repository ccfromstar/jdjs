using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace JDJS.Web
{
    public partial class Registration : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            int isReasty = 0;
            string unit, deputy, address, post, linkman, sex, duty, phone, handset, fax, email, brief, pruduct, needinfor, ptime, ip, member, postadd, companyadd, url,newcode;
            unit = LTP.Common.StringPlus.htmlstr(txtCp.Text);
            deputy = LTP.Common.StringPlus.htmlstr(txtFr.Text);
            address = LTP.Common.StringPlus.htmlstr(txtKw.Text);
            post = LTP.Common.StringPlus.htmlstr(txtPost.Text);
            sex = "";
            duty = LTP.Common.StringPlus.htmlstr(txtZw.Text);
            linkman = LTP.Common.StringPlus.htmlstr(txtLxr.Text);
            phone = LTP.Common.StringPlus.htmlstr(txtPhone.Text);
            handset = LTP.Common.StringPlus.htmlstr(txtMobile.Text);
            email = LTP.Common.StringPlus.htmlstr(txtEmail.Text);
            fax = LTP.Common.StringPlus.htmlstr(txtFax.Text);
            brief = LTP.Common.StringPlus.htmlstr(txtJj.Text);
            pruduct = LTP.Common.StringPlus.htmlstr(txtPro.Text);
            needinfor = LTP.Common.StringPlus.htmlstr(txtXq.Text);
            ptime = DateTime.Now.ToString();
            ip = Request.UserHostAddress;
            member = LTP.Common.StringPlus.htmlstr(ddlType.SelectedValue);
            companyadd = LTP.Common.StringPlus.htmlstr(txtAddress.Text);
            url = LTP.Common.StringPlus.htmlstr(txtWebSite.Text);
            postadd = LTP.Common.StringPlus.htmlstr(txtKw.Text);
            newcode = LTP.Common.StringPlus.htmlstr(txtsyzh.Text);


            JDJS.BLL.member_point pbll = new JDJS.BLL.member_point();
            JDJS.Model.member_point modeljf = new JDJS.Model.member_point();

            JDJS.BLL.cust_base_info cbll = new JDJS.BLL.cust_base_info();
            JDJS.Model.cust_base_info cmodel = new JDJS.Model.cust_base_info();
            
            JDJS.BLL.member bll = new JDJS.BLL.member();

            if (cbll.GetCount(" newcode=" + "'" + newcode + "'") > 0)
            {
                LTP.Common.MessageBox.Show(this.Page, "试用账号已被注册，请更换其他账号名称！");
            }
            else
            {
                modeljf.id = newcode;
                modeljf.JDB = 10;
                modeljf.point = 0;
                modeljf.last_login_time = DateTime.Now;

                pbll.Add(modeljf);


                cmodel.address = companyadd;
                cmodel.bbspwd = newcode;
                cmodel.brief = brief;
                cmodel.cflag = 1;
                cmodel.custtype = member;
                cmodel.deputy = deputy;
                cmodel.duty = duty;
                cmodel.email = email;
                cmodel.fax = fax;
                cmodel.linkman = linkman;
                cmodel.mailadder = address;
                cmodel.mailcount = 0;
                cmodel.mailman = linkman;
                cmodel.mailpost = post;
                cmodel.mailunit = unit;
                cmodel.mobile = handset;
                cmodel.needinfo = needinfor;
                cmodel.newcode = newcode;
                cmodel.phone = phone;
                cmodel.post = post;
                cmodel.pwd = newcode;
                cmodel.product = pruduct;
                cmodel.seachplace = "上海(试用)";
                cmodel.sendtype = -1;
                cmodel.unit = unit;
                cmodel.url = url;
                cmodel.webshow = 0;
                cbll.Add(cmodel);

                isReasty = bll.ReastyUser(unit, deputy, address, post, linkman, sex, duty, phone, handset, fax, email, brief, pruduct, needinfor, ptime, ip, member, postadd, companyadd, url,newcode);
                if (isReasty > 0)
                {
                    PanHasReg.Visible = true;
                    PanReg.Visible = false;
                    ClearAll();
                }
                else
                {
                }
            }
        }

        private void ClearAll()
        {
            txtCp.Text = "";
            txtFr.Text = "";
            txtKw.Text = "";
            txtPost.Text = "";
            txtAddress.Text = "";
            txtLxr.Text = "";
            txtZw.Text = "";
            txtPhone.Text = "";
            txtMobile.Text = "";
            txtEmail.Text = "";
            txtFax.Text = "";
            txtJj.Text = "";
            txtPro.Text = "";
            txtXq.Text = "";
            txtWebSite.Text = "";
            txtsyzh.Text = "";
        }

        protected void btnOk_Click(object sender, EventArgs e)
        {
            PanOk.Visible = false;
            PanReg.Visible = true;
            ddlType.Items.Clear();
            //ddlType.Items.Add("1类");
            //ddlType.Items.Add("2类");
            ddlType.Items.Add("3类");
            //ddlType.Items.Add("4类");
            //ddlType.Items.Add("D类");
            ddlType.SelectedIndex = 0;
        }

        protected void btnClear_Click(object sender, EventArgs e)
        {
            ClearAll();
        }
    }
}
