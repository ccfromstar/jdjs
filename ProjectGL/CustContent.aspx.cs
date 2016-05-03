using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using PageControl;
using System.Data;
using System.Text.RegularExpressions;

namespace JDJS.Web.ProjectGL
{
    public partial class CustContent : PageBase
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
            Title = "您好，欢迎使用建定工程通！";
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
            if (classlevel == null)
            {
                Response.Redirect("Login.aspx");
            }
        }
        public void DeleteById(object sender, EventArgs e)
        {
            LinkButton lb = (LinkButton)sender;
            LTP.Common.MessageBox.Show(this.Page, lb.CommandArgument.ToString());
        }
        private void BindInfo(string Part, string strwhere)
        {
            switch (Part)
            {
                case "Project":
                    Panel9.Visible = true;
                    /*string gbsort = "不限", gssort = "不限";
                    if (!string.IsNullOrEmpty(Request.QueryString["gbsort"]))
                    {
                        gbsort = Request.QueryString["gbsort"];
                    }
                    if (!string.IsNullOrEmpty(Request.QueryString["gssort"]))
                    {
                        gssort = Request.QueryString["gssort"];
                    }
               
                    Bindsort(gbsort, gssort);*/

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
                case "Mat":
                    Panel4.Visible = true;
                    SeachProMat();
                    break;
                case "MatProject":
                    Panel5.Visible = true;
                    BindMatProject();
                    break;

                default:
                    break;
            }
        }
        private void BindMatProject()
        {

            Panel5.Visible = true;
            string strwhere = " 1=1 and id in(select proid from pro_mat_view)";
            JDJS.BLL.project_inforbase bll = new JDJS.BLL.project_inforbase();


            UcfarPager3.PageSize = 15;
           
            UcfarPager3.RecordCount = bll.GetCount(strwhere);//.Tables[0].Rows.Count;
            Repeater2.DataSource = bll.GetList(UcfarPager3.PageSize, UcfarPager3.PageIndex, strwhere, "id", 1);
          
            Repeater2.DataBind();

        }

        private void Bindsort(string gbsort, string gssort)
        {
            //string spccode = "";
            JDJS.BLL.project_inforbase bll = new JDJS.BLL.project_inforbase();
            DataSet ds = new DataSet();
            ds = bll.GetList(" proplace", " 1=1 group by proplace");
            DropDownList3.DataSource = ds;
            DropDownList3.DataValueField = ds.Tables[0].Columns["proplace"].ToString();
            DropDownList3.DataTextField = ds.Tables[0].Columns["proplace"].ToString();

            //specialDL.Items.Clear();
            DropDownList3.DataBind();
            DropDownList3.Items.Insert(0, "不限");
            DropDownList3.ClearSelection();

            DropDownList3.Items.FindByText(gbsort).Selected = true;
            //bsort.SelectedIndex = 0;
            //spccode = bsort.SelectedValue;
            Getssort(gbsort, gssort);
        }

        private void Getssort(string gbsort, string gssort)
        {
            int rcnt; string itname, itcode;
            JDJS.BLL.project_inforbase bll = new JDJS.BLL.project_inforbase();
            DataSet itcinfo = bll.GetList(" proplace,proquyu", " proplace='" + gbsort + "' group by proplace,proquyu");
            area.Items.Clear();
            if (itcinfo.Tables[0].Rows.Count > 0)
            {

                rcnt = itcinfo.Tables[0].Rows.Count;

                for (int j = 0; j < rcnt; j++)
                {
                    DataRow row;
                    row = itcinfo.Tables[0].Rows[j];
                    itname = Convert.ToString(row["proquyu"]);
                    itcode = Convert.ToString(row["proquyu"]);
                    area.Items.Add(itname.ToString());
                    area.Items.FindByText(itname).Value = itname;

                }

            }
            else
            {
                JDJS.BLL.project_inforbase bll3 = new JDJS.BLL.project_inforbase();
                DataSet ds3 = new DataSet();
                ds3 = bll3.GetList(" proquyu", " 1=1 group by proquyu");

                area.DataSource = ds3;
                area.DataValueField = ds3.Tables[0].Columns["proquyu"].ToString();
                area.DataTextField = ds3.Tables[0].Columns["proquyu"].ToString();
                area.DataBind();
                //ssort.Items.Clear();
            }
            area.Items.Insert(0, "不限");
            area.ClearSelection();
            area.Items.FindByText(gssort).Selected = true;

            //ssort.SelectedIndex = 0;


        }

        private void SeachProMat()
        {
            string strwhere = "1=1";

            string Matname = "";
           // string Begin = "";
           // string End = "";           
            string linkman = "";
            string Proname = "";
            string company = "";

            string BuySt = "";
            if (!string.IsNullOrEmpty(Request.QueryString["Matname"]))
            {
                Matname = LTP.Common.StringPlus.htmlstr(Request.QueryString["Matname"]);
            }
            if (!string.IsNullOrEmpty(Request.QueryString["linkman"]))
            {
                linkman = LTP.Common.StringPlus.htmlstr(Request.QueryString["linkman"]);
            }
            if (!string.IsNullOrEmpty(Request.QueryString["Proname"]))
            {
                Proname = LTP.Common.StringPlus.htmlstr(Request.QueryString["Proname"]);
            }
            if (!string.IsNullOrEmpty(Request.QueryString["company"]))
            {
                company = LTP.Common.StringPlus.htmlstr(Request.QueryString["company"]);
            }

            if (!string.IsNullOrEmpty(Request.QueryString["BuySt"]))
            {
                BuySt = LTP.Common.StringPlus.htmlstr(Request.QueryString["BuySt"]);
            }

           
           /* if (!string.IsNullOrEmpty(Request.QueryString["Begin"]))
            {
                Begin = ReplacetimeStr(LTP.Common.StringPlus.htmlstr(Request.QueryString["Begin"]));
            }
            if (!string.IsNullOrEmpty(Request.QueryString["End"]))
            {
                End = ReplacetimeStr(LTP.Common.StringPlus.htmlstr(Request.QueryString["End"]));
            }*/



            if (!string.IsNullOrEmpty(BuySt) && BuySt != "全部信息")
            {
                switch (BuySt)
                {
                    case "采购未开始":
                        strwhere += " and recstate=-1";
                        break;
                    case "采购进行中":
                        strwhere += " and recstate=0";
                        break;
                    case "采购已完成":
                        strwhere += " and recstate=1";
                        break;

                    default:
                        break;
                }
                //strwhere += " and prorek like '%" + "装修情况：" + BuySt + "%' ";
            }



            if (!string.IsNullOrEmpty(Matname))
            {
                strwhere += " and matname like '%" + Matname + "%' ";
            }

            if (!string.IsNullOrEmpty(linkman))
            {
                strwhere += " and linkman like '%" + linkman + "%' ";
            }

            if (!string.IsNullOrEmpty(Proname))
            {
                strwhere += " and proname like '%" + Proname + "%' ";
            }
            if (!string.IsNullOrEmpty(company))
            {
                strwhere += " and company like '%" + company + "%' ";
            }
           /* if (!string.IsNullOrEmpty(Begin))
            {
                strwhere += " and inforptime>'" + Begin + "' ";
            }
            if (!string.IsNullOrEmpty(End))
            {
                strwhere += " and inforptime<'" + End + "' ";
            }*/


            BindMatInfo(strwhere);
            if (string.IsNullOrEmpty(BuySt))
            {
                BuySt = "全部信息";
            }
            TBuySt.ClearSelection();

            TBuySt.Items.FindByText(BuySt).Selected = true;


            //TextBox2.Text = Begin; TextBox3.Text = End;
            TMatname.Text = Matname; TLinkman.Text = linkman;
            TPro.Text = Proname; TCmp.Text = company;
          
        }



        private void SeachPro()
        {

            string KeyWord = "";
            string Begin = "";
            string End = "";
            string stBegin = "";
            string stEnd = "";
            string ftBegin = "";
            string ftEnd = "";
            string minmoney = "";
            string maxmoney = "";
            string strwhere = "1=1";
            string proType = "";
            string proaddress = "";
            string proSort = "";
            string proPlace = "不限";
            string proquyu = "不限";
            string zhuangxiu = "";
            if (!string.IsNullOrEmpty(Request.QueryString["proType"]))
            {
                proType = LTP.Common.StringPlus.htmlstr(Request.QueryString["proType"]);
            }
            if (!string.IsNullOrEmpty(Request.QueryString["proaddress"]))
            {
                proaddress = LTP.Common.StringPlus.htmlstr(Request.QueryString["proaddress"]);
            }
            if (!string.IsNullOrEmpty(Request.QueryString["proSort"]))
            {
                proSort = LTP.Common.StringPlus.htmlstr(Request.QueryString["proSort"]);
            }
            if (!string.IsNullOrEmpty(Request.QueryString["proPlace"]))
            {
                proPlace = LTP.Common.StringPlus.htmlstr(Request.QueryString["proPlace"]);
            }
            if (!string.IsNullOrEmpty(Request.QueryString["proquyu"]))
            {
                proquyu = LTP.Common.StringPlus.htmlstr(Request.QueryString["proquyu"]);
            }
            if (!string.IsNullOrEmpty(Request.QueryString["zhuangxiu"]))
            {
                zhuangxiu = LTP.Common.StringPlus.htmlstr(Request.QueryString["zhuangxiu"]);
            }

            if (!string.IsNullOrEmpty(Request.QueryString["KeyWord"]))
            {
                KeyWord = LTP.Common.StringPlus.htmlstr(Request.QueryString["KeyWord"]);
            }
            if (!string.IsNullOrEmpty(Request.QueryString["Begin"]))
            {
                Begin = ReplacetimeStr(LTP.Common.StringPlus.htmlstr(Request.QueryString["Begin"]));
            }
            if (!string.IsNullOrEmpty(Request.QueryString["End"]))
            {
                End = ReplacetimeStr(LTP.Common.StringPlus.htmlstr(Request.QueryString["End"]));
            }

            if (!string.IsNullOrEmpty(Request.QueryString["stBegin"]))
            {
                stBegin = ReplacetimeStr(LTP.Common.StringPlus.htmlstr(Request.QueryString["stBegin"]));
            }
            if (!string.IsNullOrEmpty(Request.QueryString["stEnd"]))
            {
                stEnd = ReplacetimeStr(LTP.Common.StringPlus.htmlstr(Request.QueryString["stEnd"]));
            }
            if (!string.IsNullOrEmpty(Request.QueryString["ftBegin"]))
            {
                ftBegin = ReplacetimeStr(LTP.Common.StringPlus.htmlstr(Request.QueryString["ftBegin"]));
            }
            if (!string.IsNullOrEmpty(Request.QueryString["ftEnd"]))
            {
                ftEnd = ReplacetimeStr(LTP.Common.StringPlus.htmlstr(Request.QueryString["ftEnd"]));
            }
            if (!string.IsNullOrEmpty(Request.QueryString["minmoney"]))
            {
                minmoney = Getprice(LTP.Common.StringPlus.htmlstr(Request.QueryString["minmoney"]));
            }
            if (!string.IsNullOrEmpty(Request.QueryString["maxmoney"]))
            {
                maxmoney = Getprice(LTP.Common.StringPlus.htmlstr(Request.QueryString["maxmoney"]));
            }

            if (!string.IsNullOrEmpty(proType) && proType != "全部信息")
            {
                strwhere += " and prostate = '" + proType + "' ";
            }

            if (!string.IsNullOrEmpty(proSort) && proSort != "全部信息")
            {
                strwhere += " and prosort like '%" + proSort + "%' ";
            }
            if (!string.IsNullOrEmpty(proPlace) && proPlace != "不限")
            {
                strwhere += " and proplace like '%" + proPlace + "%' ";
            }

            if (!string.IsNullOrEmpty(proquyu) && proquyu != "不限")
            {
                strwhere += " and proquyu like '%" + proquyu + "%' ";
            }

            if (!string.IsNullOrEmpty(zhuangxiu) && zhuangxiu != "全部信息")
            {
                strwhere += " and prorek like '%" + "装修情况：" + zhuangxiu + "%' ";
            }



            if (!string.IsNullOrEmpty(KeyWord))
            {
                strwhere += " and proname like '%" + KeyWord + "%' ";
            }

            if (!string.IsNullOrEmpty(proaddress))
            {
                strwhere += " and proaddress like '%" + proaddress + "%' ";
            }
            if (!string.IsNullOrEmpty(Begin))
            {
                strwhere += " and inforptime>='" + Begin + "' ";
            }
            if (!string.IsNullOrEmpty(End))
            {
                strwhere += " and inforptime<='" + End + "' ";
            }

            if (!string.IsNullOrEmpty(stBegin))
            {
                strwhere += " and prostime>='" + stBegin + "' ";
            }
            if (!string.IsNullOrEmpty(stEnd))
            {
                strwhere += " and prostime<='" + stEnd + "' ";
            }
            if (!string.IsNullOrEmpty(ftBegin))
            {
                strwhere += " and proftime>='" + ftBegin + "' ";
            }
            if (!string.IsNullOrEmpty(ftEnd))
            {
                strwhere += " and proftime<='" + ftEnd + "' ";
            }
            if (!string.IsNullOrEmpty(minmoney))
            {
                strwhere += " and promoney>=" + minmoney;
            }
            if (!string.IsNullOrEmpty(maxmoney))
            {
                strwhere += " and promoney<=" + maxmoney;
            }

            Bindsort(proPlace, proquyu);
            BindInfo2(strwhere);
            if (string.IsNullOrEmpty(proType))
            {
                proType = "全部信息";
            }
            DropDownList2.ClearSelection();

            DropDownList2.Items.FindByText(proType).Selected = true;

           /* if (string.IsNullOrEmpty(proPlace))
            {
                proPlace = "不限";
            }
            DropDownList3.ClearSelection();

            DropDownList3.Items.FindByText(proPlace).Selected = true;

            if (string.IsNullOrEmpty(proquyu))
            {
                proquyu = "不限";
            }
            area.ClearSelection();

            area.Items.FindByText(proquyu).Selected = true;*/

            if (string.IsNullOrEmpty(zhuangxiu))
            {
                zhuangxiu = "全部信息";
            }
            ZhuangXiu.ClearSelection();

            ZhuangXiu.Items.FindByText(zhuangxiu).Selected = true;

            if (string.IsNullOrEmpty(proSort))
            {
                proSort = "全部信息";
            }
            DropDownList1.ClearSelection();

            DropDownList1.Items.FindByText(proSort).Selected = true;


            TextBox2.Text = Begin; TextBox3.Text = End;
            TextBox1.Text = KeyWord; TextBox8.Text = proaddress;
            TextBox9.Text = stBegin; TextBox10.Text = stEnd;
            TextBox12.Text = ftBegin; TextBox13.Text = ftEnd;
            TextBox14.Text = minmoney; TextBox15.Text = maxmoney;
           
        }

        public string ReplacetimeStr(string timestr)
        {
            try
            {
                DateTime dat = DateTime.Parse(timestr);
                string str = dat.ToString("yyyy-MM-dd");//这样写就行了。
                
                return str;
                
                //Convert.ToDateTime(timestr);
                //return timestr;
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
            if (strwhere != "1=1")
            {
                UcfarPager5.RecordCount = bll.GetCount(strwhere);//.Tables[0].Rows.Count;
                Rep2.DataSource = bll.GetList(UcfarPager5.PageSize, UcfarPager5.PageIndex, strwhere, "id", 1);
            }
            else
            {
                UcfarPager5.RecordCount = 200;//.Tables[0].Rows.Count;
                //Rep2.DataSource = bll.GetList(15, strwhere, "id", "desc");
                Rep2.DataSource = bll.GetList(UcfarPager5.PageSize, UcfarPager5.PageIndex, strwhere, "id", 1);
            }

            Rep2.DataBind();

            DropDownList2.DataSource = bll.GetSql("SELECT prostate FROM project_inforbase GROUP BY prostate");
            DropDownList2.DataValueField = "prostate";
            DropDownList2.DataTextField = "prostate";
            DropDownList2.DataBind();
            DropDownList2.Items.Insert(0, "全部信息");

            /*DropDownList3.DataSource = bll.GetSql("SELECT proplace FROM project_inforbase GROUP BY proplace");
            DropDownList3.DataValueField = "proplace";
            DropDownList3.DataTextField = "proplace";
            DropDownList3.DataBind();
            DropDownList3.Items.Insert(0, "全部信息");*/

        }
        private void BindMatInfo(string strwhere)
        {

            Panel4.Visible = true;
            JDJS.BLL.pro_mat_view bll = new JDJS.BLL.pro_mat_view();
           

            UcfarPager2.PageSize = 15;
            if (strwhere != "1=1")
            {
                UcfarPager2.RecordCount = bll.GetCount(strwhere);//.Tables[0].Rows.Count;
                RepMat.DataSource = bll.GetList(UcfarPager2.PageSize, UcfarPager2.PageIndex, strwhere, "id", 1);
            }
            else
            {
                //strwhere = strwhere + " and recstate<1";
                UcfarPager2.RecordCount = bll.GetCount(strwhere);
                //UcfarPager2.RecordCount = 200;
                //RepMat.DataSource = bll.GetList(15, strwhere, "id", "desc");
                RepMat.DataSource = bll.GetList(UcfarPager2.PageSize, UcfarPager2.PageIndex, strwhere, "id", 1);
            }

            RepMat.DataBind();

         

            /*DropDownList3.DataSource = bll.GetSql("SELECT proplace FROM project_inforbase GROUP BY proplace");
            DropDownList3.DataValueField = "proplace";
            DropDownList3.DataTextField = "proplace";
            DropDownList3.DataBind();
            DropDownList3.Items.Insert(0, "全部信息");*/

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
                UcfarPager6.RecordCount = 200;
                //Rep3.DataSource = bll.GetList(15, strwhere, "id", "desc");
                Rep3.DataSource = bll.GetList(UcfarPager6.PageSize, UcfarPager6.PageIndex, strwhere, "id", 1);
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
                UcfarPager1.RecordCount = 200;//.Tables[0].Rows.Count;
                Repeater1.DataSource = bll.GetList(UcfarPager1.PageSize, UcfarPager1.PageIndex, strwhere, "pcid", 1);
                //Repeater1.DataSource = bll.GetList(15, strwhere, "pcid", "Desc");
            }

            Repeater1.DataBind();
        }

        public string GetMatstate(string recstate)
        {
            string Statestr = "不确定";
            //int Id = int.Parse(ID);

            switch (recstate)
            {
                case "-1":
                    Statestr = "采购未开始";
                    return Statestr;
                    break;
                case "0":
                    Statestr = "采购进行中";
                    return Statestr;
                    break;
                case "1":
                    Statestr = "采购已完成";
                    return Statestr;
                    break;

                default:
                    break;
            }
            return Statestr;
                    
           

        }

        protected void LinkButton2_Click(object sender, EventArgs e)
        {
            Response.Redirect("CustContent.aspx?type=" + Part + "&tb=" + DropDownList2.SelectedValue + "&KeyWord=" + TextBox1.Text + "&Begin=" + TextBox2.Text + "&End=" + TextBox3.Text + "&stBegin=" + TextBox9.Text + "&stEnd=" + TextBox10.Text + "&ftBegin=" + TextBox12.Text + "&ftEnd=" + TextBox13.Text + "&minmoney=" + TextBox14.Text + "&maxmoney=" + TextBox15.Text + "&proType=" + DropDownList2.SelectedValue + "&proSort=" + DropDownList1.SelectedValue + "&proPlace=" + DropDownList3.SelectedValue + "&proquyu=" + area.SelectedValue + "&zhuangxiu=" + ZhuangXiu.SelectedValue + "&proaddress=" + TextBox8.Text);
        }
        protected void LinkButton4_Click(object sender, EventArgs e)
        {            
            Response.Redirect("CustContent.aspx?type=" + Part + "&Matname=" + TMatname.Text + "&linkman=" + TLinkman.Text + "&BuySt=" + TBuySt.SelectedValue +  "&Proname=" + TPro.Text + "&company=" + TCmp.Text);
        }

        protected void linkmanLB_Check(object sender, EventArgs e)
        {
            Response.Redirect("CustContent.aspx?type=" + Part + "&Id=" + TextBox6.Text + "&LinkmanWord=" + TextBox7.Text + "&CompanyWord=" + TextBox4.Text + "&JobWord=" + TextBox5.Text);
        }

        protected void CompanyLB_Check(object sender, EventArgs e)
        {
            Response.Redirect("CustContent.aspx?type=" + Part + "&CompanyWord=" + TextBox11.Text);
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