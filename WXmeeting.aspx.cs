using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace JDJS.Web
{
    public partial class WXmeeting : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

            string Part = "";
            if (!string.IsNullOrEmpty(Request.QueryString["Part"]))
            {
                Part = LTP.Common.StringPlus.htmlstr(Request.QueryString["Part"].ToString());
            }
        
            
            if (!this.IsPostBack)
            {
                clearform(Convert.ToInt32(Part));
            }
            //IfLogin();
        }
        private void clearform(int part)
        {
            TextBox1.Text = "";
            TextBox2.Text = "";
            TextBox3.Text = "";
            TextBox4.Text = "";
            JDJS.BLL.Meeting_Base bll = new JDJS.BLL.Meeting_Base();
            JDJS.Model.Meeting_Base model =bll.GetModel(part);
            Page.Title = model.meetingname; ;
            Label7.Text = model.meetingname;
            if (!string.IsNullOrEmpty(model.rek))
            {
                Label9.Text = model.rek;
                Label9.Visible = true;
            }
            if (!string.IsNullOrEmpty(model.metpic))
            {
                Image1.ImageUrl = model.metpic;
                Image1.Visible = true;
            }
            signup.Style.Add("display", "");
            Div1.Style.Add("display", "none");
        }

        public bool Metsignup(int part)
        {
            if (TextCheck())
            {
                try
                {
                    JDJS.BLL.Meeting_signup bll = new JDJS.BLL.Meeting_signup();
                    JDJS.Model.Meeting_signup model = new JDJS.Model.Meeting_signup();
                    model.meetingname = Label7.Text;
                    model.company = TextBox2.Text;
                    model.linkman = TextBox1.Text;
                    model.address = TextBox3.Text;
                    model.phone = TextBox4.Text;
                    model.custfrom = part;
                    model.linkstate = 0;
                    model.rek = "";

                    bll.Add(model);
                    LTP.Common.MessageBox.Show(this.Page, "提交成功！稍后会有客服人员联系具体事宜，请点击左上角 返回 按钮继续阅读。");
                    return true;
                }
                catch { return false; }
            }
            else
            {
                LTP.Common.MessageBox.Show(this.Page, "资料不全！请填写您的 姓名 与 联系方式 哦亲！");
                 return false;
            }
        }

        public bool TextCheck()
        {
            if (string.IsNullOrEmpty (TextBox1.Text.Trim()) || string.IsNullOrEmpty(TextBox4.Text.Trim()))
            {
                return false;
            }
            else
            {
                return true;
            }
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            string Part = "";
            if (!string.IsNullOrEmpty(Request.QueryString["Part"]))
            {
                Part = LTP.Common.StringPlus.htmlstr(Request.QueryString["Part"].ToString());
            }

            if (Metsignup(Convert.ToInt32(Part)))
           {
               TextBox1.Text = "";
               TextBox2.Text = "";
               TextBox3.Text = "";
               TextBox4.Text = "";
               Label9.Visible = false;
               Image1.Visible = false;
               signup.Style.Add("display", "none");
               Div1.Style.Add("display", "");
           }
           else
           {
               clearform(Convert.ToInt32(Part));
           }
              
        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            string Part = "";
            if (!string.IsNullOrEmpty(Request.QueryString["Part"]))
            {
                Part = LTP.Common.StringPlus.htmlstr(Request.QueryString["Part"].ToString());
            }
            clearform(Convert.ToInt32(Part));
        }
    }
}