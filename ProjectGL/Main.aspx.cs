using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace JDJS.Web.ProjectGL
{
    public partial class Main : System.Web.UI.Page
    {
      
        
        protected void Page_Load(object sender, EventArgs e)
        {

            classA.Visible = false;
            classC.Visible = false;
            classD.Visible = false;
            classH.Visible = false;
            if (Session["AdminInfo"] != null)
            {
                lbUser.Text = ((JDJS.Model.Admin)Session["AdminInfo"]).uid;
                LoginLevel(((JDJS.Model.Admin)Session["AdminInfo"]).classtp);
                /*if (!IsPostBack)
                {
                    BindInfoC(((JDJS.Model.Admin)Session["AdminInfo"]).classtp);
                }
                else
                {
                    Panel9.Visible = false;
                    PanelCust.Visible = false;
                }*/
            }
            else
            {
                Response.Redirect("Login.aspx");
            }
            
        }
        public static void OpenWindow(Page page, string str)
        {
            page.ClientScript.RegisterStartupScript(page.GetType(), "javascript", "<script language='javascript'>window.open('" + str + "')</script>");
        }

        private void BindInfoC(string strclass)
        {
            if (strclass == "c")
            {
                Panel9.Visible = true;
                SeachPro();

            }
        }
       
        private void LoginLevel(string THClass)
        {
            if (THClass != null)
            {

                switch (THClass)
                {
                    case "a":
                        classA.Visible = true;
                        //SeachNew();
                        break;
                    case "c":
                        classC.Visible = true;
                        Response.Redirect("CustContent.aspx?type=Project");
                        break;
                    case "d":
                        classD.Visible = true;
                        //SeachPro();
                        break;
                    case "h":
                        classH.Visible = true;
                        
                        //SeachMark();
                        break;
                    
                    default:
                        break;
                }
                /*loginroad1.Style.Add("display", "none");
                logined.Style.Add("display", "");
                JDJS.Model.cust_base_info modelmb = ((JDJS.Model.cust_base_info)Session["User"]);
                JDJS.BLL.member_point bll = new JDJS.BLL.member_point();
                JDJS.Model.member_point modeljf = bll.GetModel(modelmb.newcode);
                Labeid.Text = modelmb.newcode;
                Labepoint.Text = modeljf.point.ToString();
                LabeJDB.Text = modeljf.JDB.ToString();*/
            }
            else
            {
                Response.Redirect("Login.aspx");
                //loginroad1.Style.Add("display", "");
                //logined.Style.Add("display", "none");
            }

        }

        protected void lbLoginOut_Click(object sender, EventArgs e)
        {
            Session["AdminInfo"] = null;
            Response.Redirect("Login.aspx");
        }
        private void SeachPro()
        {

            string KeyWord = "";
            string Begin = "";
            string End = "";
            string strwhere = "1=1";
            string proType = "";
            if (!string.IsNullOrEmpty(Request.QueryString["proType"]))
            {
                proType = LTP.Common.StringPlus.htmlstr(Request.QueryString["proType"]);
            }
            if (!string.IsNullOrEmpty(Request.QueryString["KeyWord"]))
            {
                KeyWord = LTP.Common.StringPlus.htmlstr(Request.QueryString["KeyWord"]);
            }
            if (!string.IsNullOrEmpty(Request.QueryString["Begin"]))
            {
                Begin = LTP.Common.StringPlus.htmlstr(Request.QueryString["Begin"]);
            }
            if (!string.IsNullOrEmpty(Request.QueryString["End"]))
            {
                End = LTP.Common.StringPlus.htmlstr(Request.QueryString["End"]);
            }
            if (!string.IsNullOrEmpty(proType) && proType != "全部信息")
            {
                strwhere += " and prostate = '" + proType + "' ";
            }

            if (!string.IsNullOrEmpty(KeyWord))
            {
                strwhere += " and proname like '%" + KeyWord + "%' ";
            }
            if (!string.IsNullOrEmpty(Begin))
            {
                strwhere += " and inforptime>'" + Begin + "' ";
            }
            if (!string.IsNullOrEmpty(End))
            {
                strwhere += " and inforptime<'" + End + "' ";
            }
            BindInfo2(strwhere);
            if (string.IsNullOrEmpty(proType))
            {
                proType = "全部信息";
            }
            DropDownList2.ClearSelection();

            DropDownList2.Items.FindByText(proType).Selected = true;
        }
        private void BindInfo2(string strwhere)
        {

            PanelCust.Visible = true;
            JDJS.BLL.project_inforbase bll = new JDJS.BLL.project_inforbase();
            

            UcfarPagerCust.PageSize = 15;
            if (strwhere != "1=1")
            {
                UcfarPagerCust.RecordCount = bll.GetCount(strwhere);//.Tables[0].Rows.Count;
                RepCust.DataSource = bll.GetList(UcfarPagerCust.PageSize, UcfarPagerCust.PageIndex, strwhere, "inforptime", 1);
            }
            else
            {
                UcfarPagerCust.RecordCount = 15;//.Tables[0].Rows.Count;
                RepCust.DataSource = bll.GetList(15, strwhere, "id", "desc");
            }

            RepCust.DataBind();

            DropDownList2.DataSource = bll.GetSql("SELECT prostate FROM project_inforbase GROUP BY prostate");
            DropDownList2.DataValueField = "prostate";
            DropDownList2.DataTextField = "prostate";
            DropDownList2.DataBind();
            DropDownList2.Items.Insert(0, "全部信息");
        }
        protected void LinkButton2_Click(object sender, EventArgs e)
        {
            Response.Redirect("CustContent.aspx?type=Project" + "&tb=" + DropDownList2.SelectedValue + "&KeyWord=" + TextBox1.Text + "&Begin=" + TextBox2.Text + "&End=" + TextBox3.Text + "&proType=" + DropDownList2.SelectedValue);
        }
    }
}
