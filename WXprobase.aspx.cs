using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using PageControl;
using System.Text.RegularExpressions;
namespace JDJS.Web
{
    public partial class WXprobase : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
             
                Seach();
               
            }
        }
        private void Seach()
        {
            string KeyWord = "";
          
            string Type = "";
           
            string buildplace = "";
           

            if (!string.IsNullOrEmpty(Request.QueryString["KeyWord"]))
            {
                KeyWord = LTP.Common.StringPlus.htmlstr(Request.QueryString["KeyWord"]);
            }
          
            if (!string.IsNullOrEmpty(Request.QueryString["Type"]))
            {
                Type = LTP.Common.StringPlus.htmlstr(Request.QueryString["Type"]);
            }
          
            if (!string.IsNullOrEmpty(Request.QueryString["buildplace"]))
            {
                buildplace = LTP.Common.StringPlus.htmlstr(Request.QueryString["buildplace"]);
            }


         


            string strwhere = "1=1";

            if (!string.IsNullOrEmpty(KeyWord))
            {
                strwhere += " and proname like '%" + KeyWord + "%' ";
            }

         

            if (!string.IsNullOrEmpty(Type) && Type != "全部信息")
            {
                strwhere += " and prosort like'%" + Type + "%' ";
            }
            
            if (!string.IsNullOrEmpty(buildplace) && buildplace != "全部地区")
            {
                strwhere += " and proplace like '%" + buildplace + "%' ";
            }
           

            BindInfo( strwhere);

            txtTitle.Text = KeyWord;

            if (string.IsNullOrEmpty(Type))
            {
                Type = "全部信息";
            }
            ddlClass.ClearSelection();

            ddlClass.Items.FindByText(Type).Selected = true;


            if (string.IsNullOrEmpty(buildplace))
            {
                buildplace = "全部地区";

            }
            ddlClass1.ClearSelection();
            ddlClass1.Items.FindByText(buildplace).Selected = true;


           


        }

        public string ReplacetimeStr(string timestr)
        {
            try
            {
                Convert.ToDateTime(timestr);
                return timestr;
            }
            catch
            {
                return "";
            }
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
                pricestr = "";
            }
            //int Id = int.Parse(id);
            //string url = HttpContext.Current.Request.Url.Host.ToString();



            return pricestr;
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
                str = regex.Replace(str, changestring);
                str = regex3.Replace(str, changestring);
                return str;
            }
            catch
            {


                return content;
            }

        }

        public string Getstyle(string ID)
        {

            int Id = int.Parse(ID);
            string stcode = "";
            if (!LTP.Common.UserInfo.IsLogin())
            {
                return stcode;
            }
            else
            {
                JDJS.BLL.project_inforbase bll = new JDJS.BLL.project_inforbase();
                JDJS.Model.project_inforbase model = bll.GetModel(Id);

                JDJS.BLL.cust_base_info cbll = new JDJS.BLL.cust_base_info();
                JDJS.Model.cust_base_info cmodel = ((JDJS.Model.cust_base_info)Session["User"]);


                if (model.custreadrec.IndexOf(cmodel.newcode) < 0)
                {
                    return stcode;
                }
                else
                {
                    stcode = "subbhadul a";
                    return stcode;
                }
            }

        }

        private void BindInfo(string strwhere)
        {
            
            JDJS.BLL.project_inforbase bll = new JDJS.BLL.project_inforbase();
            Pager.PageSize = 15;
            if (strwhere != "1=1")
            {
                Pager.RecordCount = bll.GetCount(strwhere);//.Tables[0].Rows.Count;
                RepInfo.DataSource = bll.GetList(Pager.PageSize, Pager.PageIndex, strwhere + " and disflag=0", "id", 1);
            }
            else
            {
                Pager.RecordCount = 35;//.Tables[0].Rows.Count;
                //RepInfo.DataSource = bll.GetList(35, strwhere + " and disflag=0", "id", "Desc");
                RepInfo.DataSource = bll.GetList(Pager.PageSize, Pager.PageIndex, strwhere + " and disflag=0", "id", 1);
            }

            RepInfo.DataBind();
           

            //ddlClass1.DataSource = bll.GetSql("SELECT proplace FROM project_inforbase GROUP BY proplace order by proplace");
            //ddlClass1.DataValueField = "proplace";
            //ddlClass1.DataTextField = "proplace";
            //ddlClass1.DataBind();
            //ddlClass1.Items.Insert(0, "全部地区");
        }

        protected void btnSeach_Click(object sender, EventArgs e)
        {
            string SeachTo = "WXprobase.aspx?Part=3";
            if (!string.IsNullOrEmpty(ddlClass.SelectedValue))
            {
                SeachTo += "&Type=" + LTP.Common.StringPlus.htmlstr(ddlClass.Text);
            }
           
            if (!string.IsNullOrEmpty(ddlClass1.SelectedValue))
            {
                SeachTo += "&buildplace=" + LTP.Common.StringPlus.htmlstr(ddlClass1.Text); ;
            }

            if (!string.IsNullOrEmpty(txtTitle.Text.Trim()))
            {
                SeachTo += "&KeyWord=" + LTP.Common.StringPlus.htmlstr(txtTitle.Text.Trim());
            }
            

            Response.Redirect(SeachTo);
        }
        public string NewStr(string dt)
        {
            try
            {
                DateTime newdt = DateTime.Parse(dt);
                if (Math.Abs(LTP.Common.TimeParser.DayDiff(DateTime.Now, newdt)) < 7)
                {
                    return "<img src=\"style/icon/New.gif\" />";
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
    }
}