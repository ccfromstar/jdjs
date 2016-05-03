using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Discuz.Common;

namespace JDJS.Web.WebManager
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
                    Panel1.Visible = true;
                    break;
                case "Project":
                    Panel2.Visible = true;
                    break;
                case "Market":
                    Panel3.Visible = true;
                    break;
                case "Company":
                    Panel4.Visible = true;
                    break;
                case "Supply":
                    Panel4.Visible = true;
                    break;
                case "Corner":
                    Panel5.Visible = true;
                    break;
                case "Policy":
                    Panel6.Visible = true;
                    break;
                case "Download":
                    Panel7.Visible = true;
                    break;
                case "User":
                    Panel8.Visible = true;
                    break;
                case "Tj":
                    Panel11.Visible = true;
                    break;
                case "Notice":
                    Panel12.Visible = true;
                    break;
                case "WHtml":
                    Panel13.Visible = true;
                    break;
                default:
                    break;
            }
        }

        protected void LinkButton1_Click(object sender, EventArgs e)
        {
            JDJS.BLL.Trade_invite bll = new JDJS.BLL.Trade_invite();
            JDJS.Model.Trade_invite model = new JDJS.Model.Trade_invite();
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
            bll.Add(model);
            LTP.Common.MessageBox.Show(this.Page, "添加成功!");
        }

        protected void LinkButton2_Click(object sender, EventArgs e)
        {
            JDJS.BLL.cust_base_info bllinfo = new JDJS.BLL.cust_base_info();
            if (bllinfo.Exists(TextBox12.Text))
            {
                JDJS.BLL.Dcust_WebShow bll = new JDJS.BLL.Dcust_WebShow();
                JDJS.Model.Dcust_WebShow model = new JDJS.Model.Dcust_WebShow();
                model.company = TextBox3.Text;
                model.newcode = TextBox12.Text;
                model.title = TextBox3.Text;
                model.content = TextBox4.Text;
                model.url = "";
                bll.Add(model);
                LTP.Common.MessageBox.Show(this.Page, "添加成功!");
            }
            else
            {
                LTP.Common.MessageBox.Show(this.Page, "会员ID不存在!");
            }
        }

        protected void LinkButton3_Click(object sender, EventArgs e)
        {
            JDJS.BLL.material_company bll = new JDJS.BLL.material_company();
            JDJS.Model.material_company model = new JDJS.Model.material_company();
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
            model.bp = "";
            model.other = "";
            model.picture = "";
            model.remark = "";
            bll.Add(model);
            LTP.Common.MessageBox.Show(this.Page, "添加成功!");
        }

        protected void LinkButton4_Click(object sender, EventArgs e)
        {
            JDJS.BLL.gczj bll = new JDJS.BLL.gczj();
            JDJS.Model.gczj model = new JDJS.Model.gczj();
            model.title = TextBox7.Text;
            model.content = TextBox8.Text;
            model.ptime = DateTime.Parse(TextBox50.Text);
            model.url = "";
            model.sort = DropDownList4.SelectedValue;
            model.confirm = 0;
            bll.Add(model);
            LTP.Common.MessageBox.Show(this.Page, "添加成功!");
        }

        protected void LinkButton5_Click(object sender, EventArgs e)
        {
            JDJS.BLL.zcfg bll = new JDJS.BLL.zcfg();
            JDJS.Model.zcfg model = new JDJS.Model.zcfg();
            model.url = "";
            model.content = TextBox10.Text;
            model.ptime = DateTime.Now;
            model.sort = DropDownList5.SelectedValue;
            model.title = TextBox9.Text;
            model.cid = "";
            model.cp = "";
            bll.Add(model);
            LTP.Common.MessageBox.Show(this.Page, "添加成功!");
        }

        protected void LinkButton6_Click(object sender, EventArgs e)
        {
            JDJS.BLL.ebook bll = new JDJS.BLL.ebook();
            JDJS.Model.ebook model = new JDJS.Model.ebook();
            model.bookname = TextBox11.Text;
            model.download = 0;
            model.downloadcnt = 0;
            model.ptime = DateTime.Now;
            model.type = DropDownList6.SelectedValue;
            model.address = "../files/ebook/" + FileUpload1.FileName;
            FileUpload1.SaveAs(Server.MapPath("../files/ebook/" + FileUpload1.FileName));
            bll.Add(model);
            LTP.Common.MessageBox.Show(this.Page, "添加成功!");
        }

        protected void LinkButton7_Click(object sender, EventArgs e)
        {
            JDJS.BLL.cust_base_info bll = new JDJS.BLL.cust_base_info();
            JDJS.Model.cust_base_info model1 = new JDJS.Model.cust_base_info();
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
            bll.Add(model1);
            DiscuzIntegration.Integration.Regedit(TextBox13.Text.Trim(), TextBox46.Text.Trim());
            LTP.Common.MessageBox.Show(this.Page, "添加成功!");
        }

        protected void LinkButton8_Click(object sender, EventArgs e)
        {
            JDJS.BLL.Trade_result bll = new JDJS.BLL.Trade_result();
            JDJS.Model.Trade_result model = new JDJS.Model.Trade_result();
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
            bll.Add(model);
            LTP.Common.MessageBox.Show(this.Page, "添加成功!");
        }

        protected void LinkButton9_Click(object sender, EventArgs e)
        {
            JDJS.BLL.real_material_data bll = new JDJS.BLL.real_material_data();
            JDJS.Model.real_material_data model = new JDJS.Model.real_material_data();
            model.zname = TextBox5.Text;
            model.zunit = TextBox6.Text;
            model.Class=TextBox80.Text;
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
            model.imgpath = "../files/img/" + FileUpload1.FileName;
            FileUpload1.SaveAs(Server.MapPath("../files/img/" + FileUpload1.FileName));
            bll.Add(model);
            LTP.Common.MessageBox.Show(this.Page, "添加成功!");
        }

        protected void lbSubmit_Click(object sender, EventArgs e)
        {
            JDJS.BLL.HYDT bll = new JDJS.BLL.HYDT();
            JDJS.Model.HYDT model = new JDJS.Model.HYDT();
            model.title = txtTitle.Text;
            model.content = txtBody.Text;
            model.url = "";
            model.ptime = DateTime.Now;
            model.type = ddlType.SelectedValue;
            model.img = "";
            bll.Add(model);
            LTP.Common.MessageBox.Show(this.Page, "添加成功!");
        }

        protected void DropDownList1_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (DropDownList1.SelectedValue == "招标信息")
            {
                Panel9.Visible = true;
                Panel10.Visible = false;
            }
            else
            {
                Panel10.Visible = true;
                Panel9.Visible = false;
            }
        }

        protected void LinkButton10_Click(object sender, EventArgs e)
        {
            JDJS.BLL.xtgg bll = new BLL.xtgg();
            JDJS.Model.xtgg model = new Model.xtgg();
            model.url = "";
            model.ptime = DateTime.Now;
            model.title = TextBox75.Text;
            model.New = 0;
            model.content = WebEditor1.Text;
            model.show = 0;
            bll.Add(model);
            LTP.Common.MessageBox.Show(this.Page, "添加成功!");
        }

        protected void LinkButton11_Click(object sender, EventArgs e)
        {
            try
            {
                string filename = "";
                filename = wordToHtml(File1);
                JDJS.BLL.Material_Trend bll = new BLL.Material_Trend();
                JDJS.Model.Material_Trend model = new Model.Material_Trend();
                model.title = TextBox78.Text.Trim();
                model.link = filename;
                model.update = DateTime.Now;
                bll.Add(model);
                LTP.Common.MessageBox.Show(this.Page,"添加成功!");
            }
            catch
            {
                LTP.Common.MessageBox.Show(this.Page,"添加失败!");
            }
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



    }
}
