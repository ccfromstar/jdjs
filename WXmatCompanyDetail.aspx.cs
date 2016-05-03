using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace JDJS.Web
{
    public partial class WXmatCompanyDetail : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            string Id = "";

            if (!string.IsNullOrEmpty(Request.QueryString["Id"]))
            {

                Id = Request.QueryString["Id"];
                //JDJS.BLL.project_inforbase bll = new JDJS.BLL.project_inforbase();

                BindCompany(Id);//未登录

            }

            string KeyWord = "";

            string type = "";
            string midcode = "";
            if (!string.IsNullOrEmpty(Request.QueryString["KeyWord"]))
            {
                KeyWord = LTP.Common.StringPlus.htmlstr(Request.QueryString["KeyWord"].ToString());
            }

            if (!string.IsNullOrEmpty(Request.QueryString["type"]))
            {
                type = Request.QueryString["type"].ToString();
            }

            if (!string.IsNullOrEmpty(Request.QueryString["midcode"]))
            {
                midcode = LTP.Common.StringPlus.htmlstr(Request.QueryString["midcode"].ToString());
            }
            if (!IsPostBack)
            {
                SeachAll(Id);
            }
        }

        private List<string> GetlistKey(string type)
        {
            List<string> listKey = new List<string>();
            if (type == "1")
            {
                listKey.Add("company");
                listKey.Add("zname");
                listKey.Add("standard");
                listKey.Add("class");
            }
            else if (type == "2")
            {
                listKey.Add("zname");
                listKey.Add("company");
                listKey.Add("standard");
                listKey.Add("class");
            }
            else if (type == "3")
            {
                listKey.Add("standard");
                listKey.Add("company");
                listKey.Add("zname");
                listKey.Add("class");

            }
            else if (type == "4")
            {
                listKey.Add("class");
                listKey.Add("company");
                listKey.Add("zname");
                listKey.Add("standard");
            }
            else
            {
                listKey.Add("company");
                listKey.Add("zname");
                listKey.Add("standard");
                listKey.Add("class");
            }
            return listKey;
        }

        private void BindInfo(List<string> listKey, string KeyWord, string strwhere)
        {
            JDJS.BLL.v_material_data bll = new JDJS.BLL.v_material_data();
            Pager.PageSize = 35;
            if (strwhere == "1=1" && string.IsNullOrEmpty(KeyWord))
            {
                Pager.RecordCount = 35;
                RepInfo.DataSource = bll.GetList(Pager.PageSize, Pager.PageIndex, listKey, KeyWord, " 1<>1 ", "ptime desc");
            }
            else
            {

                Pager.RecordCount = bll.GetCount(listKey, KeyWord, strwhere, "ptime desc");//.Tables[0].Rows.Count
                RepInfo.DataSource = bll.GetList(Pager.PageSize, Pager.PageIndex, listKey, KeyWord, strwhere, "ptime desc");

            }
            RepInfo.DataBind();
        }

        private void SeachAll(string cid)
        {
            string KeyWord = "";
            string type = "";
            string Begin = "";
            string End = "";
            string year = "";
            string month = "";
            string midcode = "";
            if (!string.IsNullOrEmpty(Request.QueryString["KeyWord"]))
            {
                KeyWord = LTP.Common.StringPlus.htmlstr(Request.QueryString["KeyWord"]);
            }
            if (!string.IsNullOrEmpty(Request.QueryString["Type"]))
            {
                type = LTP.Common.StringPlus.htmlstr(Request.QueryString["Type"]);
            }
            if (!string.IsNullOrEmpty(Request.QueryString["Begin"]))
            {
                Begin = LTP.Common.StringPlus.htmlstr(Request.QueryString["Begin"]);
            }
            if (!string.IsNullOrEmpty(Request.QueryString["End"]))
            {
                End = LTP.Common.StringPlus.htmlstr(Request.QueryString["End"]);
            }
            if (!string.IsNullOrEmpty(Request.QueryString["year"]))
            {
                year = LTP.Common.StringPlus.htmlstr(Request.QueryString["year"].ToString());
                year = " and year(stime)='" + year + "' ";
            }
            if (!string.IsNullOrEmpty(Request.QueryString["month"]))
            {
                month = LTP.Common.StringPlus.htmlstr(Request.QueryString["month"].ToString());
                month = " and month(stime)='" + month + "'";
            }
            if (!string.IsNullOrEmpty(Request.QueryString["midcode"]))
            {
                midcode = LTP.Common.StringPlus.htmlstr(Request.QueryString["midcode"].ToString());
                midcode = " and mid like '%" + midcode + "%'";
            }
            string strwhere = " cid='" + cid+"'";
            if (!string.IsNullOrEmpty(Begin))
            {
                strwhere += " and stime>'" + Begin + "' ";
            }
            if (!string.IsNullOrEmpty(End))
            {
                strwhere += " and stime<'" + End + "' ";
            }
            if (!string.IsNullOrEmpty(year))
            {
                strwhere += year;
            }
            if (!string.IsNullOrEmpty(month))
            {
                strwhere += month;
            }
            if (!string.IsNullOrEmpty(midcode))
            {
                strwhere += midcode;
            }
            BindInfo(GetlistKey(type), KeyWord, strwhere);
            txtTitle.Text = KeyWord;
            if (string.IsNullOrEmpty(type))
            {
                type = "2";
            }
            ddlOrder.ClearSelection();

            ddlOrder.Items.FindByValue(type).Selected = true;
            txtBg.Text = Begin; txtEnd.Text = End;
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

        protected void btnSeach_Click(object sender, EventArgs e)
        {
            string SeachTo = "WXmatCompanyDetail.aspx?Type=" + LTP.Common.StringPlus.htmlstr(ddlOrder.SelectedValue) + "&Id=" + Request.QueryString["Id"];
            if (!string.IsNullOrEmpty(txtTitle.Text.Trim()))
            {
                SeachTo += "&KeyWord=" + LTP.Common.StringPlus.htmlstr(txtTitle.Text.Trim());
            }
            if (!string.IsNullOrEmpty(txtBg.Text.Trim()))
            {
                SeachTo += "&Begin=" + LTP.Common.StringPlus.htmlstr(txtBg.Text.Trim());
            }
            if (!string.IsNullOrEmpty(txtEnd.Text.Trim()))
            {
                SeachTo += "&End=" + LTP.Common.StringPlus.htmlstr(txtEnd.Text.Trim());
            }
            Response.Redirect(SeachTo);
        }


    }
}