using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using PageControl;
using System.Text.RegularExpressions;

namespace JDJS.Web.ProjectGL
{
    public partial class Companyinfo : System.Web.UI.Page
    {
        public string pcid
        {
            get
            {
                if (!string.IsNullOrEmpty(Request.QueryString["id"]))
                {
                    return Request.QueryString["id"];
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
                BindInfo(pcid);
                BindInfo2(Convert.ToInt32(pcid));
            }
            else
            {
                Response.Redirect("Login.aspx");
            }
        }
        private void BindInfo(string Id)
        {
            string strwhere;
            //strwhere = " id in (select pepid from pro_linkman_list where proid =" + proid + ")";
            //JDJS.BLL.TClinkman bll = new JDJS.BLL.TClinkman();
            JDJS.BLL.TCcompany bll = new JDJS.BLL.TCcompany();
            strwhere = "  pcid =" + Id;
            if (bll.GetCount(strwhere) > 0)
            {
                RepCompany.DataSource = bll.GetList(strwhere);
                RepCompany.DataBind();

            }
            else
            {

            }
        }
        private void BindInfo2(int Id)
        {
           
            JDJS.BLL.TCcompany bll = new JDJS.BLL.TCcompany();
            JDJS.Model.TCcompany model = bll.GetModel(Id);

            JDJS.BLL.project_inforbase probll = new JDJS.BLL.project_inforbase();
            Pager.PageSize = 24;
            Pager.RecordCount = probll.GetCount("1=1" + " and attcmp like '%" + model.company + "%'");
            Repeaterpro.DataSource = probll.GetList(Pager.PageSize, Pager.PageIndex, "1=1" + " and attcmp like '%" + model.company + "%'", "id", 1);
            //Repeaterpro.DataSource = probll.GetList(100, "1=1" + " and attcmp like '%" + model.company + "%'", "id");
            Repeaterpro.DataBind();


           
            JDJS.BLL.TClinkman pbll = new JDJS.BLL.TClinkman();

            string strwhere = " and companyname='" + model.company + "'";
            //Labcnt.Text = (pbll.GetCount("1=1" + strwhere)).ToString() + "人";
            RepInfo.DataSource = pbll.GetList("1=1" + strwhere);
            RepInfo.DataBind();
        }
        public string NewStr(string dt)
        {
            try
            {
                DateTime newdt = DateTime.Parse(dt);
                if (Math.Abs(LTP.Common.TimeParser.DayDiff(DateTime.Now, newdt)) < 7)
                {
                    return "<img src=\"style/Icons/New.gif\" />";
                }
                else
                {
                    return "";
                }
            }
            catch
            {
                return "";
            }
        }
        public string ReplaceStr(string content, string regularexpression, string changestring)
        {
            //string regularexpression = @"https?://(\w*:\w*@)?[-\w.]+(:\d+)?(/([\w/_.]*(\?\S+)?)?)?";


            try
            {
                Regex regex = new Regex(regularexpression);
                Regex regex2 = new Regex(@"""");
                Regex regex3 = new Regex(@"<BR>");
                string str = regex2.Replace(content, changestring);
                str = regex3.Replace(str, changestring);
                str = regex.Replace(str, changestring);
                return str;
            }
            catch
            {


                return content;
            }

        }
    }
}