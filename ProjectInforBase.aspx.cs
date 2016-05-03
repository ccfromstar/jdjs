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
    public partial class ProjectInforBase : PageBase
    {
        public string Part
        {
            get
            {
                if (!string.IsNullOrEmpty(Request.QueryString["Part"]))
                {
                    return Request.QueryString["Part"];
                }
                else
                {
                    return "";
                }
            }
        }
        
        
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                //if (!LTP.Common.UserInfo.IsLogin())
                //{
                    
                    //Session["FromPage"] = null;
                    Seach();
                //}
                //else
                //{
                    //Session["FromPage"] = null;
                    //Seach();
                //}
            }
        }

        private void Seach()
        {
            string KeyWord = "";
            string Begin = "";
            string End = "";
            string Type = "";
            string state = "";
            string stBegin = "";
            string stEnd = "";
            string ftBegin = "";
            string ftEnd = "";
            string minmoney = "";
            string maxmoney = "";
            string address = "";
            string owner = "";
            string desinger = "";
            string builder = "";
            string buildplace = "";
            string prorek = "";

            if (!string.IsNullOrEmpty(Request.QueryString["KeyWord"]))
            {
                KeyWord = LTP.Common.StringPlus.htmlstr(Request.QueryString["KeyWord"]);
            }
            if (!string.IsNullOrEmpty(Request.QueryString["Begin"]))
            {
                Begin =ReplacetimeStr( LTP.Common.StringPlus.htmlstr(Request.QueryString["Begin"]));
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
                maxmoney =Getprice( LTP.Common.StringPlus.htmlstr(Request.QueryString["maxmoney"]));
            }
            if (!string.IsNullOrEmpty(Request.QueryString["Type"]))
            {
                Type = LTP.Common.StringPlus.htmlstr(Request.QueryString["Type"]);
            }
            if (!string.IsNullOrEmpty(Request.QueryString["state"]))
            {
                state = LTP.Common.StringPlus.htmlstr(Request.QueryString["state"]);
            }
            if (!string.IsNullOrEmpty(Request.QueryString["buildplace"]))
            {
                buildplace = LTP.Common.StringPlus.htmlstr(Request.QueryString["buildplace"]);
            }
            
           
            if (!string.IsNullOrEmpty(Request.QueryString["address"]))
            {
                address = LTP.Common.StringPlus.htmlstr(Request.QueryString["address"]);
            }
            if (!string.IsNullOrEmpty(Request.QueryString["owner"]))
            {
                owner = LTP.Common.StringPlus.htmlstr(Request.QueryString["owner"]);
            }
            if (!string.IsNullOrEmpty(Request.QueryString["desinger"]))
            {
                desinger = LTP.Common.StringPlus.htmlstr(Request.QueryString["desinger"]);
            }
            if (!string.IsNullOrEmpty(Request.QueryString["builder"]))
            {
                builder = LTP.Common.StringPlus.htmlstr(Request.QueryString["builder"]);
            }

            if (!string.IsNullOrEmpty(Request.QueryString["prorek"]))
            {
                prorek = LTP.Common.StringPlus.htmlstr(Request.QueryString["prorek"]);
            }


            string strwhere = "1=1";

            if (!string.IsNullOrEmpty(KeyWord))
            {
                strwhere += " and proname like '%" + KeyWord + "%' ";
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
                strwhere += " and promoney<=" + maxmoney ;
            }
            
            if (!string.IsNullOrEmpty(Type) && Type != "全部信息")
            {
                strwhere += " and prosort like'%" + Type + "%' ";
            }
            if (!string.IsNullOrEmpty(state) && state != "全部信息")
            {
                strwhere += " and prostate='" + state + "' ";
            }
            if (!string.IsNullOrEmpty(buildplace) && buildplace != "全部地区")
            {
                strwhere += " and proplace like '%" + buildplace + "%' ";
            }
            if (!string.IsNullOrEmpty(address))
            {
                strwhere += " and proaddress like '%" + address + "%' ";
            }
            if (!string.IsNullOrEmpty(owner))
            {
                strwhere += " and proowner like '%" + owner + "%' ";
            }
            if (!string.IsNullOrEmpty(desinger))
            {
                strwhere += " and prodesigner like '%" + desinger + "%' ";
            }
            if (!string.IsNullOrEmpty(builder))
            {
                strwhere += " and probuilder like '%" + builder + "%' ";
            }

            if (!string.IsNullOrEmpty(prorek))
            {
                strwhere += " and prorek like '%" + prorek + "%' ";
            }

            //strwhere += " and disflag=0";
                BindInfo(Part, strwhere);
                
                txtTitle.Text = KeyWord;

                if (string.IsNullOrEmpty(Type))
                {
                    Type = "全部信息";
                }
            ddlClass.ClearSelection();
    
            ddlClass.Items.FindByText(Type).Selected=true;

                if (string.IsNullOrEmpty(state))
                {
                    state = "全部信息";
                }
                ddlClass0.ClearSelection();    
           ddlClass0.Items.FindByText(state).Selected=true;

                if (string.IsNullOrEmpty(buildplace))
                {
                    buildplace = "全部地区";
                    
                }
                ddlClass1.ClearSelection();      
                ddlClass1.Items.FindByText(buildplace).Selected=true;
                

                txtBg.Text = Begin; txtEnd.Text = End;
                txtBg0.Text = stBegin; txtEnd0.Text = stEnd;
                TextBox1.Text = ftBegin; TextBox2.Text = ftEnd;
                txtTitle0.Text = minmoney; txtTitle1.Text = maxmoney;
                txtTitle2.Text = owner; txtTitle3.Text = desinger; txtTitle4.Text = builder;
                txtTitle5.Text = prorek;
                
            
        }

        public string ReplacetimeStr(string timestr)
        {
            try
            {
                Convert.ToDateTime(timestr);
                return timestr;
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

        public string ReplaceStr(string content, string regularexpression, string changestring)
        {
            //string regularexpression = @"https?://(\w*:\w*@)?[-\w.]+(:\d+)?(/([\w/_.]*(\?\S+)?)?)?";
           
            
            try
            {
                Regex regex = new Regex(regularexpression);
                Regex regex2 = new Regex(@"""");
                Regex regex3 = new Regex(@"<BR>");
                string str = regex2.Replace(content, changestring);
                str = regex.Replace(str, changestring);
                str = regex3.Replace(str, changestring);
                return str;
            }
            catch 
            {
                

                return content;
            }
            
        }

        public string Getstyle(string ID)
        {

            int Id = int.Parse(ID);
            string stcode="";
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

        private void BindInfo(string Part, string strwhere)
        {
            ImgBg.ImageUrl = "style/images/Project-md3.gif";
            JDJS.BLL.project_inforbase bll = new JDJS.BLL.project_inforbase();
            Pager.PageSize = 35;
            if (strwhere != "1=1")
            {
                Pager.RecordCount = bll.GetCount(strwhere);//.Tables[0].Rows.Count;
                RepInfo.DataSource = bll.GetList(Pager.PageSize, Pager.PageIndex, strwhere + " and disflag=0", "id", 1);
            }
            else
            {
                Pager.RecordCount = 35;//.Tables[0].Rows.Count;
                RepInfo.DataSource = bll.GetList(35, strwhere + " and disflag=0", "id", "Desc");
            }
            
            RepInfo.DataBind();
            //ddlClass.DataSource = bll.GetSql("SELECT prosort FROM project_inforbase GROUP BY prosort");
            //ddlClass.DataValueField = "prosort";
            //ddlClass.DataTextField = "prosort";
            //ddlClass.DataBind();
            //ddlClass.Items.Insert(0, "全部信息");
            ddlClass0.DataSource = bll.GetSql("SELECT prostate FROM project_inforbase GROUP BY prostate");
            ddlClass0.DataValueField = "prostate";
            ddlClass0.DataTextField = "prostate";
            ddlClass0.DataBind();
            ddlClass0.Items.Insert(0, "全部信息");
            
            ddlClass1.DataSource = bll.GetSql("SELECT proplace FROM project_inforbase GROUP BY proplace order by proplace");
            ddlClass1.DataValueField = "proplace";
            ddlClass1.DataTextField = "proplace";
            ddlClass1.DataBind();
            ddlClass1.Items.Insert(0, "全部地区");
        }

        protected void btnSeach_Click(object sender, EventArgs e)
        {
            string SeachTo = "ProjectInforBase.aspx?Part=" + Part;
            if (!string.IsNullOrEmpty(ddlClass.SelectedValue))
            {
                SeachTo += "&Type=" + LTP.Common.StringPlus.htmlstr(ddlClass.Text);
            }
            if (!string.IsNullOrEmpty(ddlClass0.SelectedValue))
            {
                SeachTo += "&state=" + LTP.Common.StringPlus.htmlstr(ddlClass0.Text);
            }
            if (!string.IsNullOrEmpty(ddlClass1.SelectedValue))
            {
                SeachTo += "&buildplace=" + LTP.Common.StringPlus.htmlstr(ddlClass1.Text); ;
            }

            if (!string.IsNullOrEmpty(txtTitle.Text.Trim()))
            {
                SeachTo += "&KeyWord=" + LTP.Common.StringPlus.htmlstr(txtTitle.Text.Trim());
            }
            if (!string.IsNullOrEmpty(txtBg.Text.Trim()))
            {
                SeachTo += "&Begin=" + LTP.Common.StringPlus.htmlstr(txtBg.Text.Trim());
            }
            if (!string.IsNullOrEmpty(txtEnd.Text.Trim()))
            {
                SeachTo += "&End=" + LTP.Common.StringPlus.htmlstr(txtEnd.Text.Trim());
            }

            if (!string.IsNullOrEmpty(txtBg0.Text.Trim()))
            {
                SeachTo += "&stBegin=" + LTP.Common.StringPlus.htmlstr(txtBg0.Text.Trim());
            }

            if (!string.IsNullOrEmpty(txtEnd0.Text.Trim()))
            {
                SeachTo += "&stEnd=" + LTP.Common.StringPlus.htmlstr(txtEnd0.Text.Trim());
            }


            if (!string.IsNullOrEmpty(TextBox1.Text.Trim()))
            {
                SeachTo += "&ftBegin=" + LTP.Common.StringPlus.htmlstr(TextBox1.Text.Trim());
            }

            if (!string.IsNullOrEmpty(TextBox2.Text.Trim()))
            {
                SeachTo += "&ftEnd=" + LTP.Common.StringPlus.htmlstr(TextBox2.Text.Trim());
            }

            if (!string.IsNullOrEmpty(txtTitle0.Text.Trim()))
            {
                SeachTo += "&minmoney=" + LTP.Common.StringPlus.htmlstr(txtTitle0.Text.Trim());
            }

            if (!string.IsNullOrEmpty(txtTitle1.Text.Trim()))
            {
                SeachTo += "&maxmoney=" + LTP.Common.StringPlus.htmlstr(txtTitle1.Text.Trim());
            }

            if (!string.IsNullOrEmpty(txtTitle2.Text.Trim()))
            {
                SeachTo += "&owner=" + LTP.Common.StringPlus.htmlstr(txtTitle2.Text.Trim());
            }

            if (!string.IsNullOrEmpty(txtTitle3.Text.Trim()))
            {
                SeachTo += "&desinger=" + LTP.Common.StringPlus.htmlstr(txtTitle3.Text.Trim());
            }

            if (!string.IsNullOrEmpty(txtTitle4.Text.Trim()))
            {
                SeachTo += "&builder=" + LTP.Common.StringPlus.htmlstr(txtTitle4.Text.Trim());
            }

            if (!string.IsNullOrEmpty(txtTitle5.Text.Trim()))
            {
                SeachTo += "&prorek=" + LTP.Common.StringPlus.htmlstr(txtTitle5.Text.Trim());
            }

            Response.Redirect(SeachTo);
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
    }
}