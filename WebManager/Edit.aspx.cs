using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Discuz.Common;

namespace JDJS.Web.WebManager
{
    public partial class Edit : System.Web.UI.Page
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
        public string LSid
        {
            get
            {
                if (!string.IsNullOrEmpty(Request.QueryString["LSid"]))
                {
                    return Request.QueryString["LSid"];
                }
                else
                {
                    return "";
                }
            }
        }
        public string Disid
        {
            get
            {
                if (!string.IsNullOrEmpty(Request.QueryString["Disid"]))
                {
                    return Request.QueryString["Disid"];
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
                    BindInfo(Part);
                }
            }
            else
            {
                Response.Redirect("Login.aspx");
            }
        }
        private void BindInfo(string Part)
        {
            switch (Part)
            {
                case "News":
                    BindInfo1();
                    break;
                case "Project":
                    BindInfo2();
                    break;
                case "Market":
                    BindInfo3();
                    break;
                case "Company":
                    BindInfo4();
                    break;
                case "Supply":
                    BindInfo4();
                    break;
                case "Corner":
                    BindInfo5();
                    break;
                case "Policy":
                    BindInfo6();
                    break;
                case "Download":
                    BindInfo7();
                    break;
                case "User":
                    BindInfo8();
                    break;
                case "Tj":
                    BindInfo9();
                    break;
                case "Notice":
                    BindInfo10();
                    break;
                case "SQ":
                    Bindsq();
                    break;
                default:
                    break;
            }
        }
        private void Bindsq()
        {
            string DDsql = " 1=1 ";
            string SQDsql = "";
            
            if (!string.IsNullOrEmpty(Disid))
            {
                JDJS.BLL.Discount_Table bll = new JDJS.BLL.Discount_Table();
                JDJS.Model.Discount_Table model = bll.GetModel(Disid);

                LabDBtitle.Text = model.title;

                JDJS.BLL.Discount_Detail_Table DDbll = new JDJS.BLL.Discount_Detail_Table();
                DDsql =DDsql+ " and Disid=" + Disid;
                RepDiscountDetail.DataSource = DDbll.GetList(DDsql);
                RepDiscountDetail.DataBind();

                JDJS.BLL.SQ_Base_info SQbbll = new JDJS.BLL.SQ_Base_info();
                JDJS.Model.SQ_Base_info SQbmodel = SQbbll.GetModel(Convert.ToInt32(LSid));
                LabSQcompany.Text = SQbmodel.SQcompany;
                LabSQlinkman.Text = SQbmodel.SQlinkman;
                try
                {
                    LabSQtime.Text = SQbmodel.SQtime.ToString();
                }
                catch 
                {
                    LabSQtime.Text = "";
                }
                try
                {
                    if (!string.IsNullOrEmpty(SQbmodel.Paytime.ToString()))
                    {
                        Labpaytime.Text = SQbmodel.Paytime.ToString();
                    }
                    else
                    {
                        Labpaytime.Text = "尚未付款";
                    }
                }
                catch
                {
                    Labpaytime.Text = "";
                }

                LabSQamount.Text = SQbmodel.SQamount.ToString();

                SQDsql = DDsql + " and Dis_d_id in (select Dis_d_id from SQ_Detail_info where LSid=" + LSid+")";
                RepSQDetail.DataSource = DDbll.GetList(SQDsql);
                RepSQDetail.DataBind();
                
                PanelSQ.Visible = true;
            }
        }
        private void BindInfo1()
        {
            if (!string.IsNullOrEmpty(Id))
            {
                JDJS.BLL.HYDT bll = new JDJS.BLL.HYDT();
                JDJS.Model.HYDT model = bll.GetModel(int.Parse(Id));
                txtTitle.Text = model.title;
                txtBody.Text = model.content;
                ddlType.SelectedValue = model.type;
                Panel1.Visible = true;
            }
        }
        private void BindInfo2()
        {
            if (!string.IsNullOrEmpty(Id))
            {
                Panel2.Visible = true;
                if (DropDownList1.SelectedValue == "中标信息")
                {
                    JDJS.BLL.Trade_result bll = new JDJS.BLL.Trade_result();
                    JDJS.Model.Trade_result model = bll.GetModel(int.Parse(Id));
                    TextBox34.Text = model.项目名称;
                    TextBox31.Text = model.类型;
                    TextBox32.Text = model.招标单位;
                    TextBox35.Text = model.建设地点;
                    TextBox33.Text = model.中标价;
                    TextBox37.Text = model.建筑面积;
                    TextBox36.Text = model.中标单位;
                    TextBox38.Text = model.中标日期.ToString();
                    TextBox39.Text = model.工期;
                    TextBox40.Text = model.中标通知书编号;
                    TextBox41.Text = model.发包方式;
                    TextBox44.Text = model.备注;
                    TextBox42.Text = model.招标代理单位;
                    TextBox43.Text = model.项目负责人姓名;
                }
                else
                {
                    JDJS.BLL.Trade_invite bll = new JDJS.BLL.Trade_invite();
                    JDJS.Model.Trade_invite model = bll.GetModel(int.Parse(Id));
                    TextBox17.Text = model.项目名称;
                    TextBox1.Text = model.类型;
                    TextBox2.Text = model.报建编号;
                    TextBox15.Text = model.招标单位;
                    TextBox16.Text = model.招标代理单位;
                    TextBox18.Text = model.建设地点;
                    TextBox19.Text = model.投资规模;
                    TextBox20.Text = model.建筑面积;
                    TextBox21.Text = model.联系人;
                    TextBox22.Text = model.电话;
                    TextBox23.Text = model.手机;
                    TextBox24.Text = model.报名日期;
                    TextBox25.Text = model.报名地点;
                    TextBox26.Text = model.报名条件;
                    TextBox30.Text = model.备注;
                    TextBox45.Text = model.招标编号;
                    TextBox27.Text = model.项目类别;
                    TextBox28.Text = model.工程类别;
                    TextBox29.Text = model.标段号;
                }
               
            }
        }
        private void BindInfo3()
        {
            if (!string.IsNullOrEmpty(Id))
            {
                JDJS.BLL.Dcust_WebShow bll = new JDJS.BLL.Dcust_WebShow();
                JDJS.Model.Dcust_WebShow model = bll.GetModel(int.Parse(Id));
                Label1.Text = model.newcode;
                TextBox3.Text = model.company;
                TextBox4.Text = model.content;
                Panel3.Visible = true;
            }
        }
        private void BindInfo4()
        {
            if (!string.IsNullOrEmpty(Id))
            {
                JDJS.BLL.material_company bll = new JDJS.BLL.material_company();
                JDJS.Model.material_company model = bll.GetModel(int.Parse(Id));
                TextBox57.Text = model.cid;
                TextBox58.Text = model.company;
                TextBox59.Text = model.address;
                TextBox60.Text = model.leader;
                TextBox61.Text = model.linkman;
                TextBox62.Text = model.tel;
                TextBox63.Text = model.email;
                TextBox64.Text = model.fax;
                TextBox65.Text = model.url;
                TextBox66.Text = model.post;
                TextBox67.Text = model.handset;
                Panel4.Visible = true;
            }
        }
        private void BindInfo5()
        {
            if (!string.IsNullOrEmpty(Id))
            {
                JDJS.BLL.gczj bll = new JDJS.BLL.gczj();
                JDJS.Model.gczj model = bll.GetModel(int.Parse(Id));
                TextBox7.Text = model.title;
                TextBox8.Text = model.content;
                DropDownList4.SelectedValue = model.sort;
                Panel5.Visible = true;
            }
        }
        private void BindInfo6()
        {
            if (!string.IsNullOrEmpty(Id))
            {
                JDJS.BLL.zcfg bll = new JDJS.BLL.zcfg();
                JDJS.Model.zcfg model = bll.GetModel(int.Parse(Id));
                TextBox10.Text = model.content;
                DropDownList5.SelectedValue = model.sort;
                TextBox9.Text = model.title;
                Panel6.Visible = true;
            }
        }
        private void BindInfo7()
        {
            if (!string.IsNullOrEmpty(Id))
            {
                JDJS.BLL.ebook bll = new JDJS.BLL.ebook();
                JDJS.Model.ebook model = bll.GetModel(int.Parse(Id));
                TextBox11.Text = model.bookname;
                DropDownList6.SelectedValue = model.type;
                Panel7.Visible = true;
            }
        }
        private void BindInfo8()
        {
            if (!string.IsNullOrEmpty(Id))
            {
                JDJS.BLL.cust_base_info bll = new JDJS.BLL.cust_base_info();
                JDJS.Model.cust_base_info model1 = bll.GetModel(Id);
                TextBox13.Text = model1.newcode;
                TextBox14.Text = model1.unit;
                TextBox49.Text = model1.linkman;
                TextBox51.Text = model1.phone;
                TextBox47.Text = model1.address;
                TextBox53.Text = model1.post;
                TextBox55.Text = model1.fax;
                TextBox48.Text = model1.deputy;
                DropDownList7.SelectedValue = model1.sex;
                TextBox52.Text = model1.mobile;
                TextBox46.Text = model1.pwd;
                TextBox54.Text = model1.email;
                TextBox56.Text = model1.duty;
                Panel8.Visible = true;
            }
        }
        private void BindInfo9()
        {
            if (!string.IsNullOrEmpty(Id))
            {
                JDJS.BLL.real_material_data bll = new JDJS.BLL.real_material_data();
                JDJS.Model.real_material_data model1 = bll.GetModel(int.Parse(Id));
                TextBox5.Text = model1.zname;
                TextBox6.Text = model1.zunit;
                TextBox12.Text = model1.Class;
                TextBox72.Text = model1.place;
                TextBox68.Text = model1.material;
                TextBox69.Text = model1.standard;
                TextBox70.Text = model1.cpname;
                TextBox73.Text = model1.cid;
                TextBox76.Text = model1.mid;
                TextBox74.Text = model1.model;
                TextBox77.Text = model1.bid.ToString();
                TextBox71.Text = model1.seachid;
                Panel11.Visible = true;
            }
        }
        private void BindInfo10()
        {
            if (!string.IsNullOrEmpty(Id))
            {
                JDJS.BLL.xtgg bll = new JDJS.BLL.xtgg();
                JDJS.Model.xtgg model1 = bll.GetModel(int.Parse(Id));
                TextBox75.Text=model1.title;
                WebEditor1.Text=model1.content;
                Panel12.Visible = true;
            }
        }

        protected void LinkButton1_Click(object sender, EventArgs e)
        {
            if (!string.IsNullOrEmpty(Id))
            {
                JDJS.BLL.Trade_invite bll = new JDJS.BLL.Trade_invite();
                JDJS.Model.Trade_invite model = bll.GetModel(int.Parse(Id));
                model.项目名称 = TextBox17.Text;
                model.类型 = TextBox1.Text;
                model.报建编号 = TextBox2.Text;
                model.招标单位 = TextBox15.Text;
                model.招标代理单位 = TextBox16.Text;
                model.建设地点 = TextBox18.Text;
                model.投资规模 = TextBox19.Text;
                model.建筑面积 = TextBox20.Text;
                model.联系人 = TextBox21.Text;
                model.电话 = TextBox22.Text;
                model.手机 = TextBox23.Text;
                model.报名日期 = TextBox24.Text;
                model.报名地点 = TextBox25.Text;
                model.报名条件 = TextBox26.Text;
                model.备注 = TextBox30.Text;
                model.发布日期 = DateTime.Now;
                model.招标编号 = TextBox45.Text;
                model.项目类别 = TextBox27.Text;
                model.工程类别 = TextBox28.Text;
                model.标段号 = TextBox29.Text;
                model.其他 = "";
                bll.Update(model);
                LTP.Common.MessageBox.Show(this.Page, "修改成功!");
            }
        }

        protected void LinkButton2_Click(object sender, EventArgs e)
        {
            if (!string.IsNullOrEmpty(Id))
            {
                JDJS.BLL.Dcust_WebShow bll = new JDJS.BLL.Dcust_WebShow();
                JDJS.Model.Dcust_WebShow model = bll.GetModel(int.Parse(Id));
                model.title = TextBox3.Text;
                model.content = TextBox4.Text;
                model.company = TextBox3.Text;
                bll.Update(model);
                LTP.Common.MessageBox.Show(this.Page, "修改成功!");
            }
        }

        protected void LinkButton3_Click(object sender, EventArgs e)
        {
            if (!string.IsNullOrEmpty(Id))
            {
                JDJS.BLL.material_company bll = new JDJS.BLL.material_company();
                JDJS.Model.material_company model = bll.GetModel(int.Parse(Id));
                model.cid = TextBox57.Text;
                model.company = TextBox58.Text;
                model.address = TextBox59.Text;
                model.leader = TextBox60.Text;
                model.linkman = TextBox61.Text;
                model.tel = TextBox62.Text;
                model.email = TextBox63.Text;
                model.fax = TextBox64.Text;
                model.url = TextBox65.Text;
                model.post = TextBox66.Text;
                model.handset = TextBox67.Text;
                bll.Update(model);
                LTP.Common.MessageBox.Show(this.Page, "修改成功!");
            }
        }

        protected void LinkButton4_Click(object sender, EventArgs e)
        {
            if (!string.IsNullOrEmpty(Id))
            {
                JDJS.BLL.gczj bll = new JDJS.BLL.gczj();
                JDJS.Model.gczj model = bll.GetModel(int.Parse(Id));
                model.title = TextBox7.Text;
                model.content = TextBox8.Text;
                model.ptime = DateTime.Now;
                model.url = "";
                model.sort = DropDownList4.SelectedValue;
                model.confirm = 0;
                bll.Update(model);
                LTP.Common.MessageBox.Show(this.Page, "修改成功!");
            }
        }

        protected void LinkButton5_Click(object sender, EventArgs e)
        {
            if (!string.IsNullOrEmpty(Id))
            {
                JDJS.BLL.zcfg bll = new JDJS.BLL.zcfg();
                JDJS.Model.zcfg model = bll.GetModel(int.Parse(Id));
                model.url = "";
                model.content = TextBox10.Text;
                model.ptime = DateTime.Now;
                model.sort = DropDownList5.SelectedValue;
                model.title = TextBox9.Text;
                bll.Update(model);
                LTP.Common.MessageBox.Show(this.Page, "修改成功!");
            }
        }

        protected void LinkButton6_Click(object sender, EventArgs e)
        {
            if (!string.IsNullOrEmpty(Id))
            {
                JDJS.BLL.ebook bll = new JDJS.BLL.ebook();
                JDJS.Model.ebook model = bll.GetModel(int.Parse(Id));
                model.bookname = TextBox11.Text;
                model.download = 0;
                model.downloadcnt = 0;
                model.ptime = DateTime.Parse(TextBox50.Text);
                model.type = DropDownList6.SelectedValue;
                if (!string.IsNullOrEmpty(FileUpload1.FileName))
                {
                    model.address = "../files/ebook/" + FileUpload1.FileName;
                }
                FileUpload1.SaveAs(Server.MapPath("../files/ebook/" + FileUpload1.FileName));
                bll.Update(model);
                LTP.Common.MessageBox.Show(this.Page, "修改成功!");
            }
        }

        protected void LinkButton7_Click(object sender, EventArgs e)
        {
            if (!string.IsNullOrEmpty(Id))
            {
                JDJS.BLL.cust_base_info bll = new JDJS.BLL.cust_base_info();
                JDJS.Model.cust_base_info model1 = bll.GetModel(Id);
                model1.newcode = TextBox13.Text.Trim();
                model1.unit = TextBox14.Text;
                model1.linkman = TextBox49.Text;
                model1.phone = TextBox51.Text;
                model1.address = TextBox47.Text;
                model1.post = TextBox53.Text;
                model1.fax = TextBox55.Text;
                model1.ftime = DateTime.Now;
                model1.enddate = DateTime.Now;
                model1.deputy = TextBox48.Text;
                model1.sex = DropDownList7.SelectedValue;
                model1.mobile = TextBox52.Text;
                model1.pwd = TextBox46.Text.Trim();
                model1.email = TextBox54.Text;
                model1.url = "";
                model1.duty = TextBox56.Text;
                model1.brief = "";
                model1.product = "";
                model1.needinfo = "";
                model1.mailadder = "";
                model1.mailman = "";
                model1.mailunit = "";
                model1.mailpost = "";
                model1.addrerror = "n";
                model1.norecieve = 0;
                model1.sendtype = 0;
                model1.freeflag = 0;
                model1.overflag = 0;
                model1.custtype = "赠阅";
                model1.cflag = 0;
                model1.tflag = 0;
                model1.ctkflag = 0;
                model1.hfdate = DateTime.Now;
                model1.hfflag = 0;
                bll.Update(model1);
                DiscuzIntegration.Integration.Regedit(TextBox13.Text.Trim(), TextBox46.Text.Trim());
                LTP.Common.MessageBox.Show(this.Page, "修改成功!");
            }
        }

        protected void LinkButton8_Click(object sender, EventArgs e)
        {
            if (!string.IsNullOrEmpty(Id))
            {
                JDJS.BLL.Trade_result bll = new JDJS.BLL.Trade_result();
                JDJS.Model.Trade_result model = bll.GetModel(int.Parse(Id));
                model.项目名称 = TextBox34.Text;
                model.类型 = TextBox31.Text;
                model.招标单位 = TextBox32.Text;
                model.建设地点 = TextBox35.Text;
                model.中标价 = TextBox33.Text;
                model.建筑面积 = TextBox37.Text;
                model.中标单位 = TextBox36.Text;
                model.中标日期 = DateTime.Parse(TextBox38.Text);
                model.工期 = TextBox39.Text;
                model.中标通知书编号 = TextBox40.Text;
                model.发包方式 = TextBox41.Text;
                model.备注 = TextBox44.Text;
                model.发布日期 = DateTime.Now;
                model.招标代理单位 = TextBox42.Text;
                model.项目负责人姓名 = TextBox43.Text;
                model.其他 = "";
                bll.Update(model);
                LTP.Common.MessageBox.Show(this.Page, "修改成功!");
            }
        }

        protected void LinkButton9_Click(object sender, EventArgs e)
        {
            if (!string.IsNullOrEmpty(Id))
            {
                JDJS.BLL.real_material_data bll = new JDJS.BLL.real_material_data();
                JDJS.Model.real_material_data model = bll.GetModel(int.Parse(Id));
                model.zname = TextBox5.Text;
                model.zunit = TextBox6.Text;
                model.Class = TextBox12.Text;
                model.place = TextBox72.Text;
                model.material = TextBox68.Text;
                model.standard = TextBox69.Text;
                model.cpname = TextBox70.Text;
                model.cid = TextBox73.Text;
                model.mid = TextBox76.Text;
                model.model = TextBox74.Text;
                try
                {
                    model.bid = float.Parse(TextBox77.Text);
                }
                catch
                {
                    LTP.Common.MessageBox.Show(this.Page, "请输入正确的价格!");
                }
                model.seachid = TextBox71.Text;
                if (FileUpload2.HasFile)
                {
                    model.imgpath = "../files/img/" + FileUpload1.FileName;
                    FileUpload1.SaveAs(Server.MapPath("../files/img/" + FileUpload1.FileName));
                }
                bll.Update(model);
                LTP.Common.MessageBox.Show(this.Page, "修改成功!");
            }
        }

        protected void lbSubmit_Click(object sender, EventArgs e)
        {
            if (!string.IsNullOrEmpty(Id))
            {
                JDJS.BLL.HYDT bll = new JDJS.BLL.HYDT();
                JDJS.Model.HYDT model = bll.GetModel(int.Parse(Id));
                model.title = txtTitle.Text;
                model.content = txtBody.Text;
                model.ptime = DateTime.Now;
                model.type = ddlType.SelectedValue;
                bll.Update(model);
                LTP.Common.MessageBox.Show(this.Page, "修改成功!");
            }
        }

        protected void DropDownList1_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (DropDownList1.SelectedValue == "招标信息")
            {
                Panel9.Visible = true;
                Panel10.Visible = false;
                BindInfo2();
            }
            else
            {
                Panel10.Visible = true;
                Panel9.Visible = false;
                BindInfo2();
            }
        }

        protected void LinkButton10_Click(object sender, EventArgs e)
        {
            JDJS.BLL.xtgg bll = new BLL.xtgg();
            JDJS.Model.xtgg model = bll.GetModel(int.Parse(Id));
            model.ptime = DateTime.Now;
            model.title = TextBox75.Text;
            model.content = WebEditor1.Text;
            bll.Update(model);
            LTP.Common.MessageBox.Show(this.Page, "修改成功!");
        }










    }
}
