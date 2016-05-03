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
    public partial class Companyinfo : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            string Id = "";
            Image1.ImageUrl = "style/images/Project-md3.gif";
            if (!string.IsNullOrEmpty(Request.QueryString["Id"]))
            {
                ImgBg.ImageUrl = "style/images/cmpinfo.gif";
                Id = Request.QueryString["Id"];
                JDJS.BLL.TCcompany bll = new JDJS.BLL.TCcompany();
                Plinvite.Visible = true;
                if (!LTP.Common.UserInfo.IsLogin())
                {

                    Session["FromPage"] = HttpContext.Current.Request.Url.PathAndQuery;
                  

                    BindInfo2(int.Parse(Id));//未登录



                }
                else
                {
                    Session["FromPage"] = null;
                    BindInfo(int.Parse(Id));//登录后
                }
            }
        }
        private void BindInfo(int Id)
        {
            string kong = "不明";
            Button1.Visible = false;
            StaffTab.Visible = false;
            JDJS.BLL.TCcompany bll = new JDJS.BLL.TCcompany();
            JDJS.Model.TCcompany model = bll.GetModel(Id);
            JDJS.BLL.cust_base_info cbll = new JDJS.BLL.cust_base_info();
            JDJS.Model.cust_base_info cmodel = ((JDJS.Model.cust_base_info)Session["User"]);

            JDJS.BLL.project_inforbase probll = new JDJS.BLL.project_inforbase();
            Pager.PageSize = 24;
            Pager.RecordCount = probll.GetCount("1=1" + " and attcmp like '%" + model.company + "%'");
            Repeaterpro.DataSource = probll.GetList(Pager.PageSize, Pager.PageIndex, "1=1" + " and attcmp like '%" + model.company + "%'", "id",1);
            //Repeaterpro.DataSource = probll.GetList(100, "1=1" + " and attcmp like '%" + model.company + "%'", "id");
            Repeaterpro.DataBind();
         

            JDJS.BLL.TClinkman pbll = new JDJS.BLL.TClinkman();
            //Pager.PageSize = 24;
            //Pager.RecordCount = bll.GetCount("1=1" + strwhere);
            string strwhere = " and companyname='" + model.company + "'";
            Labcnt.Text = (pbll.GetCount("1=1" + strwhere)).ToString() + "人";
            

            if (model.newcode.IndexOf(cmodel.newcode) > -1)
            {
                BUY.Visible = false;
                StaffTab.Visible = true;

                RepInfo.DataSource = pbll.GetModelList("1=1" + strwhere);
                RepInfo.DataBind();
            }
            else
            {
                BUY.Visible = true;
                StaffTab.Visible = false;
            }
            cpname.Text = model.company;
            if (!string.IsNullOrEmpty(model.ctype))
            {
                cptype.Text = model.ctype;
            }
            else
            {
                cptype.Text = kong;
            }
            if (!string.IsNullOrEmpty(model.cplace))
            {
                cpplace.Text = model.cplace;
            }
            else
            {
                cpplace.Text = kong;
            }
            if (!string.IsNullOrEmpty(model.caddress))
            {
                cpaddress.Text =  model.caddress;
            }
            else
            {
                cpaddress.Text = kong;
            }
            if (!string.IsNullOrEmpty(model.cpost))
            {
                cppost.Text =  model.cpost;
            }
            else
            {
                cppost.Text = kong;
            }
            if (!string.IsNullOrEmpty(model.cphone))
            {
                cpphone.Text =  model.cphone;
            }
            else
            {
                cpphone.Text = kong;
            }
            if (!string.IsNullOrEmpty(model.cfax))
            {
                cpfax.Text =  model.cfax;
            }
            else
            {
                cpfax.Text = kong;
            }
            if (!string.IsNullOrEmpty(model.cemail))
            {
                cpemail.Text =  model.cemail;
            }
            else
            {
                cpemail.Text = kong;
            }
            if (!string.IsNullOrEmpty(model.cweb))
            {
                cpweb.Text =  model.cweb;
            }
            else
            {
                cpweb.Text = kong;
            }
           
        }
        private void BindInfo2(int Id)
        {
            string kong = "不明";
            Button1.Visible = true;
            StaffTab.Visible = false;
            BUY.Visible = false;
            JDJS.BLL.TCcompany bll = new JDJS.BLL.TCcompany();
            JDJS.Model.TCcompany model = bll.GetModel(Id);

            JDJS.BLL.project_inforbase probll = new JDJS.BLL.project_inforbase();
            Pager.PageSize = 24;
            Pager.RecordCount = probll.GetCount("1=1" + " and attcmp like '%" + model.company + "%'");
            Repeaterpro.DataSource = probll.GetList(Pager.PageSize, Pager.PageIndex, "1=1" + " and attcmp like '%" + model.company + "%'", "id",1);
            //Repeaterpro.DataSource = probll.GetList(100, "1=1" + " and attcmp like '%" + model.company + "%'", "id");
            Repeaterpro.DataBind();


            cpname.Text = cpname.Text + model.company;
            if (!string.IsNullOrEmpty(model.ctype))
            {
                cptype.Text = cptype.Text + model.ctype;
            }
            else
            {
                cptype.Text = kong;
            }
            if (!string.IsNullOrEmpty(model.cplace))
            {
                cpplace.Text = cpplace.Text + model.cplace;
            }
            else
            {
                cpplace.Text = kong;
            }
            if (!string.IsNullOrEmpty(model.caddress))
            {
                cpaddress.Text = cpaddress.Text + model.caddress;
            }
            else
            {
                cpaddress.Text = kong;
            }
            if (!string.IsNullOrEmpty(model.cpost))
            {
                cppost.Text = cppost.Text + model.cpost;
            }
            else
            {
                cppost.Text = kong;
            }
            if (!string.IsNullOrEmpty(model.cphone))
            {
                cpphone.Text = cpphone.Text + model.cphone;
            }
            else
            {
                cpphone.Text = kong;
            }
            if (!string.IsNullOrEmpty(model.cfax))
            {
                cpfax.Text = cpfax.Text + model.cfax;
            }
            else
            {
                cpfax.Text = kong;
            }
            if (!string.IsNullOrEmpty(model.cemail))
            {
                cpemail.Text = cpemail.Text + model.cemail;
            }
            else
            {
                cpemail.Text = kong;
            }
            if (!string.IsNullOrEmpty(model.cweb))
            {
                cpweb.Text = cpweb.Text + model.cweb;
            }
            else
            {
                cpweb.Text = kong;
            }
            JDJS.BLL.TClinkman pbll = new JDJS.BLL.TClinkman();
            
            string strwhere = " and companyname='" + model.company + "'";
            Labcnt.Text = (pbll.GetCount("1=1" + strwhere)).ToString() + "人";
            //RepInfo.DataSource = pbll.GetList("1=1" + strwhere);
            //RepInfo.DataBind();
        }
        public string GetStaffstyle(string ID)
        {

            int Id = int.Parse(ID);
            string stcode = "";
            if (!LTP.Common.UserInfo.IsLogin())
            {
                return stcode;
            }
            else
            {
                JDJS.BLL.TClinkman bll = new JDJS.BLL.TClinkman();
                JDJS.Model.TClinkman model = bll.GetModel(Id);

                JDJS.BLL.cust_base_info cbll = new JDJS.BLL.cust_base_info();
                JDJS.Model.cust_base_info cmodel = ((JDJS.Model.cust_base_info)Session["User"]);


                if (model.code.IndexOf(cmodel.newcode) < 0)
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

        protected void BUY_Click(object sender, EventArgs e)
        {
            BuyTheCompanyInfo(int.Parse(Request.QueryString["Id"]));
        }
         private void BuyTheCompanyInfo(int Id)
        {
           
            int killpt = 2;
                         
             JDJS.BLL.TClinkman pepbll = new JDJS.BLL.TClinkman();
            // JDJS.Model.TClinkman pmodel = pbll.GetModelList(str);

            JDJS.BLL.TCcompany bll = new JDJS.BLL.TCcompany();
            JDJS.Model.TCcompany model = bll.GetModel(Id);

            JDJS.BLL.cust_base_info cbll = new JDJS.BLL.cust_base_info();
            JDJS.Model.cust_base_info cmodel = ((JDJS.Model.cust_base_info)Session["User"]);

            JDJS.BLL.member_point pbll = new JDJS.BLL.member_point();
            JDJS.Model.member_point modeljf = pbll.GetModel(cmodel.newcode);

            if (model.newcode.IndexOf(cmodel.newcode) < 0)
            {
                if (modeljf.JDB >= killpt)
                {

                    model.newcode = model.newcode + ":" + cmodel.newcode;
                    bll.Update(model);
                    modeljf.JDB = modeljf.JDB - killpt;
                    modeljf.point = modeljf.point + (killpt * 5);
                    modeljf.current_point = modeljf.current_point + (killpt * 5);
                    pbll.Update(modeljf);
                    pepbll.Update(":" + cmodel.newcode, Id.ToString());
                    LTP.Common.MessageBox.Show(this.Page, "恭喜解锁成功！点击员工姓名可查看该员工全部信息！");
                    BindInfo(Id);
                }
                else
                {
                    LTP.Common.MessageBox.Show(this.Page, "对不起，您的建定币余额不足!解锁失败，请速联系建定客服为账号充值！");
                }
            }   
         }

         protected void Button1_Click(object sender, EventArgs e)
         {
             Session["FromPage"] = HttpContext.Current.Request.Url.PathAndQuery;
             Server.Transfer("Login.aspx"); 
         }

         public string NewStr(string dt)
         {
             try
             {
                 DateTime newdt = DateTime.Parse(dt);
                 if (Math.Abs(LTP.Common.TimeParser.DayDiff(DateTime.Now, newdt)) < 7)
                 {
                     return "<img src=\"style/icon/New.gif\" />";
                 }
                 else
                 {
                     return "";
                 }
             }
             catch
             {
                 return "";
             }
         }

         public string Getstyle(string ID)
         {

             int Id = int.Parse(ID);
             string stcode = "";
             if (!LTP.Common.UserInfo.IsLogin())
             {
                 return stcode;
             }
             else
             {
                 JDJS.BLL.project_inforbase bll = new JDJS.BLL.project_inforbase();
                 JDJS.Model.project_inforbase model = bll.GetModel(Id);

                 JDJS.BLL.cust_base_info cbll = new JDJS.BLL.cust_base_info();
                 JDJS.Model.cust_base_info cmodel = ((JDJS.Model.cust_base_info)Session["User"]);


                 if (model.custreadrec.IndexOf(cmodel.newcode) < 0)
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
         public string ReplaceStr(string content, string regularexpression, string changestring)
         {
             //string regularexpression = @"https?://(\w*:\w*@)?[-\w.]+(:\d+)?(/([\w/_.]*(\?\S+)?)?)?";


             try
             {
                 Regex regex = new Regex(regularexpression);
                 Regex regex2 = new Regex(@"""");
                 string str = regex2.Replace(content, changestring);
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