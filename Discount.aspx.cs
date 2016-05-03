using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Xml;

namespace JDJS.Web
{
    public partial class Discount : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            string title = "";
            string company = "";
            string Htype = "";
            if (!string.IsNullOrEmpty(Request.QueryString["title"]))
            {
                title = LTP.Common.StringPlus.htmlstr(Request.QueryString["title"].ToString());
            }
            if (!string.IsNullOrEmpty(Request.QueryString["company"]))
            {
                company = LTP.Common.StringPlus.htmlstr(Request.QueryString["company"].ToString());
            }
            if (!string.IsNullOrEmpty(Request.QueryString["Htype"]))
            {
                Htype = LTP.Common.StringPlus.htmlstr(Request.QueryString["Htype"].ToString());
            }
            else
            {
                Htype = "不限";
            }
            if (!IsPostBack)
            {
              
                //cid = XMLOperate("dsFile.xml", "dscider");
                GetTheDiscount(title, company,Htype);
                dctitle.Text = title;
                dccompany.Text = company;
                DropDownList1.SelectedItem.Text=Htype;
                //DropDownList1.Items.FindByText(Htype).Selected=true; 

            }
        }
        public string GetTheDiscount(string title,string company,string Htype)
        {

            string strwhere=" 1=1 ";
            JDJS.BLL.Discount_Table bll = new JDJS.BLL.Discount_Table();
            if (Htype != "不限")
            {
                Htype = " and Htype='" + Htype + "'";
            }
            else
            {
                Htype = "";
            }
            if (!string.IsNullOrEmpty(title))
            {
                title = " and title like '%" + title + "%'";
            }
            if (!string.IsNullOrEmpty(company))
            {
                company = " and company like '%" + company + "%'";
            }
            strwhere = strwhere + title + company + Htype + " and dpflag=0";
            Pager.PageSize = 20;
            Pager.RecordCount = bll.GetCount(strwhere);//.Tables[0].Rows.Count
            Discnt.DataSource = bll.GetList(Pager.PageSize, Pager.PageIndex, strwhere, "id", 1);
            Discnt.DataBind();
            

            //JDJS.Model.dsrecord model = bll1.GetList(strwhere);


            return "";
        }

        protected void ImageButton1_Click(object sender, ImageClickEventArgs e)
        {
            string SeachTo = "./Discount.aspx?1=1";
            if (!string.IsNullOrEmpty(dctitle.Text.Trim()))
            {
                SeachTo += "&title=" + LTP.Common.StringPlus.htmlstr(dctitle.Text.Trim());
            }
            if (!string.IsNullOrEmpty(dccompany.Text.Trim()))
            {
                SeachTo += "&company=" + LTP.Common.StringPlus.htmlstr(dccompany.Text.Trim());
            }
            if (!string.IsNullOrEmpty(DropDownList1.Text.Trim()))
            {
                SeachTo += "&Htype=" + LTP.Common.StringPlus.htmlstr(DropDownList1.Text.Trim());
            }
         
            Response.Redirect(SeachTo);
        }
    }
}