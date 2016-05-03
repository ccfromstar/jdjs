using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace JDJS.Web.ProjectGL
{
    public partial class MatBuyInfo : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            string Id = "";

            if (!string.IsNullOrEmpty(Request.QueryString["Id"]))
            {

                Id = Request.QueryString["Id"];

                /* if (!LTP.Common.UserInfo.IsLogin())
                 {

                     Session["FromPage"] = HttpContext.Current.Request.Url.PathAndQuery;
                     Response.Redirect("Login.aspx");
                 

                 }
                 else
                 {
                     Session["FromPage"] = null;
                     BindInfo(int.Parse(Id));//登录后
                 }*/
                BindInfo(int.Parse(Id));
            }
        }
        private void BindInfo(int Id)
        {
            string NULLdate = "不限";
            string NULLstr = "未透露";

            JDJS.BLL.pro_mat_view bll = new JDJS.BLL.pro_mat_view();
            JDJS.Model.pro_mat_view model = bll.GetModel(Id);
            //JDJS.BLL.cust_base_info cbll = new JDJS.BLL.cust_base_info();
            //JDJS.Model.cust_base_info cmodel = ((JDJS.Model.cust_base_info)Session["User"]);


            matname.Text = model.matname;
            DateTime dt = model.ptime;

            ptime.Text = dt.ToShortDateString().ToString();
            switch (model.recstate)
            {
                case -1:
                    recstate.Text = "未启动采购";
                    break;
                case 0:
                    recstate.Text = "采购进行中";
                    break;
                case 1:
                    recstate.Text = "采购已完成";
                    break;
                default: break;
            }

            proname.Text = model.proname;
            proname.NavigateUrl = "CustProShow.aspx?proid=" + model.proid.ToString();

            //matunit.Text = model.matunit;
            //matclass.Text = model.matclass;
            //matxh.Text = model.matxh;
            //matgg.Text = model.matgg;
            //matrek.Text = model.matrek;
            //matamount.Text = model.matamount;


            if (!string.IsNullOrEmpty(model.matunit))
            {
                matunit.Text = model.matunit;
            }
            else
            {
                matunit.Text = "  ";
            }

            if (!string.IsNullOrEmpty(model.matclass))
            {
                matclass.Text = model.matclass;
            }
            else
            {
                matclass.Text = NULLdate;
            }

            if (!string.IsNullOrEmpty(model.matxh))
            {
                matxh.Text = model.matxh;
            }
            else
            {
                matxh.Text = NULLstr;
            }

            if (!string.IsNullOrEmpty(model.matgg))
            {
                matgg.Text = model.matgg;
            }
            else
            {
                matgg.Text = NULLstr;
            }



            if (!string.IsNullOrEmpty(model.matrek))
            {
                matrek.Text = model.matrek;
            }
            else
            {
                matrek.Text = "无";
            }

            if (!string.IsNullOrEmpty(model.matamount))
            {
                matamount.Text = model.matamount;
            }
            else
            {
                matamount.Text = NULLstr;
            }

            if (!string.IsNullOrEmpty(model.matlprice))
            {
                matlprice.Text = model.matlprice;
            }
            else
            {
                matlprice.Text = NULLstr;
            }



            dt = model.stime;
            if (dt.ToShortDateString().ToString() != "0001/1/1" && dt.ToShortDateString().ToString() != "0001-1-1")
            {

                stime.Text = dt.ToShortDateString().ToString();
            }
            else
            {
                stime.Text = NULLdate;
            }




            dt = model.ftime;
            if (dt.ToShortDateString().ToString() != "0001/1/1" && dt.ToShortDateString().ToString() != "0001-1-1")
            {

                ftime.Text = dt.ToShortDateString().ToString();
            }
            else
            {
                ftime.Text = NULLdate;
            }



            if (!string.IsNullOrEmpty(model.gycompany))
            {
                gycompany.Text = model.gycompany;
            }
            else
            {
                gycompany.Text = NULLstr;
            }

            if (!string.IsNullOrEmpty(model.matcount))
            {
                matcount.Text = model.matcount;
            }
            else
            {
                matcount.Text = NULLstr;
            }

            if (!string.IsNullOrEmpty(model.matpprice))
            {
                matpprice.Text = model.matpprice;
            }
            else
            {
                matpprice.Text = NULLstr;
            }



            dt = model.btime;
            if (dt.ToShortDateString().ToString() != "0001/1/1" && dt.ToShortDateString().ToString() != "0001-1-1")
            {

                btime.Text = dt.ToShortDateString().ToString();
            }
            else
            {
                btime.Text = NULLstr;
            }

            linkman.Text = model.linkman;
            linkman.NavigateUrl = "Contactinfo.aspx?id=" + model.pepid.ToString();

            Lcompany.Text = model.company;
            Lcompany.NavigateUrl = "Companyinfo.aspx?id=" + model.pcid.ToString();
            
            //Loadlink(model.doman);


            //linkman.Text = "叶小姐";
            //phone.Text = "021-54591008-8009";

        }
        private void Loadlink(string doman)
        {
            //JDJS.BLL.Admin bll = new JDJS.BLL.Admin();
            //JDJS.Model.Admin model = bll.GetModel(doman);
            //linkman.Text = model.name;
            //phone.Text = model.phone;
        }
    }
}