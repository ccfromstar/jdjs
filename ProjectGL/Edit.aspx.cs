using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Discuz.Common;
using System.Data;
using System.Data.SqlClient;

namespace JDJS.Web.ProjectGL
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
        public string proid
        {
            get
            {
                if (!string.IsNullOrEmpty(Request.QueryString["proid"]))
                {
                    return Request.QueryString["proid"];
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
                if (!string.IsNullOrEmpty(Request.QueryString["Id"]))
                {
                    return Request.QueryString["Id"];
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


        public string Act
        {
            get
            {
                if (!string.IsNullOrEmpty(Request.QueryString["Act"]))
                {
                    return Request.QueryString["Act"];
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
                    BindInfo(Part,Act);
                }
            }
            else
            {
                Response.Redirect("Login.aspx");
            }
        }
        private void BindInfo(string Part,string Act)
        {
            switch (Part)
            {           
                case "Project":
                    switch (Act)
                    {
                        case "EditLinkman":
                            Panel16.Visible = true;
                            BindInfo2(proid);
                         break;

                         case "EditPro":
                         Panel13.Visible = true;
                         BindInfo1(proid);
                         break;

                         case "EAdlinkman":
                         Panel15.Visible = true;
                         if (!string.IsNullOrEmpty(Request.QueryString["Operat"]))    
                         {
                        
                                switch (Operat)
                                {

                                    case "addlinkman":
                                        BindAddLinkInfo(proid);
                                        seachlinkman();
                                        break;
                                    
                                    case "Deletelinkman":
                                        seachlinkman();
                                        Deleterec();
                                     break;

                                    case "deleteSaverec":
                                     DeleteSaverec();
                                     break;

                                    default:
                                    break;
                        
                                }
                           }

                         
                         
                         break;
                        
                        default:
                            break;
                    }

                   // BindInfo2(proid);
                    break;
                case "Renmai":
                    BindRenmaiInfo();
                    Panel5.Visible = true;
                    break;
                
                case "company":
                    BindCompanyInfo();
                    Panel2.Visible = true;
                    break;
                
                default:
                    break;
            }
        }
        private void BindRenmaiInfo()
        {
            string company="", pcid="";
            if (!string.IsNullOrEmpty(Id))
            {
                JDJS.BLL.TClinkman bll = new JDJS.BLL.TClinkman();
                JDJS.Model.TClinkman model1 = bll.GetModel(int.Parse(Id));

                lmchenghu.DataSource = bll.GetSql("SELECT chenghu FROM TClinkman GROUP BY chenghu");
                lmchenghu.DataValueField = "chenghu";
                lmchenghu.DataTextField = "chenghu";
                lmchenghu.DataBind();

               TextBox13.Text= model1.linkman ;
               //lmchenghu.Text=model1.chenghu;
               lmchenghu.ClearSelection();

               lmchenghu.Items.FindByText(model1.chenghu).Selected = true;
                
               TextBox49.Text=model1.address;
               TextBox51.Text=model1.phone;

               TextBox48.Text= model1.place;
               TextBox55.Text=model1.fax;

               TextBox54.Text=model1.email;

               TextBox56.Text=model1.job;

               TextBox47.Text= model1.companyname;
               TextBox9.Text =model1.cid.ToString();
               // bll.Update(model1);
               // LTP.Common.MessageBox.Show(this.Page, "修改成功!");
               // Response.Redirect("Content.aspx?type=Renmai");
            }
            /*if (!string.IsNullOrEmpty(Request.QueryString["company"]))
            {
                company = LTP.Common.StringPlus.htmlstr(Request.QueryString["company"]);
                TextBox47.Text = company;
            }

            if (!string.IsNullOrEmpty(Request.QueryString["pcid"]))
            {
                pcid = LTP.Common.StringPlus.htmlstr(Request.QueryString["pcid"]);
                TextBox9.Text = pcid;
            }*/


            
            
        }
        protected void UpdateCompany_Click(object sender, EventArgs e)
        {
            TextBox47.Text = ((LinkButton)sender).CommandName.ToString();
            TextBox9.Text = ((LinkButton)sender).CommandArgument.ToString();
            
        }

        private void BindCompanyInfo()
        {
            if (!string.IsNullOrEmpty(Id))
            {
                JDJS.BLL.TCcompany bll = new JDJS.BLL.TCcompany();
                JDJS.Model.TCcompany model = bll.GetModel(int.Parse(Id));
                Comptype.DataSource = bll.GetSql("SELECT ctype FROM TCcompany GROUP BY ctype");
                Comptype.DataValueField = "ctype";
                Comptype.DataTextField = "ctype";
                Comptype.DataBind();
                TextBox1.Text=model.company;
                TextBox2.Text=model.caddress;
                
                Comptype.ClearSelection();

                Comptype.Items.FindByText(model.ctype).Selected = true;
                
                //Comptype.Text=model.ctype ;

                TextBox3.Text= model.cplace ;
                 TextBox4.Text=model.cemail ;
                TextBox5.Text= model.cfax;
                TextBox6.Text=model.cweb ;
                 TextBox7.Text=model.cpost;
                 TextBox8.Text=model.cphone;
               // bll.Update(model);
               // LTP.Common.MessageBox.Show(this.Page, "修改成功!");
               // Response.Redirect("Content.aspx?type=company");
            }
        }

        private void DeleteSaverec()
        {
            //Checkcar(proid);
            JDJS.BLL.pro_linkman_list bll = new JDJS.BLL.pro_linkman_list();
            bll.Delete(int.Parse(Id));
            Response.Redirect("Edit.aspx?type=Project" + "&proid=" + Session["proidsession"].ToString() + "&Act=EditLinkman");
            //BindInfo2(Session["proidsession"].ToString());
        }
         private void BindAddLinkInfo(string proid)
        {
            Checkcar();
        }

         public void Deleterec()
         {
             string id = LTP.Common.StringPlus.htmlstr(Request.QueryString["cartpepid"]);
             DataTable cart = Session["Cart"] as DataTable;


             for (int i = cart.Rows.Count - 1; i >= 0; i--)
             {
                 if (cart.Rows[i]["pepid"].ToString() == id)
                 {
                     cart.Rows[i].Delete();
                 }
             }
             if (cart.Rows.Count < 1)
             {
                 Session.Remove("Cart");
             }
             else
             {
                 Session["Cart"] = cart;//将数据表cart的值存入session保存
                 Repcart.DataSource = cart;
                 Repcart.DataBind();
             }
         }
        

         public void BuildSession(DataTable cart, string proid)
         {

             //新建一个数据行的记录

             DataRow dr = cart.NewRow();

             //SqlDataReader rd = new SqlDataReader();

             //if (rd.Read())
             //{
             dr["proid"] = Session["proidsession"];

             if (!string.IsNullOrEmpty(Request.QueryString["cartpepid"]))
             {
                 dr["pepid"] = LTP.Common.StringPlus.htmlstr(Request.QueryString["cartpepid"].ToString());
                 cart.Rows.Add(dr);//将数据行加入到cart表中
             }


             //dr["pepid"] = LTP.Common.StringPlus.htmlstr(Request.QueryString["cartpepid"].ToString());

            

             //cart.Rows.Add(dr);//将数据行加入到cart表中

            
             Session["Cart"] = cart;//将数据表cart的值存入session保存
             Repcart.DataSource = cart;
             Repcart.DataBind();

             //Response.Write("<script language='javascript'>alert('购买成功')</script>");



         }
         public void BuildProidSession(string proid)
         {

             if (Session["proidsession"] == null)//如果购物篮不存在
             {// Response.Write("<script language='javascript'>alert('1')</script>");

                 Session["proidsession"] = proid;

             }

             else//购物篮存在
             {
                 Session["proidsession"] = proid;

             }

         }
         public void BuildSession(DataTable cart)
         {

             //新建一个数据行的记录

             DataRow dr = cart.NewRow();

           
            /* dr["proid"] = proid;

             if (!string.IsNullOrEmpty(Request.QueryString["cartpepid"]))
             {
                 dr["pepid"] = LTP.Common.StringPlus.htmlstr(Request.QueryString["cartpepid"].ToString());
             }*/



           
             Session["Cart"] = cart;//将数据表cart的值存入session保存
             Repcart.DataSource = cart;
             Repcart.DataBind();

             //Response.Write("<script language='javascript'>alert('购买成功')</script>");



         }




         public void BuildCart(string proid)
         {//创建购物车

             DataTable cart = new DataTable();//已经创建了表，但是没有字段

             cart.Columns.Add("proid");

             //cart.Columns.Add("compid");

             cart.Columns.Add("pepid");

             //cart.Columns.Add("disflag");

             //cart.Columns.Add("job");

             //cart.Columns.Add("rek");

             //Response.Write("<script language='javascript'>alert('创建了表')</script>");

             //cart表中已有5个字段

             //将点击的商品加入购物车中
             if (!string.IsNullOrEmpty(Request.QueryString["cartpepid"]))
             {

                 this.BuildSession(cart, proid);//往cart中添加一条记录
             }
             else
             {
                 this.BuildSession(cart);
             }

         }

         /*public bool ExistBook(DataTable cart)
         {
             //a = e.CommandArgument.ToString();


             foreach (DataRow dr in cart.Rows)
             {

                 if (dr["QID"].ToString() == a)
                 {
                     dr["NUM"] = Convert.ToInt32(dr["NUM"]) + 1;

                     Session["Cart"] = cart;

                     //Response.Redirect("Cart.aspx");

                 }

             }

             return true;

         }*/

         private void Checkcar()
         {
             if (Session["Cart"] == null)//如果购物篮不存在
             {// Response.Write("<script language='javascript'>alert('1')</script>");

                 this.BuildCart(proid);//创建购物篮并将商品存入

             }

             else//购物篮存在
             {
                 DataTable cart = Session["Cart"] as DataTable;

                 // if (this.ExistBook(cart))//如果购物篮已存在该商品
                 //{
                 this.BuildSession(cart, proid); //修改购物篮中的商品

                 //}

             }

         }


        private void BindProBase(string proid)
        {
            JDJS.BLL.project_inforbase bll = new JDJS.BLL.project_inforbase();
            JDJS.Model.project_inforbase model = bll.GetModel(int.Parse(proid));

            DropDownListstate.DataSource = bll.GetSql("SELECT prostate FROM project_inforbase GROUP BY prostate");
            DropDownListstate.DataValueField = "prostate";
            DropDownListstate.DataTextField = "prostate";
            DropDownListstate.DataBind();
            //DropDownListstate.Items.Insert(0, "全部信息");
            DropDownListstate.ClearSelection();
            DropDownListstate.Items.FindByText(model.prostate).Selected = true;


            DropDownListplace.DataSource = bll.GetSql("SELECT proplace FROM project_inforbase GROUP BY proplace order by proplace");
            DropDownListplace.DataValueField = "proplace";
            DropDownListplace.DataTextField = "proplace";
            DropDownListplace.DataBind();
            //DropDownListplace.Items.Insert(0, "全部地区");
            DropDownListplace.ClearSelection();
            DropDownListplace.Items.FindByText(model.proplace).Selected = true;

            TextID.Text = model.id.ToString();
            Labelptime.Text = model.inforptime.ToString();
            Textname.Text = model.proname;
            Textsort.Text = model.prosort;
            Textaddress.Text = model.proaddress;
            Textquyu.Text = model.proquyu;
            Textstime.Text = model.prostime.ToString();
            Textftime.Text = model.proftime.ToString();
            Textmoney.Text = model.promoney;
            WebEditor2.Text = model.prorek;
            DropDownList10.SelectedIndex = model.disflag;
            /*if (model.disflag == 1)
            {
                DropDownList10.SelectedIndex = 0;
            }
            else
            {
                DropDownList10.SelectedIndex = 1;
            }*/
            
        }

        private void BindInfo1(string proid)
        {

            BindProBase(proid);
            
            
           // Panel4.Visible = true;

          
        }

        private void BindInfo2(string proid)
        {
            string strwhere;
            //strwhere = " id in (select pepid from pro_linkman_list where proid =" + proid + ")";
            //JDJS.BLL.TClinkman bll = new JDJS.BLL.TClinkman();
            JDJS.BLL.Pro_linkman_View bll = new JDJS.BLL.Pro_linkman_View();
            strwhere = "  proid =" + proid ;
            
            Rep2.DataSource = bll.GetList(strwhere);
            Rep2.DataBind();
        }

        private void seachlinkman()
        {



            string KeyWord = "";
            string id = "";
            string linkman = "";
            string job = "";
            string strwhere = " 1=1 ";
            if (!string.IsNullOrEmpty(Request.QueryString["KeyWord"]))
            {
                KeyWord = LTP.Common.StringPlus.htmlstr(Request.QueryString["KeyWord"]);
            }
            if (!string.IsNullOrEmpty(Request.QueryString["id"]))
            {
                id = LTP.Common.StringPlus.htmlstr(Request.QueryString["id"]);
            }

            if (!string.IsNullOrEmpty(Request.QueryString["linkman"]))
            {
                linkman = LTP.Common.StringPlus.htmlstr(Request.QueryString["linkman"]);
            }
            if (!string.IsNullOrEmpty(Request.QueryString["job"]))
            {
                job = LTP.Common.StringPlus.htmlstr(Request.QueryString["job"]);
            }

            if (!string.IsNullOrEmpty(KeyWord))
            {
                strwhere += " and companyname like '%" + KeyWord + "%' ";
            }
            if (!string.IsNullOrEmpty(id))
            {
                strwhere += " and id =" + id;
            }

            if (!string.IsNullOrEmpty(linkman))
            {
                strwhere += " and linkman like '%" + linkman + "%' ";
            }
            if (!string.IsNullOrEmpty(job))
            {
                strwhere += " and job like '%" + job + "%' ";
            }
            BindTClinkmanInfo(strwhere);
        }
        private void BindTClinkmanInfo(string strwhere)
        {
            Panelcompany.Visible = true;
            Panel3.Visible = true;

            JDJS.BLL.TClinkman bll = new JDJS.BLL.TClinkman();
            // if (Operat == "delete")
            //{
            //bll.Delete(int.Parse(Id));
            //}
            UcfarPager5.PageSize = 15;
            UcfarPager5.RecordCount = bll.GetCount(strwhere);//.Tables[0].Rows.Count;
            Repeater1.DataSource = bll.GetList(UcfarPager5.PageSize, UcfarPager5.PageIndex, strwhere, "id", 1);
            Repeater1.DataBind();


        }
        protected void LinkButton12_Click(object sender, EventArgs e)
        {
            Response.Redirect("Edit.aspx?type=Project" + "&Act=EAdlinkman" + "&Operat=addlinkman"+ "&KeyWord=" + Textcompany.Text + "&linkman=" + Textlinkman.Text + "&job=" + Textjob.Text + "&pcid=" + Textpcid.Text);
            //Response.Redirect("Edit.aspx?type=Project" + "&proid=" + proid + "&Act=EAdlinkman" + "&Operat=addlinkman");
            //Response.Redirect("Content.aspx?type=" + Part + "&KeyWord=" + Textcompany.Text + "&pcid=" + Textpcid.Text);
        }
    
      
  

     
    

        protected void LinkButton4_Click(object sender, EventArgs e)
        {
            if (!string.IsNullOrEmpty(Id))
            {
                JDJS.BLL.TCcompany bll = new JDJS.BLL.TCcompany();
                JDJS.Model.TCcompany model = bll.GetModel(int.Parse(Id));
                model.company = TextBox1.Text;
                model.caddress = TextBox2.Text;
                model.ctype = Comptype.Text;

                model.cplace = TextBox3.Text;
                model.cemail = TextBox4.Text;
                model.cfax = TextBox5.Text;
                model.cweb = TextBox6.Text;
                model.cpost = TextBox7.Text;
                model.cphone = TextBox8.Text;
                bll.UpdateREC(model);
                LTP.Common.MessageBox.Show(this.Page, "修改成功!");
                Response.Redirect("Content.aspx?type=company");
            }
        }

        protected void LinkButton1_Click(object sender, EventArgs e)
        {
            string id, job, rek; int compid, dsflag;
            for (int i = 0; i < this.Rep2.Items.Count; i++)
            {
                System.Web.UI.WebControls.DropDownList DLjs = (System.Web.UI.WebControls.DropDownList)Rep2.Items[i].FindControl("DLjs");
                System.Web.UI.WebControls.TextBox Textprojob = (System.Web.UI.WebControls.TextBox)Rep2.Items[i].FindControl("Textprojob");
                System.Web.UI.WebControls.TextBox Textrek = (System.Web.UI.WebControls.TextBox)Rep2.Items[i].FindControl("Textrek");
                System.Web.UI.WebControls.Label lbID = (System.Web.UI.WebControls.Label)Rep2.Items[i].FindControl("lbID");
                System.Web.UI.WebControls.DropDownList DLVisb = (System.Web.UI.WebControls.DropDownList)Rep2.Items[i].FindControl("DLVisb");
                id = lbID.Text; job = Textprojob.Text; rek = Textrek.Text;
                compid = DLjs.SelectedIndex; dsflag = DLVisb.SelectedIndex;
                UpdateLinkmanList(id,job,rek,compid,dsflag);
            }
            LTP.Common.MessageBox.Show(this.Page, "编辑成功!");
            Response.Redirect("Content.aspx?type=Project");
            //Response.Redirect("Edit.aspx?type=Project" + "&proid=" + proid + "&Act=EditPro");
        }

        private void UpdateLinkmanList(string id, string job, string rek, int compid,int dsflag)
        {
            JDJS.BLL.pro_linkman_list bll = new JDJS.BLL.pro_linkman_list();
            JDJS.Model.pro_linkman_list model = bll.GetModel(int.Parse(id),int.Parse(proid));
            model.job = job;
            model.rek = rek;
            model.compid = compid;
            model.disflag = dsflag;
           
            bll.Update(model);
            
        }

        protected void LinkButton11_Click(object sender, EventArgs e)
        {
            JDJS.BLL.project_inforbase bll = new JDJS.BLL.project_inforbase();
            JDJS.Model.project_inforbase model = new JDJS.Model.project_inforbase();
            model.id = int.Parse(TextID.Text);
            model.proname = Textname.Text;

            model.proplace = DropDownListplace.Text;
            model.prosort = Textsort.Text;
            model.proquyu = Textquyu.Text;
            //model.id = Convert.ToInt32(TextID.Text);

            model.proaddress = Textaddress.Text;
            model.promoney = Textmoney.Text;

            model.prostime = Convert.ToDateTime(Textstime.Text);
            model.proftime = Convert.ToDateTime(Textftime.Text);

            model.prorek = WebEditor2.Text;
            model.inforptime = DateTime.Now;


            //model.prosort = Textsort.Text;
            model.prostate = DropDownListstate.Text;
            model.disflag = DropDownList10.SelectedIndex;
            /*if (DropDownList10.SelectedIndex == 0)
            {
                model.disflag = 1;
            }
            else
            {
                model.disflag = 0;
            }*/
            bll.UpdateREC(model);
            BuildProidSession(TextID.Text);
            Response.Redirect("Edit.aspx?type=Project" + "&proid=" + proid + "&Act=EditLinkman");

        }

        protected void LinkButton2_Click(object sender, EventArgs e)
        {
            Response.Redirect("Edit.aspx?type=Project" + "&proid=" + proid + "&Act=EAdlinkman" + "&Operat=addlinkman");
        }

        protected void LBpeplist_Click(object sender, EventArgs e)
        {
            if (Session["Cart"] == null)//如果购物篮不存在
            {

                Response.Write("<script language='javascript'>alert('人脉列表不得为空')</script>");

            }

            else//购物篮存在
            {
                DataTable cart = Session["Cart"] as DataTable;
                if (cart.Rows.Count > 0)
                {
                    this.SavePeplist(cart);
                }
                else
                {
                    Response.Write("<script language='javascript'>alert('人脉列表不得为空')</script>");
                }

            }
           // Response.Redirect("Edit.aspx?type=Project" + "&proid=" + proid + "&Act=EditLinkman");
        }
        private void SavePeplist(DataTable cart)
        {
            string proid;
            proid = Session["proidsession"].ToString();
            JDJS.BLL.pro_linkman_list bll = new JDJS.BLL.pro_linkman_list();
            JDJS.Model.pro_linkman_list model1 = new JDJS.Model.pro_linkman_list();
            for (int i = cart.Rows.Count - 1; i >= 0; i--)
            {
                model1.proid = Convert.ToInt32(cart.Rows[i]["proid"].ToString());
                model1.pepid = Convert.ToInt32(cart.Rows[i]["pepid"].ToString());
                bll.Add(model1);
            }

            Session.Remove("Cart");
            Response.Redirect("Edit.aspx?type=Project" + "&proid=" + proid + "&Act=EditLinkman");

        }

        protected void LinkButton7_Click(object sender, EventArgs e)
        {
            if (!string.IsNullOrEmpty(Id))
            {
                JDJS.BLL.TClinkman bll = new JDJS.BLL.TClinkman();
                JDJS.Model.TClinkman model1 = bll.GetModel(int.Parse(Id));

                model1.linkman = TextBox13.Text;
                model1.chenghu = lmchenghu.Text;
                model1.address = TextBox49.Text;
                model1.phone = TextBox51.Text;

                model1.place = TextBox48.Text;
                model1.fax = TextBox55.Text;

                model1.email = TextBox54.Text;

                model1.job = TextBox56.Text;

                model1.companyname = TextBox47.Text;
                model1.cid = int.Parse(TextBox9.Text);
                bll.UpdateREC(model1);
                LTP.Common.MessageBox.Show(this.Page, "修改成功!");
                Response.Redirect("Content.aspx?type=Renmai");
            }
        }

        protected void LinkButton4_Check(object sender, EventArgs e)
        {
            seachCMP(TextBox10.Text, TextBox11.Text);
        }

        private void seachCMP(string pcid, string company)
        {
            string strwhere = " 1=1 ";
            if (!string.IsNullOrEmpty(pcid))
            {
                strwhere = strwhere + " and pcid=" + pcid;
            }
            if (!string.IsNullOrEmpty(company))
            {
                strwhere = strwhere + " and company like'%" + company + "%'";
            }
            Bindcompany(strwhere);
        }
        private void Bindcompany(string strwhere)
        {


            JDJS.BLL.TCcompany bll = new JDJS.BLL.TCcompany();

            //UcfarPager5.PageSize = 15;
            //UcfarPager5.RecordCount = bll.GetCount(strwhere);
            Repeater2.DataSource = bll.GetList(strwhere);
            Repeater2.DataBind();


        }
       

    }
}
