using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Discuz.Common;
using PageControl;
using System.Data;
using System.Data.SqlClient;


namespace JDJS.Web.ProjectGL
{
    public partial class Add : System.Web.UI.Page
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
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["AdminInfo"] != null)
            {
                if (!IsPostBack)
                {
                    BindInfo(Part,Operat);
                }
            }
            else
            {
                Response.Redirect("Login.aspx");
            }
        }
        private void BindInfo(string Part,string Operat)
        {
            switch (Part)
            {
               
                case "Project":
                    Panel2.Visible = true;
                    LoadPage();
                    break;

                case "Renmai":
                    Panel8.Visible = true;
                    LoadRenmai();
                    break;

                case "company":
                    Panel4.Visible = true;
                    Loadcompany();
                    break;

                case "Prolinkman":
                    Panelcompany.Visible = true;
                    if (!string.IsNullOrEmpty(Request.QueryString["Operat"]))    
                    {
                        
                        switch (Operat)
                        {
                            case "addlinkman":                          
                                Checkcar();
                                break;

                            case "Deletelinkman":                        
                                Deleterec();
                                break;

                            default:
                                break;
                        
                        }
                    }

                    seachlinkman();
                    /*if (Session["Cart"] == null)//如果购物篮不存在
                    {
                        NullBind();
                    }*/

                    break;
               
                default:
                    break;
            }
        }
        private void LoadPage()
        {
        JDJS.BLL.project_inforbase bll = new JDJS.BLL.project_inforbase();

        Labelptime.Text = DateTime.Now.Date.ToString();

        DropDownListstate.DataSource = bll.GetSql("SELECT prostate FROM project_inforbase GROUP BY prostate");
        DropDownListstate.DataValueField = "prostate";
        DropDownListstate.DataTextField = "prostate";
        DropDownListstate.DataBind();
        //DropDownListstate.Items.Insert(0, "全部信息");

        DropDownListplace.DataSource = bll.GetSql("SELECT proplace FROM project_inforbase GROUP BY proplace order by proplace");
        DropDownListplace.DataValueField = "proplace";
        DropDownListplace.DataTextField = "proplace";
        DropDownListplace.DataBind();
        //DropDownListplace.Items.Insert(0, "全部地区");
        
        }

        private void LoadRenmai()
        {
            string company="", pcid="";
            JDJS.BLL.TClinkman bll = new JDJS.BLL.TClinkman();
            lmchenghu.DataSource = bll.GetSql("SELECT chenghu FROM TClinkman GROUP BY chenghu");
            lmchenghu.DataValueField = "chenghu";
            lmchenghu.DataTextField = "chenghu";
            lmchenghu.DataBind();

            if (!string.IsNullOrEmpty(Request.QueryString["company"]))
            {
                company = LTP.Common.StringPlus.htmlstr(Request.QueryString["company"]);
            }

            if (!string.IsNullOrEmpty(Request.QueryString["pcid"]))
            {
                pcid = LTP.Common.StringPlus.htmlstr(Request.QueryString["pcid"]);
            }
            
            
            TextBox47.Text = company;
            TextBox1.Text = pcid;
        }

        private void Loadcompany()
        {
            JDJS.BLL.TCcompany bll = new JDJS.BLL.TCcompany();
            Comptype.DataSource = bll.GetSql("SELECT ctype FROM TCcompany GROUP BY ctype");
            Comptype.DataValueField = "ctype";
            Comptype.DataTextField = "ctype";
            Comptype.DataBind();
        }

        protected void LinkButton1_Click(object sender, EventArgs e)
        {
            JDJS.BLL.project_inforbase bll = new JDJS.BLL.project_inforbase();
            JDJS.Model.project_inforbase model = new JDJS.Model.project_inforbase();
            model.proname = Textname.Text;

            model.proplace = DropDownListplace.Text;
            model.prosort = Textsort.Text;
            model.proquyu = Textquyu.Text;
            //model.id = Convert.ToInt32(TextID.Text);
          
            model.proaddress  = Textaddress.Text;
            model.promoney = Textmoney.Text;
            
            model.prostime = Convert.ToDateTime(Textstime.Text);
            model.proftime =Convert.ToDateTime(Textftime.Text);
            
            model.prorek = txtBody.Text;
            model.inforptime = DateTime.Now;


            //model.prosort = Textsort.Text;
            model.prostate = DropDownListstate.Text;
            model.disflag = DropDownList10.SelectedIndex;
           
            /* if (DropDownList10.SelectedIndex == 0)
            {
                model.disflag = 1;
            }
            else
            {
                model.disflag = 0;
            }*/
            try
            {
                TextID.Text = bll.Add(model).ToString();
                Panel2.Visible = false;
                LTP.Common.MessageBox.Show(this.Page, "添加成功!");
                //Part = "Procomp";
                BuildProidSession(TextID.Text);
                Response.Redirect("Add.aspx?type=Prolinkman"  + "&proid=" + TextID.Text);
                //seachcompany();
                //Panel3.Visible = true;
            }
            catch 
            {
                LTP.Common.MessageBox.Show(this.Page, "数据原因，添加操作失败！");
            }

        }

        protected void ADDlinkmanlist_Click(object sender, EventArgs e)
        {
            //for (int i = 0; i < this.Rep2.Items.Count; i++)
            //{
            System.Web.UI.WebControls.LinkButton ADDlinkmanlist = (System.Web.UI.WebControls.LinkButton)Rep2.FindControl("ADDlinkmanlist");
            //}
        }

        public void NullBind()
        { 
            DataTable cart = new DataTable();
            cart.Columns.Add("pepid");
            
            DataRow dr = cart.NewRow();           
            dr["pepid"] ="人脉列表为空";

            cart.Rows.Add(dr);//将数据行加入到cart表中
            Repcart.DataSource = cart;
            Repcart.DataBind();
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

       //SqlDataReader rd = new SqlDataReader();

       //if (rd.Read())
       //{
       dr["proid"] = Session["proidsession"];

           //dr["compid"] = rd[1];

       dr["pepid"] = LTP.Common.StringPlus.htmlstr(Request.QueryString["cartpepid"].ToString());

           //dr["disflag"] = rd[3];

           //dr["job"] = rd[4];

           //dr["rek"] = rd[5];

           cart.Rows.Add(dr);//将数据行加入到cart表中

           //Response.Write("<script language='javascript'>alert('添加了记录')</script>");

           //Response.Write(rd[1]);

           //Response.Write(rd[2]);

           //Response.Write(rd[3]);

           //Response.Write(rd[4]);

       //}
       Session["Cart"] = cart;//将数据表cart的值存入session保存
       Repcart.DataSource = cart;
       Repcart.DataBind();

       //Response.Write("<script language='javascript'>alert('购买成功')</script>");

       

     }





        public void BuildCart()
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

            this.BuildSession(cart);//往cart中添加一条记录

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

                this.BuildCart();//创建购物篮并将商品存入

            }

            else//购物篮存在
            {
                DataTable cart = Session["Cart"] as DataTable;

               // if (this.ExistBook(cart))//如果购物篮已存在该商品
                //{
                    this.BuildSession(cart); //修改购物篮中的商品

                //}

            }

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
            BindInfo2(strwhere);
        }

        private void Check_Clicked(Object sender, EventArgs e)
        {
            for (int i = 0; i < this.Rep2.Items.Count; i++)
            {
                System.Web.UI.WebControls.CheckBox checkbox2 = (System.Web.UI.WebControls.CheckBox)Rep2.Items[i].FindControl("CheckBox2");
            }
                //Message.Text = CalculateTotal(CheckBox2.Checked).ToString("c");

        }

        
        private void BindInfo2(string strwhere)
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
            Rep2.DataSource = bll.GetList(UcfarPager5.PageSize, UcfarPager5.PageIndex, strwhere, "id", 1);
            Rep2.DataBind();

          
        }
        protected void LinkButton2_Click(object sender, EventArgs e)
        {
            Response.Redirect("Add.aspx?type=Prolinkman" + "&KeyWord=" + Textcompany.Text +"&linkman="+Textlinkman.Text +"&job="+Textjob.Text+"&pcid=" + Textpcid.Text);
          
            //Response.Redirect("Content.aspx?type=" + Part + "&KeyWord=" + Textcompany.Text + "&pcid=" + Textpcid.Text);
        }
        protected void LinkButton3_Click(object sender, EventArgs e)
        {
            JDJS.BLL.TCcompany bll = new JDJS.BLL.TCcompany();
            JDJS.Model.TCcompany model = new JDJS.Model.TCcompany();
            
            model.company = TextBox58.Text;
            model.caddress = TextBox59.Text;
            model.ctype = Comptype.Text;
            
            model.cplace = TextBox62.Text;
            model.cemail = TextBox63.Text;
            model.cfax = TextBox64.Text;
            model.cweb = TextBox65.Text;
            model.cpost = TextBox66.Text;
            model.cphone = TextBox67.Text;
           
            bll.Add(model);
            LTP.Common.MessageBox.Show(this.Page, "添加公司信息成功!");
            Response.Redirect("Content.aspx?type=company");
        }

        

       

        

        protected void LinkButton7_Click(object sender, EventArgs e)
        {
            JDJS.BLL.TClinkman bll = new JDJS.BLL.TClinkman();
            JDJS.Model.TClinkman model1 = new JDJS.Model.TClinkman();
            model1.linkman = TextBox13.Text;
            model1.chenghu = lmchenghu.Text;
            model1.address = TextBox49.Text;
            model1.phone = TextBox51.Text;
            
            model1.place  = TextBox48.Text;
            model1.fax = TextBox55.Text;
         
            model1.email = TextBox54.Text;
           
            model1.job = TextBox56.Text;

            model1.companyname = TextBox47.Text;
            model1.cid = int.Parse(TextBox1.Text);
            if (!string.IsNullOrEmpty(TextBox47.Text))
            {
                bll.Add(model1);
                //DiscuzIntegration.Integration.Regedit(TextBox13.Text.Trim(), TextBox46.Text.Trim());
                LTP.Common.MessageBox.Show(this.Page, "添加人员成功!");
                Response.Redirect("Content.aspx?type=Renmai");

            }
            else
            {
                LTP.Common.MessageBox.Show(this.Page, "请先选择所属公司!");
            }
        }

      

       

       

        protected void DropDownList1_SelectedIndexChanged(object sender, EventArgs e)
        {
           /* if (DropDownList1.SelectedValue == "招标信息")
            {
                Panel9.Visible = true;
                Panel10.Visible = false;
            }
            else
            {
                Panel10.Visible = true;
                Panel9.Visible = false;
            }*/
        }

        

        
        #region 上传文件并转换为html wordToHtml(wordFilePath)
        /// 
        /// 上传文件并转存为html
        /// 
        /// word文档在客户机的位置
        /// 上传的html文件的地址
        public string wordToHtml(System.Web.UI.HtmlControls.HtmlInputFile wordFilePath)
        {
            Microsoft.Office.Interop.Word.ApplicationClass word = new Microsoft.Office.Interop.Word.ApplicationClass();
            Type wordType = word.GetType();
            Microsoft.Office.Interop.Word.Documents docs = word.Documents;

            // 打开文件
            Type docsType = docs.GetType();

            string filename = System.DateTime.Now.Year.ToString() + System.DateTime.Now.Month.ToString() + System.DateTime.Now.Day.ToString() +
            System.DateTime.Now.Hour.ToString() + System.DateTime.Now.Minute.ToString() + System.DateTime.Now.Second.ToString(); ;

            //应当先把文件上传至服务器然后再解析文件为html
            string filePath = uploadWord(wordFilePath, filename);

            //判断是否上传文件成功
            if (filePath == "0")
                return "0";
            //判断是否为word文件
            if (filePath == "1")
                return "1";

            object fileName = filePath;

            Microsoft.Office.Interop.Word.Document doc = (Microsoft.Office.Interop.Word.Document)docsType.InvokeMember("Open",
            System.Reflection.BindingFlags.InvokeMethod, null, docs, new Object[] { fileName, true, true });

            // 转换格式，另存为html
            Type docType = doc.GetType();


            //被转换的html文档保存的位置
            string ConfigPath = HttpContext.Current.Server.MapPath("/html/" + filename + ".html");
            object saveFileName = ConfigPath;

            /*下面是Microsoft Word 9 Object Library的写法，如果是10，可能写成：
            * docType.InvokeMember("SaveAs", System.Reflection.BindingFlags.InvokeMethod,
            * null, doc, new object[]{saveFileName, Word.WdSaveFormat.wdFormatFilteredHTML});
            * 其它格式：
            * wdFormatHTML
            * wdFormatDocument
            * wdFormatDOSText
            * wdFormatDOSTextLineBreaks
            * wdFormatEncodedText
            * wdFormatRTF
            * wdFormatTemplate
            * wdFormatText
            * wdFormatTextLineBreaks
            * wdFormatUnicodeText
            */
            docType.InvokeMember("SaveAs", System.Reflection.BindingFlags.InvokeMethod,
            null, doc, new object[] { saveFileName, Microsoft.Office.Interop.Word.WdSaveFormat.wdFormatFilteredHTML });

            // 退出 Word
            wordType.InvokeMember("Quit", System.Reflection.BindingFlags.InvokeMethod, null, word, null);
            //转到新生成的页面
            return filename;
        }
        #endregion

        public string uploadWord(System.Web.UI.HtmlControls.HtmlInputFile uploadFiles, string newName)
        {
            if (uploadFiles.PostedFile != null)
            {
                string fileName = uploadFiles.PostedFile.FileName;
                int extendNameIndex = fileName.LastIndexOf(".");
                string extendName = fileName.Substring(extendNameIndex);

                try
                {
                    //验证是否为word格式
                    if (extendName == ".doc")
                    {
                        //上传路径 指当前上传页面的同一级的目录下面的wordTmp路径
                        uploadFiles.PostedFile.SaveAs(System.Web.HttpContext.Current.Server.MapPath("/files/" + newName + extendName));
                    }
                    else
                    {
                        return "1";
                    }
                }
                catch
                {
                    return "0";
                }
                //return "http://" + HttpContext.Current.Request.Url.Host + HttpContext.Current.Request.ApplicationPath + "/wordTmp/" + newName + extendName;
                return System.Web.HttpContext.Current.Server.MapPath("/files/" + newName + extendName);
            }

            else
            {
                return "0";
            }
        }

       
        protected void LBpeplist_Check(object sender, EventArgs e)
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
        }


        private void SavePeplist(DataTable cart)
        {
            string proid;
            proid = Session["proidsession"].ToString();
            JDJS.BLL.pro_linkman_list bll = new JDJS.BLL.pro_linkman_list();
            JDJS.Model.pro_linkman_list model1 = new JDJS.Model.pro_linkman_list();
            for (int i = cart.Rows.Count - 1; i >= 0; i--)
            {
                model1.proid =  Convert.ToInt32(cart.Rows[i]["proid"].ToString());
                model1.pepid = Convert.ToInt32(cart.Rows[i]["pepid"].ToString());
                bll.Add(model1);
            }
           
                Session.Remove("Cart");
                Response.Redirect("Edit.aspx?type=Project" + "&proid=" + proid+"&Act=EditLinkman");
           
        }

        protected void LinkButton4_Check(object sender, EventArgs e)
        {
            seachCMP(TextBox6.Text, TextBox7.Text);
        }

        public string SelectCompanyClick(string pcid, string company)
        {
            TextBox47.Text = company;
            TextBox1.Text = pcid;
            return "";
        }
        private void seachCMP(string pcid,string company)
        {
            string strwhere=" 1=1 ";
            if (!string.IsNullOrEmpty(pcid))
            {
                strwhere =strwhere+ " and pcid=" + pcid;
            }
            if (!string.IsNullOrEmpty(company))
            {
                strwhere = strwhere+" and company like'%"+company+"%'";
            }
            Bindcompany(strwhere);
        }
        private void Bindcompany(string strwhere)
        {


            JDJS.BLL.TCcompany bll = new JDJS.BLL.TCcompany();
          
            //UcfarPager5.PageSize = 15;
            //UcfarPager5.RecordCount = bll.GetCount(strwhere);
            Repeater1.DataSource = bll.GetList(strwhere);
            Repeater1.DataBind();


        }
    }
}
