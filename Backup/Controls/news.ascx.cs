using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
namespace JDJS.Web.Controls
{
    public partial class news : System.Web.UI.UserControl
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                BindInfo();
                BindYear();
                //BindspecialCode();
                BindspecialCode2();      
            }
            
        }
        private void BindspecialCode2()
        {
            string spccode = "";
            JDJS.BLL.mat_special bll = new JDJS.BLL.mat_special();
            DataSet ds = new DataSet();
            ds=bll.GetList(" 1=1 order by id");
            specialDL.DataSource = ds;
            specialDL.DataValueField = ds.Tables[0].Columns["specialCode"].ToString();
            specialDL.DataTextField = ds.Tables[0].Columns["name"].ToString();
            Getitemcode(spccode);
            //specialDL.Items.Clear();
            specialDL.DataBind();
            specialDL.Items.Insert(0, "不限");
            specialDL.SelectedIndex = 0;
           
        }
        private void BindInfo()
        {
            JDJS.BLL.HYDT bll = new JDJS.BLL.HYDT();
            RepNews.DataSource = bll.GetList(5, "type='建筑行业'", "ptime desc");
            RepNews.DataBind();
        }
        private void BindspecialCode()
        {
            string spcname="", spccode=""; int rcnt; 
            JDJS.BLL.mat_special bll = new JDJS.BLL.mat_special();
            DataSet spinfo = bll.GetList(" 1=1 order by id");
            Getitemcode(spccode);
            if (spinfo.Tables[0].Rows.Count > 0)
            {
                rcnt = spinfo.Tables[0].Rows.Count;
                DataRow row;
                //row = spinfo.Tables[0].Rows[0];
                //spcname = Convert.ToString(row["name"]);
                //spccode = Convert.ToString(row["specialCode"]);
             
                specialDL.Items.Clear();
                for (int i = 0; i < rcnt; i++)
                {
                    row = spinfo.Tables[0].Rows[i];
                    spcname = Convert.ToString(row["name"]);
                    spccode = Convert.ToString(row["specialCode"]);
                    specialDL.Items.Add(spcname.ToString());
                    specialDL.Items.FindByText(spcname).Value = spccode; 

                }
                
                specialDL.Items.Insert(0, "不限");
                specialDL.SelectedIndex = 0;
            }
           
        }

        private void Getitemcode(string spccode)
        {
            int rcnt; string itname, itcode;
            JDJS.BLL.mat_item bll = new JDJS.BLL.mat_item();
            DataSet itcinfo = bll.GetList(" specialCode='" + spccode + "' order by id");
            itemDL.Items.Clear();
            if (itcinfo.Tables[0].Rows.Count > 0)
            {

                rcnt = itcinfo.Tables[0].Rows.Count;
                
                for (int j = 0; j < rcnt; j++)
                {
                    DataRow row;
                    row = itcinfo.Tables[0].Rows[j];
                    itname = Convert.ToString(row["name"]);
                    itcode = Convert.ToString(row["itemcode"]);
                    itemDL.Items.Add(itname.ToString());
                    itemDL.Items.FindByText(itname).Value = itname;

                }
                                    
            }
            else 
            {
                JDJS.BLL.mat_item bll3 = new JDJS.BLL.mat_item();
                DataSet ds3 = new DataSet();
                ds3 = bll3.GetList(" 1=1 order by id");
                //ds3 = bll3.GetList(" specialCode='" + specialDL.SelectedValue + "' order by id");
               /* rcnt = ds3.Tables[0].Rows.Count;
                for (int j = 0; j < rcnt; j++)
                {
                    DataRow row;
                    row = ds3.Tables[0].Rows[j];
                    itname = Convert.ToString(row["name"]);
                    itcode = Convert.ToString(row["itemcode"]);
                    itemDL.Items.Add(itname.ToString());
                    itemDL.Items.FindByText(itname).Value = itname;

                }*/
                
                
                itemDL.DataSource = ds3;
                itemDL.DataValueField = ds3.Tables[0].Columns["itemCode"].ToString();
                itemDL.DataTextField = ds3.Tables[0].Columns["name"].ToString();
                itemDL.DataBind();
                
            }
            itemDL.Items.Insert(0, "不限");
            itemDL.SelectedIndex = 0;
            
            
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
            int type=1;
            string KeyWords = txtSeach.Text;
            string year = "";
            string month = "";
            string midcode = "";
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
            if (ddlyear.SelectedIndex!=0)
            {
                year = ddlyear.SelectedValue;
                year = "&year=" + year;
            }
            if (ddlmonth.SelectedIndex != 0)
            {
                month=ddlmonth.SelectedValue;
                month = "&month=" + month;
            }
            if (specialDL.SelectedIndex != 0)
            {
                if (itemDL.SelectedIndex != 0)
                {
                    midcode = itemDL.SelectedValue;
                    midcode = "&midcode=" + midcode;
                }
                else
                {
                    midcode = specialDL.SelectedValue;
                    midcode = "&midcode=" + midcode;
                }
            }
            else
            {
                if (itemDL.SelectedIndex != 0)
                {
                    midcode = itemDL.SelectedValue;
                    midcode = "&midcode=" + midcode;
                }
                else
                {
                    //midcode = specialDL.SelectedValue;
                    //midcode = "&midcode=" + midcode;
                }
            }
            //Response.Redirect("Seach.aspx?KeyWord=" + KeyWords + year + month + "&type=" + type+midcode);
            Response.Redirect("Seach.aspx?KeyWord=" + KeyWords + year + month + "&type=" + type + midcode);
            //Response.Write("<script>window.open('"+"Seach.aspx?KeyWord=" + KeyWords + year + month + "&type=" + type + midcode+"');</script>");
            
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
        protected void specialDL_SelectedIndexChanged(object sender, EventArgs e)
        {
            try
            {
                string spccode = (specialDL.SelectedValue).ToString();
                Getitemcode(spccode);

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