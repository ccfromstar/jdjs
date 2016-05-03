using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace JDJS.Web
{
    public partial class Wykd : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            string unit, deputy, address, post, linkman, sex, duty, phone, handset, fax, email, brief, pruduct, needinfor, ptime, ip, member, postadd, companyadd, url,newcode;
            newcode = "";
            unit = LTP.Common.StringPlus.htmlstr(txtCp.Text);
            deputy = LTP.Common.StringPlus.htmlstr(txtFr.Text);
            address = LTP.Common.StringPlus.htmlstr(txtKw.Text);
            post = LTP.Common.StringPlus.htmlstr(txtPost.Text);
            sex = "";
            duty = LTP.Common.StringPlus.htmlstr(txtZw.Text);
            linkman = LTP.Common.StringPlus.htmlstr(txtLxr.Text);
            phone = LTP.Common.StringPlus.htmlstr(txtPhone.Text);
            handset = LTP.Common.StringPlus.htmlstr(txtMobile.Text);
            email = LTP.Common.StringPlus.htmlstr(txtQQ.Text);
            fax = LTP.Common.StringPlus.htmlstr(txtFax.Text);
            brief = LTP.Common.StringPlus.htmlstr(txtJj.Text);
            pruduct = LTP.Common.StringPlus.htmlstr(txtPro.Text);
            needinfor = "";
            ptime = DateTime.Now.ToString();
            ip = Request.UserHostAddress;
            member ="D类网员";
            companyadd = "";
            url = LTP.Common.StringPlus.htmlstr(txtWebSite.Text);
            postadd = LTP.Common.StringPlus.htmlstr(txtKw.Text);
            JDJS.BLL.member bll = new JDJS.BLL.member();
            bll.ReastyUser(unit, deputy, address, post, linkman, sex, duty, phone, handset, fax, email, brief, pruduct, needinfor, ptime, ip, member, postadd, companyadd, url,newcode);
        }
    }
}
