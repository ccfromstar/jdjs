using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace JDJS.Web
{
    public partial class Market : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                BindInfo1();
                BindInfo2();
                BindInfo3();
                BindInfo4();
            }
        }
        private void BindInfo1()
        {
            BindYear();
        }
        private void BindInfo2()
        {
            JDJS.BLL.VIEW_YS bll = new JDJS.BLL.VIEW_YS();
            RepInfo2.DataSource = bll.GetList(5, "itemcode='YSP01010001' and year(date)=(select max(year(date)) as maxyear from VIEW_YS) and month(date)=(select max(month(date)) as maxmonth from VIEW_YS where year(date)=(select max(year(date)) as maxyear from VIEW_YS))", "");
            RepInfo2.DataBind();
        }
        private void BindInfo3()
        {
            JDJS.BLL.real_material_data bll = new JDJS.BLL.real_material_data();
            RepInfo3.DataSource = bll.GetList(5, "1=1", " stime desc");
            RepInfo3.DataBind();
        }
        private void BindInfo4()
        {
            JDJS.BLL.CustBase_DcustWebShow_View bll = new JDJS.BLL.CustBase_DcustWebShow_View();
            RepInfo4.DataSource = bll.GetList(10, "cflag=0", "webshow desc, NEWID()");
            RepInfo4.DataBind();
        }
        private void BindYear()
        {
            int minyear = 0, maxyear = 0;
            JDJS.BLL.material_data bll = new JDJS.BLL.material_data();
            DataSet year = bll.GetList("min(year(stime)) as minyear,max(year(stime)) as maxyear", "1=1");
            if (year.Tables[0].Rows.Count > 0)
            {
                DataRow row;
                row = year.Tables[0].Rows[0];
                minyear = Convert.ToInt32(row["minyear"]);
                maxyear = Convert.ToInt32(row["maxyear"]);
                GetMaxYearsMonth(maxyear);
                ddlyear.Items.Clear();
                for (int i = minyear; i <= maxyear; i++)
                {
                    ddlyear.Items.Add(i.ToString());

                }
                ddlyear.Items.Insert(0, "不限");
                ddlyear.SelectedIndex = 0;
            }

        }
        public string GetStyle(string webshow)
        {
            if (webshow == "3")
            {
                return "style='color:#f64760;'";
            }
            else
            {
                return "";
            }
        }
        public string GetStyle1(string webshow)
        {
            if (webshow == "3")
            {
                return "（含报价）";
            }
            else
            {
                return "";
            }
        }
        private void GetMaxYearsMonth(int maxyear)
        {
            int minmonth = 0, maxmonth = 0;
            JDJS.BLL.material_data bll = new JDJS.BLL.material_data();
            DataSet month = bll.GetList("min(month(stime)) as minmonth,max(month(stime)) as maxmonth", "year(stime)=" + maxyear.ToString());
            if (month.Tables[0].Rows.Count > 0)
            {
                DataRow row;
                row = month.Tables[0].Rows[0];
                minmonth = Convert.ToInt32(row["minmonth"]);
                maxmonth = Convert.ToInt32(row["maxmonth"]);
            }
            ddlmonth.Items.Clear();
            for (int i = minmonth; i <= maxmonth; i++)
            {
                ddlmonth.Items.Add(i.ToString());

            }
            ddlmonth.Items.Insert(0, "不限");
            ddlmonth.SelectedIndex = 0;
        }

        protected void btnSeach_Click(object sender, EventArgs e)
        {
            int type = 1;
            string KeyWords = txtSeach.Text;
            string year = "";
            string month = "";
            if (rb1.Checked)
            {
                type = 1;
            }
            else if (rb2.Checked)
            {
                type = 2;
            }
            else if (rb3.Checked)
            {
                type = 3;
            }
            else if (rb4.Checked)
            {
                type = 4;
            }
            if (ddlyear.SelectedIndex != 0)
            {
                year = ddlyear.SelectedValue;
                year = "&year=" + year;
            }
            if (ddlmonth.SelectedIndex != 0)
            {
                month = ddlmonth.SelectedValue; 
                month = "&month=" + month;
            }
            Response.Redirect("Seach.aspx?KeyWord=" + KeyWords + year + month + "&type=" + type);
        }

        protected void ddlyear_SelectedIndexChanged(object sender, EventArgs e)
        {
            try
            {
                int year = int.Parse(ddlyear.SelectedValue);
                GetMaxYearsMonth(year);
            }
            catch
            {
            }
        }
    }
}
