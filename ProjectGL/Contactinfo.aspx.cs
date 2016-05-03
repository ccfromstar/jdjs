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
    public partial class Contactinfo : System.Web.UI.Page
    {
        public string id
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
                BindInfo(id);
                BindInfo2(Convert.ToInt32(id));
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
            JDJS.BLL.TClinkman bll = new JDJS.BLL.TClinkman();
            strwhere = "  id =" + Id ;
            if (bll.GetCount(strwhere) > 0)
            {
                RepContact.DataSource = bll.GetList(strwhere);
                RepContact.DataBind();
              
            }
            else
            {
                
            }
        }
        private void BindInfo2(int Id)
        {

            string strwhere;
            //strwhere = " id in (select pepid from pro_linkman_list where proid =" + proid + ")";
            //JDJS.BLL.TClinkman bll = new JDJS.BLL.TClinkman();
            JDJS.BLL.Pro_linkman_View bll = new JDJS.BLL.Pro_linkman_View();
            strwhere = "1=1 and  pepid =" + Id.ToString() ;
            if (bll.GetCount(strwhere) > 0)
            {

                Panelpro.Visible = true;
                Panelpro2.Visible = false;
                Pager.PageSize = 24;
                Pager.RecordCount = bll.GetCount(strwhere);
                Repeaterpro.DataSource = bll.GetList(Pager.PageSize, Pager.PageIndex, strwhere, "id", 1);

                Repeaterpro.DataBind();
                
                //Repproowner.DataSource = bll.GetList(strwhere);
                //Repproowner.DataBind();
                
            }
            else
            {
                Panelpro.Visible = false;
                Panelpro2.Visible = true;
                JDJS.BLL.TClinkman bll2 = new JDJS.BLL.TClinkman();
                JDJS.Model.TClinkman model = bll2.GetModel(Id);

                JDJS.BLL.project_inforbase probll = new JDJS.BLL.project_inforbase();
                Pager2.PageSize = 24;
                Pager2.RecordCount = probll.GetCount("1=1" + " and attcmp like '%" + model.companyname + "%'" + " and (proowner like '%" + model.linkman + "%' or prodesigner like '%" + model.linkman + "%' or probuilder like '%" + model.linkman + "%' )");
                Repeaterpro2.DataSource = probll.GetList(Pager2.PageSize, Pager2.PageIndex, "1=1" + " and attcmp like '%" + model.companyname + "%'" + " and (proowner like '%" + model.linkman + "%' or prodesigner like '%" + model.linkman + "%' or probuilder like '%" + model.linkman + "%' )", "id", 1);

                Repeaterpro2.DataBind();

            }        

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