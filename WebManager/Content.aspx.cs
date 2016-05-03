using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using PageControl;
using System.Data;
namespace JDJS.Web.WebManager
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
                case "News":
                    Panel4.Visible = true;
                    SeachNew();
                    break;
                case "Project":
                    Panel9.Visible = true;
                    SeachPro();
                    break;
                case "Market":
                    Panel10.Visible = true;
                    SeachMark();
                    break;
                case "Supply":
                    BindInfo4(strwhere);
                    break;
                case "Company":
                    Panel16.Visible = true;
                    SeachCp();
                    break;
                case "Corner":
                    Panel11.Visible = true;
                    SeachCor();
                    break;
                case "Policy":
                    Panel12.Visible = true;
                    SeachCor();
                    break;
                case "Download":
                    Panel13.Visible = true;
                    SeachBook();
                    break;
                case "User":
                    Panel14.Visible = true;
                    SeachUser();
                    break;
                case "Tj":
                    Panel18.Visible = true;
                    SeachTj();
                    break;
                case "Notice":
                    Panel20.Visible = true;
                    SeachNotice();
                    break;
                case "WHtml":
                    BindInfo11("");
                    break;
                case "SQ":
                    //GotoSQpag();
                    SeachSQ();
                    ZZB.Visible = false;
                    break;
                default:
                    break;
            }
        }

        private void BindInfo1(string strwhere)
        {
           
            Panel1.Visible = true;
            JDJS.BLL.HYDT bll = new JDJS.BLL.HYDT();
            if (Operat == "delete")
            {
                bll.Delete(int.Parse(Id));
            }
            UcfarPager5.PageSize = 15;
            UcfarPager5.RecordCount = bll.GetCount(strwhere);//.Tables[0].Rows.Count;
            Rep1.DataSource = bll.GetList(UcfarPager5.PageSize, UcfarPager5.PageIndex, strwhere, "ptime", 1);
            Rep1.DataBind();
        }
        private void BindInfo2(string strwhere)
        {
            Panel2.Visible = true;
            if (tb == "1")
            {
                JDJS.BLL.Trade_invite bll = new JDJS.BLL.Trade_invite();
                if (Operat == "delete")
                {
                    bll.Delete(int.Parse(Id));
                }
                Pager.PageSize = 15;
                Pager.RecordCount = bll.GetCount(strwhere);//.Tables[0].Rows.Count;
                Rep2.DataSource = bll.GetList(Pager.PageSize, Pager.PageIndex, strwhere, "发布日期", 1);
                Rep2.DataBind();
            }
            else
            {
                JDJS.BLL.Trade_result bll = new JDJS.BLL.Trade_result();
                if (Operat == "delete")
                {
                    bll.Delete(int.Parse(Id));
                }
                Pager.PageSize = 15;
                Pager.RecordCount = bll.GetCount(strwhere);//.Tables[0].Rows.Count;
                Rep2.DataSource = bll.GetList(Pager.PageSize, Pager.PageIndex, strwhere, "发布日期", 1);
                Rep2.DataBind();
            }
        }
        private void BindInfo3(string strwhere)
        {
            Panel3.Visible = true;
            JDJS.BLL.Dcust_WebShow bll = new JDJS.BLL.Dcust_WebShow();
            if (Operat == "delete")
            {
                bll.Delete(int.Parse(Id));
            }
            UcfarPager6.PageSize = 15;
            UcfarPager6.RecordCount = bll.GetCount(strwhere);//.Tables[0].Rows.Count;
            Rep3.DataSource = bll.GetList(UcfarPager6.PageSize, UcfarPager6.PageIndex, strwhere, "id", 1);
            Rep3.DataBind();
            
        }
        private void BindInfo4(string strwhere)
        {
              Panel15.Visible = true;
              JDJS.BLL.material_company bll = new JDJS.BLL.material_company();
              if (Operat == "delete")
              {
                  bll.Delete(int.Parse(Id));
              }
              UcfarPager7.PageSize = 15;
              UcfarPager7.RecordCount = bll.GetCount(strwhere);//.Tables[0].Rows.Count;
              Rep15.DataSource = bll.GetList(UcfarPager7.PageSize, UcfarPager7.PageIndex, strwhere, "id", 1);
              Rep15.DataBind();
            
        }
        private void BindInfo5(string strwhere)
        {
            Panel5.Visible = true;
            JDJS.BLL.gczj bll = new JDJS.BLL.gczj();
            if (Operat == "delete")
            {
                bll.Delete(int.Parse(Id));
            }
            UcfarPager4.PageSize = 15;
            UcfarPager4.RecordCount = bll.GetCount(strwhere);//.Tables[0].Rows.Count;
            Rep5.DataSource = bll.GetList(UcfarPager4.PageSize, UcfarPager4.PageIndex, strwhere, "ptime", 1);
            Rep5.DataBind();
        }
        private void BindInfo6(string strwhere)
        {
            Panel6.Visible = true;
            JDJS.BLL.zcfg bll = new JDJS.BLL.zcfg();
            if (Operat == "delete")
            {
                bll.Delete(int.Parse(Id));
            }
            UcfarPager3.PageSize = 15;
            UcfarPager3.RecordCount = bll.GetCount(strwhere);//.Tables[0].Rows.Count;
            Rep6.DataSource = bll.GetList(UcfarPager3.PageSize, UcfarPager3.PageIndex, strwhere, "ptime", 1);
            Rep6.DataBind();
        }
        private void BindInfo7(string strwhere)
        {
            Panel7.Visible = true;
            JDJS.BLL.ebook bll = new JDJS.BLL.ebook();
            if (Operat == "delete")
            {
                bll.Delete(int.Parse(Id));
            }
            UcfarPager2.PageSize = 15;
            UcfarPager2.RecordCount = bll.GetList(strwhere).Tables[0].Rows.Count;//.Tables[0].Rows.Count;
            Rep7.DataSource = bll.GetList(UcfarPager2.PageSize, UcfarPager2.PageIndex, strwhere, "ptime", 1);
            Rep7.DataBind();
        }
        private void BindInfo8(string strwhere)
        {
            Panel8.Visible = true;
            JDJS.BLL.cust_base_info bll = new JDJS.BLL.cust_base_info();
            if (Operat == "delete")
            {
                bll.Delete(Id);
            }
            UcfarPager1.PageSize = 15;
            UcfarPager1.RecordCount = bll.GetCount(strwhere);//.Tables[0].Rows.Count;
            Rep8.DataSource = bll.GetList(UcfarPager1.PageSize, UcfarPager1.PageIndex, strwhere, "newcode", 1);
            Rep8.DataBind();
        }
        private void BindInfo9(string strwhere)
        {
            Panel17.Visible = true;
            JDJS.BLL.real_material_data bll = new JDJS.BLL.real_material_data();
            if (Operat == "delete")
            {
                bll.Delete(int.Parse(Id));
            }
            UcfarPager8.PageSize = 15;
            UcfarPager8.RecordCount = bll.GetCount(strwhere);//.Tables[0].Rows.Count;
            Rep9.DataSource = bll.GetList(UcfarPager8.PageSize, UcfarPager8.PageIndex, strwhere, "seachid", 1);
            Rep9.DataBind();
        }
        private void BindInfo10(string strwhere)
        {
            Panel19.Visible = true;
            JDJS.BLL.xtgg bll = new JDJS.BLL.xtgg();
            if (Operat == "delete")
            {
                bll.Delete(int.Parse(Id));
            }
            UcfarPager9.PageSize = 15;
            UcfarPager9.RecordCount = bll.GetCount(strwhere);//.Tables[0].Rows.Count;
            Repeater1.DataSource = bll.GetList(UcfarPager9.PageSize, UcfarPager9.PageIndex, strwhere, "id", 1);
            Repeater1.DataBind();
        }
        private void BindInfo11(string strwhere)
        {
            Panel21.Visible = true;
            JDJS.BLL.Material_Trend bll = new JDJS.BLL.Material_Trend();
            if (Operat == "delete")
            {
                bll.Delete(int.Parse(Id));
            }
            UcfarPager10.PageSize = 15;
            UcfarPager10.RecordCount = bll.GetCount(strwhere);//.Tables[0].Rows.Count;
            Repeater2.DataSource = bll.GetList(UcfarPager10.PageSize, UcfarPager10.PageIndex, strwhere, "id", 1);
            Repeater2.DataBind();
        }

        protected void LinkButton1_Click(object sender, EventArgs e)
        {
            Response.Redirect("Content.aspx?type=" + Part + "&Ntype=" + DropDownList1.SelectedValue + "&KeyWord=" + txtTitle.Text + "&Begin=" + txtBg.Text + "&End=" + txtEnd.Text);
        }
        private void SeachCor()
        {
            string Ntype = "";
            string KeyWord = "";
            string Begin = "";
            string End = "";
            string strwhere = "1=1";
            if (!string.IsNullOrEmpty(Request.QueryString["Ntype"]))
            {
                Ntype = LTP.Common.StringPlus.htmlstr(Request.QueryString["Ntype"]);
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
            if (!string.IsNullOrEmpty(Ntype))
            {
                strwhere += " and sort='" + Ntype + "' ";
            }
            if (!string.IsNullOrEmpty(KeyWord))
            {
                strwhere += " and title like '%" + KeyWord + "%' ";
            }
            if (!string.IsNullOrEmpty(Begin))
            {
                strwhere += " and ptime>'" + Begin + "' ";
            }
            if (!string.IsNullOrEmpty(End))
            {
                strwhere += " and ptime<'" + End + "' ";
            }
            switch (Part)
            {
                case "Corner":
                    BindInfo5(strwhere);
                    break;
                case "Policy":
                    BindInfo6(strwhere);
                    break;
            }
            
        }
        private void SeachNew()
        {
            string Ntype = "";
            string KeyWord = "";
            string Begin = "";
            string End = "";
            string strwhere = "1=1";
            if (!string.IsNullOrEmpty(Request.QueryString["Ntype"]))
            {
                Ntype = LTP.Common.StringPlus.htmlstr(Request.QueryString["Ntype"]);
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
            if (!string.IsNullOrEmpty(Ntype))
            {
                strwhere += " and type='" + Ntype + "' ";
            }
              if(!string.IsNullOrEmpty(KeyWord))
            {
                strwhere+= " and title like '%" + KeyWord+"%' ";
            }
            if (!string.IsNullOrEmpty(Begin))
            {
                strwhere += " and ptime>'" + Begin + "' ";
            }
            if (!string.IsNullOrEmpty(End))
            {
                strwhere += " and ptime<'" + End + "' ";
            }
            switch (Part)
            {
                case "News":
                    BindInfo1(strwhere);
                    break;
               
            }
        }
        private void SeachBook()
        {
            string Ntype = "";
            string KeyWord = "";
            string Begin = "";
            string End = "";
            string strwhere = "1=1";
            if (!string.IsNullOrEmpty(Request.QueryString["Ntype"]))
            {
                Ntype = LTP.Common.StringPlus.htmlstr(Request.QueryString["Ntype"]);
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
            if (!string.IsNullOrEmpty(Ntype))
            {
                strwhere += " and type='" + Ntype + "' ";
            }
            if (!string.IsNullOrEmpty(KeyWord))
            {
                strwhere += " and bookname like '%" + KeyWord + "%' ";
            }
            if (!string.IsNullOrEmpty(Begin))
            {
                strwhere += " and ptime>'" + Begin + "' ";
            }
            if (!string.IsNullOrEmpty(End))
            {
                strwhere += " and ptime<'" + End + "' ";
            }
            BindInfo7(strwhere);
        }
        private void SeachPro()
        {

            string KeyWord = "";
            string Begin = "";
            string End = "";
            string strwhere = "1=1";
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
            if (!string.IsNullOrEmpty(KeyWord))
            {
                strwhere += " and 项目名称 like '%" + KeyWord + "%' ";
            }
            if (!string.IsNullOrEmpty(Begin))
            {
                strwhere += " and 发布日期>'" + Begin + "' ";
            }
            if (!string.IsNullOrEmpty(End))
            {
                strwhere += " and 发布日期<'" + End + "' ";
            }
            BindInfo2(strwhere);
        }
        private void SeachUser()
        {

            string Uname = "";
            string Cname = "";
            string strwhere = "1=1";
            if (!string.IsNullOrEmpty(Request.QueryString["Uname"]))
            {
                Uname = LTP.Common.StringPlus.htmlstr(Request.QueryString["Uname"]);
            }
            if (!string.IsNullOrEmpty(Request.QueryString["Cname"]))
            {
                Cname = LTP.Common.StringPlus.htmlstr(Request.QueryString["Cname"]);
            }

            if (!string.IsNullOrEmpty(Uname))
            {
                strwhere += " and newcode like '%" + Uname + "%' ";
            }
            if (!string.IsNullOrEmpty(Cname))
            {
                strwhere += " and unit like '%" + Cname + "%' ";
            }
         
            BindInfo8(strwhere);
        }
        private void SeachCp()
        {

            string Cid = "";
            string Cname = "";
            string strwhere = "1=1";
            if (!string.IsNullOrEmpty(Request.QueryString["Cid"]))
            {
                Cid = LTP.Common.StringPlus.htmlstr(Request.QueryString["Cid"]);
            }
            if (!string.IsNullOrEmpty(Request.QueryString["Cname"]))
            {
                Cname = LTP.Common.StringPlus.htmlstr(Request.QueryString["Cname"]);
            }

            if (!string.IsNullOrEmpty(Cid))
            {
                strwhere += " and cid like '%" + Cid + "%' ";
            }
            if (!string.IsNullOrEmpty(Cname))
            {
                strwhere += " and company like '%" + Cname + "%' ";
            }

            BindInfo4(strwhere);
        }
        private void SeachMark()
        {
            string KeyWord = "";
            string strwhere = "1=1";
            if (!string.IsNullOrEmpty(Request.QueryString["KeyWord"]))
            {
                KeyWord = LTP.Common.StringPlus.htmlstr(Request.QueryString["KeyWord"]);
            }
            if (!string.IsNullOrEmpty(KeyWord))
            {
                strwhere += " and company like '%" + KeyWord + "%' ";
            }
            BindInfo3(strwhere);
        }
        private void SeachTj()
        {
            string Sid = "";
            string Zname = "";
            string strwhere = "1=1";
            if (!string.IsNullOrEmpty(Request.QueryString["Sid"]))
            {
                Sid = LTP.Common.StringPlus.htmlstr(Request.QueryString["Sid"]);
            }
            if (!string.IsNullOrEmpty(Request.QueryString["Zname"]))
            {
                Zname = LTP.Common.StringPlus.htmlstr(Request.QueryString["Zname"]);
            }
            if (!string.IsNullOrEmpty(Sid))
            {
                strwhere += " and seachid like '%" + Sid + "%' ";
            }
            if (!string.IsNullOrEmpty(Zname))
            {
                strwhere += " and zname like '%" + Zname + "%' ";
            }
            BindInfo9(strwhere);
        }
        private void SeachNotice()
        {
            string Notice = "";
            string strwhere = "1=1";
            if (!string.IsNullOrEmpty(Request.QueryString["Notice"]))
            {
                Notice = LTP.Common.StringPlus.htmlstr(Request.QueryString["Notice"]);
            }
            if (!string.IsNullOrEmpty(Notice))
            {
                strwhere += " and title like '%" + Notice + "%' ";
            }
            BindInfo10(strwhere);
        }

        protected void LinkButton2_Click(object sender, EventArgs e)
        {
            Response.Redirect("Content.aspx?type=" + Part + "&tb=" + DropDownList2.SelectedValue + "&KeyWord=" + TextBox1.Text + "&Begin=" + TextBox2.Text + "&End=" + TextBox3.Text);
        }

        protected void LinkButton3_Click(object sender, EventArgs e)
        {
            Response.Redirect("Content.aspx?type=" + Part + "&KeyWord=" + TextBox4.Text);
        }

        protected void LinkButton4_Click(object sender, EventArgs e)
        {
            Response.Redirect("Content.aspx?type=" + Part + "&Ntype=" + DropDownList3.SelectedValue + "&KeyWord=" + TextBox5.Text + "&Begin=" + TextBox6.Text + "&End=" + TextBox7.Text);
        }

        protected void LinkButton5_Click(object sender, EventArgs e)
        {
            Response.Redirect("Content.aspx?type=" + Part + "&Ntype=" + DropDownList4.SelectedValue + "&KeyWord=" + TextBox8.Text + "&Begin=" + TextBox9.Text + "&End=" + TextBox10.Text);
        }

        protected void LinkButton6_Click(object sender, EventArgs e)
        {
            Response.Redirect("Content.aspx?type=" + Part + "&Ntype=" + DropDownList5.SelectedValue + "&KeyWord=" + TextBox11.Text + "&Begin=" + TextBox12.Text + "&End=" + TextBox13.Text);
        }

        protected void LinkButton7_Click(object sender, EventArgs e)
        {
            Response.Redirect("Content.aspx?type=" + Part + "&Uname=" + TextBox15.Text + "&Cname=" + TextBox15.Text);
        }

        protected void LinkButton8_Click(object sender, EventArgs e)
        {
            Response.Redirect("Content.aspx?type=" + Part + "&Cid=" + TextBox16.Text + "&Cname=" + TextBox17.Text);
        }

        protected void LinkButton9_Click(object sender, EventArgs e)
        {
            Response.Redirect("Content.aspx?type=" + Part + "&Sid=" + TextBox18.Text + "&Zname=" + TextBox19.Text);
        }

        protected void LinkButton10_Click(object sender, EventArgs e)
        {
            Response.Redirect("Content.aspx?type=" + Part + "&Notice=" + TextBox20.Text);
        }
        protected void LinkButton11_Click(object sender, EventArgs e)
        {

            GotoSQpag();
            
        }

        private void GotoSQpag() 
        {
            string SeachTo = "Content.aspx?type=" + Part + "&uid=" + ((JDJS.Model.Admin)Session["AdminInfo"]).uid + "&son=" + ((JDJS.Model.Admin)Session["AdminInfo"]).son;
            if (DropDownList6.SelectedValue != "-1")
            {
                SeachTo += "&SQType=" + LTP.Common.StringPlus.htmlstr(DropDownList6.SelectedValue);
            }

            if (!string.IsNullOrEmpty(TextBox22.Text.Trim()))
            {
                SeachTo += "&BeginNopay=" + LTP.Common.StringPlus.htmlstr(TextBox22.Text.Trim());
            }
            if (!string.IsNullOrEmpty(TextBox23.Text.Trim()))
            {
                SeachTo += "&EndNopay=" + LTP.Common.StringPlus.htmlstr(TextBox23.Text.Trim());
            }

            if (!string.IsNullOrEmpty(TextBox24.Text.Trim()))
            {
                SeachTo += "&Beginpay=" + LTP.Common.StringPlus.htmlstr(TextBox24.Text.Trim());
            }

            if (!string.IsNullOrEmpty(TextBox25.Text.Trim()))
            {
                SeachTo += "&Endpay=" + LTP.Common.StringPlus.htmlstr(TextBox25.Text.Trim());
            }
            if (!string.IsNullOrEmpty(((JDJS.Model.Admin)Session["AdminInfo"]).son))
            {
                SeachTo += "&son=" + ((JDJS.Model.Admin)Session["AdminInfo"]).son;
            }

            Response.Redirect(SeachTo);
            //Response.Redirect("Content.aspx?type=" + Part + "&uid=" + ((JDJS.Model.Admin)Session["AdminInfo"]).uid);
        }

        private void SeachSQ()
        {
            string SQtype = "";
            
            string BeginNopay = "";
            string EndNopay = "";
            string Beginpay = "";
            string Endpay = "";
            string strwhere = "1=1 and charindex(uid ,'" + ((JDJS.Model.Admin)Session["AdminInfo"]).son + "' )>0 ";
            string addtime = "";
            //string son = ""; "and charindex(uid ,'"+((JDJS.Model.Admin)Session["AdminInfo"]).son+"' )>0"

            if (!string.IsNullOrEmpty(Request.QueryString["SQtype"]))
            {
                SQtype = LTP.Common.StringPlus.htmlstr(Request.QueryString["SQtype"]);
            }
           
            if (!string.IsNullOrEmpty(Request.QueryString["BeginNopay"]))
            {
                BeginNopay = LTP.Common.StringPlus.htmlstr(Request.QueryString["BeginNopay"]);
            }
            if (!string.IsNullOrEmpty(Request.QueryString["EndNopay"]))
            {
                EndNopay = LTP.Common.StringPlus.htmlstr(Request.QueryString["EndNopay"]);
            }
            if (!string.IsNullOrEmpty(Request.QueryString["Beginpay"]))
            {
                Beginpay = LTP.Common.StringPlus.htmlstr(Request.QueryString["Beginpay"]);
            }
            if (!string.IsNullOrEmpty(Request.QueryString["Endpay"]))
            {
                Endpay = LTP.Common.StringPlus.htmlstr(Request.QueryString["Endpay"]);
            }

            //if (!string.IsNullOrEmpty(Request.QueryString["son"]))
            //{
               // son = LTP.Common.StringPlus.htmlstr(Request.QueryString["son"]);
            //}

            if (SQtype != "-1"&&!string.IsNullOrEmpty(SQtype))
            {
                strwhere += " and cflag=" + SQtype;
            }
            
            if (!string.IsNullOrEmpty(BeginNopay))
            {
                strwhere += " and SQtime>='" + BeginNopay + "' ";
            }
            if (!string.IsNullOrEmpty(EndNopay))
            {
                addtime = Convert.ToDateTime(EndNopay).AddDays(1).ToString();

                strwhere += " and SQtime<='" + addtime + "' ";
                
            }
            if (!string.IsNullOrEmpty(Beginpay))
            {
                strwhere += " and paytime>='" + Beginpay + "' ";
            }
            if (!string.IsNullOrEmpty(Endpay))
            {
                addtime = Convert.ToDateTime(Endpay).AddDays(1).ToString();
                strwhere += " and paytime<='" + addtime + "' ";
            }

            //if (!string.IsNullOrEmpty(son))
            //{
                //strwhere += " and uid like '%" + son + "%' ";
            //}

            BindInfoSQ(strwhere);
            GetSun(strwhere, "SQamount");
            if (!string.IsNullOrEmpty(SQtype))
            {
                DropDownList6.Items.FindByValue(SQtype).Selected = true;
            }
            else
            {
                DropDownList6.SelectedIndex = 0;
            }
            TextBox22.Text = Checkdate(BeginNopay);
            TextBox23.Text = Checkdate(EndNopay);
            TextBox24.Text = Checkdate(Beginpay);
            TextBox25.Text = Checkdate(Endpay);
            
        }
        private void BindInfoSQ(string strwhere)
        {
            PanelHZ.Visible = true;

            JDJS.BLL.SQ_Base_info bll = new JDJS.BLL.SQ_Base_info();

            //Bind_Tv(bll.GetList, TreeView1.Nodes, null, "itemcode", "specialCode", "name", "itemname");
            UcfarPager11.PageSize = 15;
            UcfarPager11.RecordCount = bll.GetCount(strwhere);//.Tables[0].Rows.Count;
            RepSQ.DataSource = bll.GetList(UcfarPager11.PageSize, UcfarPager11.PageIndex, strwhere, "LSid", 1);
            RepSQ.DataBind();
        }
        public string Checkdate(string time) 
        {
            try
            {
                Convert.ToDateTime(time);
                return time;
            }
            catch 
            {
                return "";
            }
        }
        private void GetSun(string strwhere, string colname)
        {

            JDJS.BLL.SQ_Base_info bll = new JDJS.BLL.SQ_Base_info();
            try
            {


                Label1.Text = bll.GetSum(strwhere, colname).ToString();
            }
            catch
            {
                Label1.Text = "0";
            }
        }
        public string Getpaytime(string ptime)
        {
            if (!string.IsNullOrEmpty(ptime))
            {
                return ptime;
            }
            else
            {
                return  "尚未付款";
            }
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
    }
}
