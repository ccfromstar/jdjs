using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace JDJS.Web
{
    public partial class DsSupplySeach : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

           
                string midcode = "";
                string cidcode = "";
                string company = "";
                string keyword = "";
                string orderfl = "";
                string classstr = "";
                string stanstr = "";
                string minpr = "不限"; string maxpr = "不限";

                int desc;
               
                if (!string.IsNullOrEmpty(Request.QueryString["mid"]))
                {
                    midcode = LTP.Common.StringPlus.htmlstr(Request.QueryString["mid"].ToString());
                }
                if (!string.IsNullOrEmpty(Request.QueryString["keyword"]))
                {
                    keyword = LTP.Common.StringPlus.htmlstr(Request.QueryString["keyword"].ToString());
                    //keyw.Text = keyword;
                }

                if (!string.IsNullOrEmpty(Request.QueryString["stanstr"]))
                {
                    stanstr = LTP.Common.StringPlus.htmlstr(Request.QueryString["stanstr"].ToString());
                    //dsstan.Text = stanstr;
                }

                if (!string.IsNullOrEmpty(Request.QueryString["classstr"]))
                {
                    classstr = LTP.Common.StringPlus.htmlstr(Request.QueryString["classstr"].ToString());
                    //dsclass.Text = classstr;
                }

                if (!string.IsNullOrEmpty(Request.QueryString["company"]))
                {
                    company = LTP.Common.StringPlus.htmlstr(Request.QueryString["company"].ToString());
                    //dscomp.Text = company;
                }
                if (!string.IsNullOrEmpty(Request.QueryString["orderfl"]))
                {
                    orderfl = LTP.Common.StringPlus.htmlstr(Request.QueryString["orderfl"].ToString());
                }
                else
                {
                    orderfl = "id";
                }
                if (!string.IsNullOrEmpty(Request.QueryString["desc"]))
                {
                    desc = Convert.ToInt32(LTP.Common.StringPlus.htmlstr(Request.QueryString["desc"].ToString()));
                }
                else
                {
                    desc = 1;
                }

                if (!string.IsNullOrEmpty(Request.QueryString["minpr"]))
                {
                    minpr = LTP.Common.StringPlus.htmlstr(Request.QueryString["minpr"].ToString());
                    //minprice.Text = minpr.ToString();
                }
                else
                {
                    minpr = "不限";
                    //minprice.Text = "不限";
                }

                if (!string.IsNullOrEmpty(Request.QueryString["maxpr"]))
                {
                    maxpr = LTP.Common.StringPlus.htmlstr(Request.QueryString["maxpr"].ToString());
                    //maxprice.Text = maxpr.ToString();
                }
                else
                {
                    maxpr = "不限";
                    //maxprice.Text = "不限";
                }

                if  (!IsPostBack)
                {
                    BindInfo(cidcode, midcode, keyword, orderfl, desc, classstr, stanstr, Getprice(minpr), Getprice(maxpr), company);
                    keyw.Text = keyword;
                    dsclass.Text = classstr;
                    dsstan.Text = stanstr;
                    minprice.Text = Getprice(minpr);
                    maxprice.Text = Getprice(maxpr);
                    dscomp.Text = company;
                 }
            

            //this.dstime.Attributes.Add("style", "");
            //this.dsptime.Attributes.Add("onfocus", "javascript:document.getElementById('dstime').style.display=''");
            //dsptime.Focus();

        }
        private void BindInfo(string cid, string mid, string keyword, string orderf, int desc, string classstr, string stanstr, string minpr, string maxpr, string company)
        {
            string strwhere = " 1=1 ";
            JDJS.BLL.mat_tree_View bll = new JDJS.BLL.mat_tree_View();
            if (!string.IsNullOrEmpty(cid))
            {
                cid = " and cid='" + cid + "'";
            }
            if (!string.IsNullOrEmpty(mid))
            {
                mid = " and mid like '%" + mid + "%'";
            }
            if (!string.IsNullOrEmpty(keyword))
            {
                keyword = " and zname like '%" + keyword + "%'";
            }
            if (!string.IsNullOrEmpty(classstr))
            {
                classstr = " and class like '%" + classstr + "%'";
            }

            if (!string.IsNullOrEmpty(stanstr))
            {
                stanstr = " and standard like '%" + stanstr + "%'";
            }


            if (!string.IsNullOrEmpty(company))
            {
                company = " and company like '%" + company + "%'";
            }
            
            if (minpr!="不限")
            {
                minpr = " and lprice>=" + minpr;
            }
            else
            {
                minpr = "";
            }

            if (maxpr != "不限")
            {
                maxpr = " and lprice<=" + maxpr;
            }
            else
            {
                maxpr = "";
            }


            if (string.IsNullOrEmpty(orderf))
            {
                orderf = "id";
            }
            strwhere = strwhere + cid + mid + keyword +classstr +stanstr+company+minpr+maxpr+" and dsflag=1";
            Pager.PageSize = 20;
            Pager.RecordCount = bll.GetCount(strwhere);//.Tables[0].Rows.Count
            matspecial.DataSource = bll.GetdsList(Pager.PageSize, Pager.PageIndex, strwhere, orderf, desc);
            matspecial.DataBind();

            //matitem.DataSource = bll.GetAllList();
            //matitem.DataBind();
        }
        public string Getpic(string pic)
        {
            if (string.IsNullOrEmpty(pic))
            {
                pic = "../uploads/nullpic.jpg";
            }
            return pic;
        }

        public string Getcompany(string cid)
        {
            JDJS.BLL.ds_data bll = new JDJS.BLL.ds_data();
            JDJS.Model.ds_data model = bll.GetModel(cid);
            string url = model.mulu+"/dsDefault.aspx";
            return url;
        }

        public string NewStr(string dt)
        {
            try
            {
                //DateTime newdt = DateTime.Parse(dt);
                string riqi = Convert.ToDateTime(dt).ToShortDateString();
                return riqi;
            }
            catch
            {
                return "";
            }
        }

      /* public string Geturl(string order, int desc)
        {
            string url = "./DsSupplySeach.aspx?";
            string midcode = ""; string keyword = "";
            if (!string.IsNullOrEmpty(Request.QueryString["mid"]))
            {
                midcode = LTP.Common.StringPlus.htmlstr(Request.QueryString["mid"].ToString());
            }
            if (!string.IsNullOrEmpty(Request.QueryString["keyword"]))
            {
                keyword = LTP.Common.StringPlus.htmlstr(Request.QueryString["keyword"].ToString());
            }
            url = url + "mid=" + midcode + "&keyword=" + keyword + "&orderfl=" + order + "&desc=" + desc.ToString();
       
            return url;
        }*/
        protected void Geturl(string order, int desc)
        {
            string descstr = desc.ToString();
            string SeachTo = "./DsSupplySeach.aspx?1=1";
            if (!string.IsNullOrEmpty(keyw.Text.Trim()))
            {
                SeachTo += "&keyword=" + LTP.Common.StringPlus.htmlstr(keyw.Text.Trim());
            }
            if (!string.IsNullOrEmpty(dsclass.Text.Trim()))
            {
                SeachTo += "&classstr=" + LTP.Common.StringPlus.htmlstr(dsclass.Text.Trim());
            }
            if (!string.IsNullOrEmpty(dsstan.Text.Trim()))
            {
                SeachTo += "&stanstr=" + LTP.Common.StringPlus.htmlstr(dsstan.Text.Trim());
            }
            if (!string.IsNullOrEmpty(dscomp.Text.Trim()))
            {
                SeachTo += "&company=" + LTP.Common.StringPlus.htmlstr(dscomp.Text.Trim());
            }
            if (!string.IsNullOrEmpty(minprice.Text.Trim()))
            {
                SeachTo += "&minpr=" + LTP.Common.StringPlus.htmlstr(minprice.Text.Trim());
            }
            if (!string.IsNullOrEmpty(maxprice.Text.Trim()))
            {
                SeachTo += "&maxpr=" + LTP.Common.StringPlus.htmlstr(maxprice.Text.Trim());
            }
            if (!string.IsNullOrEmpty(order.Trim()))
            {
                SeachTo += "&orderfl=" + LTP.Common.StringPlus.htmlstr(order.Trim());
            }
            if (!string.IsNullOrEmpty(descstr.Trim()))
            {
                SeachTo += "&desc=" + LTP.Common.StringPlus.htmlstr(descstr.Trim());
            }

            Response.Redirect(SeachTo);
            //BindInfo("", "", keyw.Text, order, desc, dsclass.Text, dsstan.Text, Getprice(minprice.Text), Getprice(maxprice.Text), dscomp.Text);
        }
        public string GetSupplyUrl(string  id)
        {

            //int Id = int.Parse(id);
            //string url = HttpContext.Current.Request.Url.Host.ToString();
            string url = ""; 
            JDJS.BLL.mat_tree_View bll = new JDJS.BLL.mat_tree_View();
            JDJS.Model.mat_tree_View Mmodel = bll.GetModel(id);
            string cid = Mmodel.cid;
            JDJS.BLL.ds_data bllds = new JDJS.BLL.ds_data();
            JDJS.Model.ds_data modelds = bllds.GetModel(cid);
            string mulu = modelds.mulu;

            url = url + "/" + mulu + "/" ;
            return url;
        }

        protected void ImageButton1_Click(object sender, ImageClickEventArgs e)
        {
            //string url = "./DsSupplySeach.aspx?";
            string SeachTo = "./DsSupplySeach.aspx?1=1";
            if (!string.IsNullOrEmpty(keyw.Text.Trim()))
            {
                SeachTo += "&keyword=" + LTP.Common.StringPlus.htmlstr(keyw.Text.Trim());
            }
            if (!string.IsNullOrEmpty(dsclass.Text.Trim()))
            {
                SeachTo += "&classstr=" + LTP.Common.StringPlus.htmlstr(dsclass.Text.Trim());
            }
            if (!string.IsNullOrEmpty(dsstan.Text.Trim()))
            {
                SeachTo += "&stanstr=" + LTP.Common.StringPlus.htmlstr(dsstan.Text.Trim());
            }
            if (!string.IsNullOrEmpty(dscomp.Text.Trim()))
            {
                SeachTo += "&company=" + LTP.Common.StringPlus.htmlstr(dscomp.Text.Trim());
            }
            if (!string.IsNullOrEmpty(minprice.Text.Trim()))
            {
                SeachTo += "&minpr=" + LTP.Common.StringPlus.htmlstr(minprice.Text.Trim());
            }
            if (!string.IsNullOrEmpty(maxprice.Text.Trim()))
            {
                SeachTo += "&maxpr=" + LTP.Common.StringPlus.htmlstr(maxprice.Text.Trim());
            }
            Response.Redirect(SeachTo);
            
            //BindInfo("", "", keyw.Text, "", 1, dsclass.Text, dsstan.Text, Getprice(minprice.Text), Getprice(maxprice.Text), dscomp.Text);
        }
        public string Getprice(string pricestr)
        {

            float price;
            try
            {
                price = float.Parse(pricestr);
                pricestr = price.ToString();
            }
            catch
            {
                pricestr = "不限";
            }
            //int Id = int.Parse(id);
            //string url = HttpContext.Current.Request.Url.Host.ToString();



            return pricestr;
        }

        protected void LinkButton1_Click(object sender, EventArgs e)
        {
            Geturl("id", 1);
        }

        protected void exce_Click(object sender, EventArgs e)
        {
            Geturl("lprice", 1);
        }

        protected void chea_Click(object sender, EventArgs e)
        {
            Geturl("lprice", 0);
        }

        protected void ImageButton2_Click(object sender, ImageClickEventArgs e)
        {
            Response.Redirect("./DsCompanySeach.aspx");
        }
    }
}