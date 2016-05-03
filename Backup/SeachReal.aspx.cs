using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using PageControl;

namespace JDJS.Web
{
    public partial class SeachReal : PageBase
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                Seach();
            }
        }
        private List<string> GetlistKey(string type)
        {
            List<string> listKey = new List<string>();
            if (type == "1")
            {
                listKey.Add("zname");
                listKey.Add("standard");
            }
            else if (type == "2")
            {
                listKey.Add("standard");
                listKey.Add("zname");
                
            }
            else
            {
                listKey.Add("zname");
                listKey.Add("standard");
            }
            return listKey;
        }
        private void BindInfo(List<string> listKey, string KeyWord, string strwhere)
        {
            JDJS.BLL.real_material_data bll = new JDJS.BLL.real_material_data();
            Pager.PageSize = 24;
            Pager.RecordCount = bll.GetCount(listKey, KeyWord, strwhere, "ptime desc");//.Tables[0].Rows.Count;
            RepSeach.DataSource = bll.GetList(Pager.PageSize, Pager.PageIndex, listKey, KeyWord, strwhere, "ptime desc");
            RepSeach.DataBind();
        }
        protected void btnSeach_Click(object sender, EventArgs e)
        {
            string SeachTo = "SeachReal.aspx?Type=" + LTP.Common.StringPlus.htmlstr(ddlOrder.SelectedValue);
            if (!string.IsNullOrEmpty(txtTitle.Text.Trim()))
            {
                SeachTo += "&KeyWord=" + LTP.Common.StringPlus.htmlstr(txtTitle.Text.Trim());
            }
            if (!string.IsNullOrEmpty(txtClass.Text.Trim()))
            {
                SeachTo += "&Class=" + LTP.Common.StringPlus.htmlstr(txtClass.Text.Trim());
            }
            if (!string.IsNullOrEmpty(txtBg.Text.Trim()))
            {
                SeachTo += "&Begin=" + LTP.Common.StringPlus.htmlstr(txtBg.Text.Trim());
            }
            if (!string.IsNullOrEmpty(txtEnd.Text.Trim()))
            {
                SeachTo += "&End=" + LTP.Common.StringPlus.htmlstr(txtEnd.Text.Trim());
            }
            if (!string.IsNullOrEmpty(txtCpname.Text.Trim()))
            {
                SeachTo += "&Cpname=" + LTP.Common.StringPlus.htmlstr(txtCpname.Text.Trim());
            }
            Response.Redirect(SeachTo);
        }
        private void Seach()
        {
            string KeyWord = "";
            string cls = "";
            string type = "";
            string cpname = "";
            string Begin = "";
            string End = "";
            if (!string.IsNullOrEmpty(Request.QueryString["KeyWord"]))
            {
                KeyWord = LTP.Common.StringPlus.htmlstr(Request.QueryString["KeyWord"]);
            }
            if (!string.IsNullOrEmpty(Request.QueryString["Cpname"]))
            {
                cpname = LTP.Common.StringPlus.htmlstr(Request.QueryString["Cpname"]);
            }
            if (!string.IsNullOrEmpty(Request.QueryString["Class"]))
            {
                cls = LTP.Common.StringPlus.htmlstr(Request.QueryString["Class"]);
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
            string strwhere = "1=1";
            if (!string.IsNullOrEmpty(cls))
            {
                strwhere += " and class like '%" + cls + "%' ";
            }
            if (!string.IsNullOrEmpty(cpname))
            {
                strwhere += " and cpname like '%" + cpname + "%' ";
            }
            if (!string.IsNullOrEmpty(Begin))
            {
                strwhere += " and stime>'" + Begin + "' ";
            }
            if (!string.IsNullOrEmpty(End))
            {
                strwhere += " and stime<'" + End + "' ";
            }
            BindInfo(GetlistKey(type), KeyWord, strwhere);
        }

        public string GetCpName(string id)
        {
            JDJS.BLL.material_company bll = new BLL.material_company();
            JDJS.Model.material_company model = bll.GetModel(id);
            if (model != null)
            {
                return model.company;
            }
            else
            {
                return "";
            }
        }

        public string Bstr(string id, string bid)
        {
            if (!string.IsNullOrEmpty(bid))
            {
                return "<a href=\"RealDetail.aspx?Id="+id+"\">本站特供价</a><br />";
            }
            else
            {
                return "";
            }
        }

        public string GetUrl(string mid)
        {
            if (mid == "1")
            {
                return "Rgxj";
            }
            else
            {
                return "Gys";
            }
        }

        protected void lbQuite_Click(object sender, EventArgs e)
        {
            List<string> idlist = new List<string>();
            foreach (RepeaterItem item in this.RepSeach.Items)
            {
                CheckBox check = (CheckBox)item.FindControl("ckBox");
                if (check != null && check.Checked == true)
                {
                    HiddenField fdval = (HiddenField)item.FindControl("hfValue");
                    if (fdval != null && !string.IsNullOrEmpty(fdval.Value))
                    {
                        idlist.Add(fdval.Value);
                    }
                }
            }
            if (idlist.Count > 1)
            {
                Session["Quiet"] = idlist;
                Session["FromPage"] = HttpContext.Current.Request.Url.PathAndQuery;
                Response.Redirect("Quite.aspx");
            }
            else
            {
                LTP.Common.MessageBox.Show(this.Page, "必须选择一条以上记录！");
            }
        }
       
    }
}
