using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using PageControl;
using System.Data;
namespace JDJS.Web.ProjectGL
{
    public partial class Content : PageBase
    {
        public string Part
        {
            get
            {
                if (!string.IsNullOrEmpty(Request.QueryString["Type"]))
                {
                    return Request.QueryString["Type"];
                }
                else
                {
                    return "";
                }
            }
        }
        public string classtp
        {
            get
            {
                if (Session["AdminInfo"] != null)
                {
                    //lbUser.Text = ((JDJS.Model.Admin)Session["AdminInfo"]).uid;
                    return ((JDJS.Model.Admin)Session["AdminInfo"]).classtp;
                }
                else
                {
                    return "";
                }
            }
        }
        public string tb
        {
            get
            {
                if (!string.IsNullOrEmpty(Request.QueryString["tb"]))
                {
                    return Request.QueryString["tb"];
                }
                else
                {
                    return "";
                }
            }
        }
        public string Operat
        {
            get
            {
                if (!string.IsNullOrEmpty(Request.QueryString["Operat"]))
                {
                    return Request.QueryString["Operat"];
                }
                else
                {
                    return "";
                }
            }
        }
        public string Id
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
                if (!IsPostBack)
                {
                    BindInfo(Part, "1=1");
                }
            }
            else
            {
                Response.Redirect("Login.aspx");
            }
            Levelcheck(classtp); 
        }
        private void Levelcheck(string classlevel)
        { 
            if (classlevel!="a")
            {
                Response.Redirect("Login.aspx");
            }
        }
        public void DeleteById(object sender, EventArgs e)
        {
            LinkButton lb=(LinkButton)sender;
            LTP.Common.MessageBox.Show(this.Page, lb.CommandArgument.ToString());
        }
        private void BindInfo(string Part, string strwhere)
        {
            switch (Part)
            {
                case "Project":
                    Panel9.Visible = true;
                    SeachPro();
                    break;
                case "Renmai":
                    Panel3.Visible = true;
                    SeachMark();
                    break;
                case "company":
                    Panel1.Visible = true;
                    Seachcompany();
                    break;
               
                default:
                    break;
            }
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

            Panel2.Visible = true;
            JDJS.BLL.project_inforbase bll = new JDJS.BLL.project_inforbase();
            if (Operat == "delete")
            {
                string strwhere2 = " and proid=" + Id;
                bll.Delete(int.Parse(Id));
                JDJS.BLL.pro_linkman_list bll2 = new JDJS.BLL.pro_linkman_list();
                bll2.Delete(strwhere2);

            }

            UcfarPager5.PageSize = 15;
            if (strwhere!="1=1")
            {
                UcfarPager5.RecordCount = bll.GetCount(strwhere);//.Tables[0].Rows.Count;
                Rep2.DataSource = bll.GetList(UcfarPager5.PageSize, UcfarPager5.PageIndex, strwhere, "inforptime", 1);
            }
            else             
            {
                UcfarPager5.RecordCount = 15;//.Tables[0].Rows.Count;
                Rep2.DataSource = bll.GetList(15, strwhere,"id","desc");
            }
            
            Rep2.DataBind();

            DropDownList2.DataSource = bll.GetSql("SELECT prostate FROM project_inforbase GROUP BY prostate");
            DropDownList2.DataValueField = "prostate";
            DropDownList2.DataTextField = "prostate";
            DropDownList2.DataBind();
            DropDownList2.Items.Insert(0, "全部信息");
        }

      
        private void SeachMark()
        {
            string CompanyWord = "";
            string LinkmanWord = "";
            string Id = "";
            string JobWord = "";


            string strwhere = "1=1";

            if (!string.IsNullOrEmpty(Request.QueryString["Id"]))
            {
                Id = LTP.Common.StringPlus.htmlstr(Request.QueryString["Id"]);
            }
            if (!string.IsNullOrEmpty(Id) && (Operat != "delete"))
            {
                strwhere += " and id =" + Id;
            }

            if (!string.IsNullOrEmpty(Request.QueryString["JobWord"]))
            {
                JobWord = LTP.Common.StringPlus.htmlstr(Request.QueryString["JobWord"]);
            }
            if (!string.IsNullOrEmpty(JobWord))
            {
                strwhere += " and job like '%" + JobWord + "%' ";
            }

            if (!string.IsNullOrEmpty(Request.QueryString["LinkmanWord"]))
            {
                LinkmanWord = LTP.Common.StringPlus.htmlstr(Request.QueryString["LinkmanWord"]);
            }
            if (!string.IsNullOrEmpty(LinkmanWord))
            {
                strwhere += " and linkman like '%" + LinkmanWord + "%' ";
            }


            if (!string.IsNullOrEmpty(Request.QueryString["CompanyWord"]))
            {
                CompanyWord = LTP.Common.StringPlus.htmlstr(Request.QueryString["CompanyWord"]);
            }
            if (!string.IsNullOrEmpty(CompanyWord))
            {
                strwhere += " and companyname like '%" + CompanyWord + "%' ";
            }
            BindInfo3(strwhere);
        }

        private void BindInfo3(string strwhere)
        {

            Panel3.Visible = true;
            JDJS.BLL.TClinkman bll = new JDJS.BLL.TClinkman();
             if (Operat == "delete")
            {
               bll.Delete(int.Parse(Id));
            }
            UcfarPager6.PageSize = 15;
            if (strwhere != "1=1")
            {
                UcfarPager6.RecordCount = bll.GetCount(strwhere);//.Tables[0].Rows.Count;
                Rep3.DataSource = bll.GetList(UcfarPager6.PageSize, UcfarPager6.PageIndex, strwhere, "id", 1);
            }
            else
            {
                UcfarPager6.RecordCount = 15;
                Rep3.DataSource = bll.GetList(15,strwhere,"id","desc");
            }
            Rep3.DataBind();
        }
         private void Seachcompany()
        {
            string CompanyWord = "";
           


            string strwhere = "1=1";

           

            if (!string.IsNullOrEmpty(Request.QueryString["CompanyWord"]))
            {
                CompanyWord = LTP.Common.StringPlus.htmlstr(Request.QueryString["CompanyWord"]);
            }
            if (!string.IsNullOrEmpty(CompanyWord))
            {
                strwhere += " and company like '%" + CompanyWord + "%' ";
            }
            BindCompanyInfo(strwhere);
        }

         private void BindCompanyInfo(string strwhere)
         {

             Panel1.Visible = true;
             JDJS.BLL.TCcompany bll = new JDJS.BLL.TCcompany();
              if (Operat == "delete")
              {
                bll.Delete(int.Parse(Id));
              }
              UcfarPager1.PageSize = 15;
              if (strwhere != "1=1")
              {
                 
                  UcfarPager1.RecordCount = bll.GetCount(strwhere);//.Tables[0].Rows.Count;
                  Repeater1.DataSource = bll.GetList(UcfarPager1.PageSize, UcfarPager1.PageIndex, strwhere, "pcid", 1);
              }
              else
              {
                  UcfarPager1.RecordCount =15;//.Tables[0].Rows.Count;
                  Repeater1.DataSource = bll.GetList(15,strwhere,"pcid","Desc");
              }
             
             Repeater1.DataBind();
         }

        protected void LinkButton2_Click(object sender, EventArgs e)
        {
            Response.Redirect("Content.aspx?type=" + Part + "&tb=" + DropDownList2.SelectedValue + "&KeyWord=" + TextBox1.Text + "&Begin=" + TextBox2.Text + "&End=" + TextBox3.Text + "&proType=" + DropDownList2.SelectedValue);
        }

        protected void linkmanLB_Check(object sender, EventArgs e)
        {
            Response.Redirect("Content.aspx?type=" + Part + "&Id=" + TextBox6.Text + "&LinkmanWord=" + TextBox7.Text + "&CompanyWord=" + TextBox4.Text + "&JobWord=" + TextBox5.Text);
        }

        protected void CompanyLB_Check(object sender, EventArgs e)
        {
            Response.Redirect("Content.aspx?type=" + Part + "&CompanyWord=" + TextBox11.Text);
        }
     
    }
}
