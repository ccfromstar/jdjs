using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
namespace JDJS.Web.Controls
{
    public partial class MatSeachBar : System.Web.UI.UserControl
    {
        protected void Page_Load(object sender, EventArgs e)
        {

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
        protected void ImageSeach_Click(object sender, ImageClickEventArgs e)
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