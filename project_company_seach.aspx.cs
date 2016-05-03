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
    public partial class project_company_seach : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            Seach();
            /*if (!IsPostBack)
            {
                if (!LTP.Common.UserInfo.IsLogin())
                {
                    Session["FromPage"] = HttpContext.Current.Request.Url.PathAndQuery;
                    Response.Redirect("Login.aspx");
                }
                else
                {
                    Session["FromPage"] = null;
                    Seach();
                }
            }*/
        }
        private void Seach()
        {
            /* string KeyWord = "";
            string worktype = ""; 
            string strwhere ="";

           if (!string.IsNullOrEmpty(Request.QueryString["worktype"]) && Request.QueryString["worktype"] != "不限工种")
            {
                worktype = LTP.Common.StringPlus.htmlstr(Request.QueryString["worktype"]);
                strwhere += " and worktype ='" + worktype+"'";
            }
            
            
            if (!string.IsNullOrEmpty(Request.QueryString["KeyWord"]))
            {
                KeyWord = LTP.Common.StringPlus.htmlstr(Request.QueryString["KeyWord"]);
                strwhere += " and seachkey like '%" + KeyWord + "%' ";
                
            }
            else
            {
               // LTP.Common.MessageBox.Show(this.Page, "企业名称关键字不得为空!");
                string KeyWordNULL = "关键字为空";
                strwhere += " and seachkey like '%" + KeyWordNULL + "%' ";
                ImgBg.ImageUrl = "style/images/Project-md5.gif";
            }*/

            string KeyWord = "";
            
            string strwhere = "";

            if (!string.IsNullOrEmpty(Request.QueryString["KeyWord"]))
            {
                KeyWord = LTP.Common.StringPlus.htmlstr(Request.QueryString["KeyWord"]);
                strwhere += " and company like '%" + KeyWord + "%' ";

            }
            else
            {
                // LTP.Common.MessageBox.Show(this.Page, "企业名称关键字不得为空!");
                //string KeyWordNULL = "关键字为空";
                //strwhere += " and company like '%" + KeyWordNULL + "%' ";
                strwhere = "";
                ImgBg.ImageUrl = "style/images/Project-md5.gif";
            }


            
            BindInfo(strwhere);  
            
        }

        private void BindInfo(string strwhere)
        {
            /*ImgBg.ImageUrl = "style/images/Project-md5.gif";
            JDJS.BLL.project_company bll = new JDJS.BLL.project_company();
            Pager.PageSize = 24;
            Pager.RecordCount = bll.GetCount("1=1" + strwhere);
            RepInfo.DataSource = bll.GetList(Pager.PageSize, Pager.PageIndex, "1=1" + strwhere, "unitname", 1);
            RepInfo.DataBind();
            ddlClassWT.DataSource = bll.GetSql("SELECT worktype FROM project_company GROUP BY worktype");
            ddlClassWT.DataValueField = "worktype";
            ddlClassWT.DataTextField = "worktype";
            ddlClassWT.DataBind();
            ddlClassWT.Items.Insert(0, "不限工种");  */
            
            ImgBg.ImageUrl = "style/images/Project-md5.gif";
            JDJS.BLL.TCcompany bll = new JDJS.BLL.TCcompany();
            Pager.PageSize = 24;
            Pager.RecordCount = bll.GetCount("1=1" + strwhere);
            RepInfo.DataSource = bll.GetList(Pager.PageSize, Pager.PageIndex, "1=1" + strwhere, "pcid", 1);
            RepInfo.DataBind();
      
        }
        protected void btnSeach_Click(object sender, EventArgs e)
        {
            string SeachTo = "project_company_seach.aspx?";
           

            if (!string.IsNullOrEmpty(txtTitle.Text.Trim()))
            {
                SeachTo += "KeyWord=" + LTP.Common.StringPlus.htmlstr(txtTitle.Text.Trim());
            }

            /*if (!string.IsNullOrEmpty(ddlClassWT.SelectedValue))
            {
                SeachTo += "&worktype=" + LTP.Common.StringPlus.htmlstr(ddlClassWT.SelectedValue);
            }*/

            Response.Redirect(SeachTo);
        }
        public string GetCompanystyle(string ID)
        {

            int Id = int.Parse(ID);
            string stcode = "";
            if (!LTP.Common.UserInfo.IsLogin())
            {
                return stcode;
            }
            else
            {
                JDJS.BLL.TCcompany bll = new JDJS.BLL.TCcompany();
                JDJS.Model.TCcompany model = bll.GetModel(Id);

                JDJS.BLL.cust_base_info cbll = new JDJS.BLL.cust_base_info();
                JDJS.Model.cust_base_info cmodel = ((JDJS.Model.cust_base_info)Session["User"]);


                if (model.newcode.ToString().IndexOf(cmodel.newcode) < 0)
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
     
    }
}