using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
namespace JDJS.Web
{
    public partial class GLJindex : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            
            if (!IsPostBack)
            {

                string gbsort="不限", gssort="不限",gptime="不限";
                if (!string.IsNullOrEmpty(Request.QueryString["gbsort"]))
                {
                    gbsort = Request.QueryString["gbsort"];
                }
                if (!string.IsNullOrEmpty(Request.QueryString["gssort"]))
                {
                    gssort = Request.QueryString["gssort"];
                }
                if (!string.IsNullOrEmpty(Request.QueryString["gptime"]))
                {
                    gptime = Request.QueryString["gptime"];
                }

                Bindsort(gbsort, gssort);
                Bindym(gptime);
                Seach();
                
            
            }
        }
        private void Seach()
        {
            string KeyWord = "";
            string gbsort = "";
            string gssort = "";
            string gptime = "";


            if (!string.IsNullOrEmpty(Request.QueryString["KeyWord"]))
            {
                KeyWord = LTP.Common.StringPlus.htmlstr(Request.QueryString["KeyWord"]);
            }
            if (!string.IsNullOrEmpty(Request.QueryString["gbsort"]))
            {
                gbsort = LTP.Common.StringPlus.htmlstr(Request.QueryString["gbsort"]);
            }
            if (!string.IsNullOrEmpty(Request.QueryString["gssort"]))
            {
                gssort = LTP.Common.StringPlus.htmlstr(Request.QueryString["gssort"]);
            }

            if (!string.IsNullOrEmpty(Request.QueryString["gptime"]))
            {
                gptime = LTP.Common.StringPlus.htmlstr(Request.QueryString["gptime"]);
            }



            string strwhere = "1=1";

            if (!string.IsNullOrEmpty(KeyWord))
            {
                strwhere += " and ysname like '%" + KeyWord + "%' ";
            }

            if (!string.IsNullOrEmpty(gbsort))
            {
                strwhere += " and bsort='" + gbsort + "' ";
            }
            if (!string.IsNullOrEmpty(gssort))
            {
                strwhere += " and ssort='" + gssort + "' ";
            }

            if (!string.IsNullOrEmpty(gptime))
            {
                strwhere += " and ptime='" + gptime + "' ";
            }


            //strwhere += " and disflag=0";
            BindGLJInfo(strwhere);

            txtTitle.Text = KeyWord;

            if (string.IsNullOrEmpty(gbsort))
            {
                gbsort = "不限";
            }
            bsort.ClearSelection();

            bsort.Items.FindByText(gbsort).Selected = true;

            if (string.IsNullOrEmpty(gssort))
            {
                gssort = "不限";
            }
            ssort.ClearSelection();

            ssort.Items.FindByText(gssort).Selected = true;

            if (string.IsNullOrEmpty(gptime))
            {
                gptime = "不限";
            }
            gljym.ClearSelection();

            gljym.Items.FindByText(gptime).Selected = true;


        }

        private void Bindym(string gptime)
        {
            JDJS.BLL.glj bll = new JDJS.BLL.glj();
            DataSet ds = new DataSet();
            ds = bll.GetList(" ptime"," 1=1 group by ptime order by ptime desc");
            gljym.DataSource = ds;
            gljym.DataValueField = ds.Tables[0].Columns["ptime"].ToString();
            gljym.DataTextField = ds.Tables[0].Columns["ptime"].ToString();
            //Getssort(spccode);
            //specialDL.Items.Clear();
            gljym.DataBind();
            gljym.Items.Insert(0, "不限");
            gljym.ClearSelection();
            gljym.Items.FindByText(gptime).Selected = true;
            //gljym.SelectedIndex = 0;
        }

        private void Bindsort(string gbsort, string gssort)
        {
            //string spccode = "";
            JDJS.BLL.glj bll = new JDJS.BLL.glj();
            DataSet ds = new DataSet();
            ds = bll.GetList(" bsort", " 1=1 group by bsort");
            bsort.DataSource = ds;
            bsort.DataValueField = ds.Tables[0].Columns["bsort"].ToString();
            bsort.DataTextField = ds.Tables[0].Columns["bsort"].ToString();
            
            //specialDL.Items.Clear();
            bsort.DataBind();
            bsort.Items.Insert(0, "不限");
            bsort.ClearSelection();

            bsort.Items.FindByText(gbsort).Selected = true;
            //bsort.SelectedIndex = 0;
            //spccode = bsort.SelectedValue;
            Getssort(gbsort,gssort);
        }

        private void Getssort(string gbsort,string gssort)
        {
            int rcnt; string itname, itcode;
            JDJS.BLL.glj bll = new JDJS.BLL.glj();
            DataSet itcinfo = bll.GetList(" bsort,ssort", " bsort='" + gbsort + "' group by bsort,ssort");
            ssort.Items.Clear();
            if (itcinfo.Tables[0].Rows.Count > 0)
            {

                rcnt = itcinfo.Tables[0].Rows.Count;

                for (int j = 0; j < rcnt; j++)
                {
                    DataRow row;
                    row = itcinfo.Tables[0].Rows[j];
                    itname = Convert.ToString(row["ssort"]);
                    itcode = Convert.ToString(row["ssort"]);
                    ssort.Items.Add(itname.ToString());
                    ssort.Items.FindByText(itname).Value = itname;

                }

            }
            else
            {
                JDJS.BLL.glj bll3 = new JDJS.BLL.glj();
                DataSet ds3 = new DataSet();
                ds3 = bll3.GetList(" ssort"," 1=1 group by ssort");
               
                ssort.DataSource = ds3;
                ssort.DataValueField = ds3.Tables[0].Columns["ssort"].ToString();
                ssort.DataTextField = ds3.Tables[0].Columns["ssort"].ToString();
                ssort.DataBind();
                //ssort.Items.Clear();
            }
            ssort.Items.Insert(0, "不限");
            ssort.ClearSelection();
            ssort.Items.FindByText(gssort).Selected = true;
            
           //ssort.SelectedIndex = 0;


        }

     

        private void BindGLJInfo(string strwhere)
        {
            //string strwhere;
            //strwhere = " id in (select pepid from pro_linkman_list where proid =" + proid + ")";
            //JDJS.BLL.TClinkman bll = new JDJS.BLL.TClinkman();
            JDJS.BLL.glj bll = new JDJS.BLL.glj();
            // strwhere = "  proid =" + proid + " and pepid=" + pepid;

            UcfarPager6.PageSize = 35;
            UcfarPager6.RecordCount = bll.GetCount(strwhere);//.Tables[0].Rows.Count;
            Repmatlist.DataSource = bll.GetList(UcfarPager6.PageSize, UcfarPager6.PageIndex, strwhere, "id", 1);

            //Repmatlist.DataSource = bll.GetList(strwhere);
            Repmatlist.DataBind();
        }

        protected void LinkButton2_Click(object sender, EventArgs e)
        {
            
            string SeachTo = "GLJindex.aspx?1=1";
          
            //ssort.SelectedValue = Request.Form["ssort"].ToString();
            if (!string.IsNullOrEmpty(txtTitle.Text.Trim()))
            {
                SeachTo += "&KeyWord=" + LTP.Common.StringPlus.htmlstr(txtTitle.Text.Trim());
            }
            if (!string.IsNullOrEmpty(bsort.SelectedValue) && bsort.SelectedValue!="不限")
            {
                SeachTo += "&gbsort=" + LTP.Common.StringPlus.htmlstr(bsort.SelectedValue);
            }

            if (!string.IsNullOrEmpty(ssort.SelectedValue) && ssort.SelectedValue != "不限")
            {
                SeachTo += "&gssort=" + LTP.Common.StringPlus.htmlstr(ssort.SelectedValue);
            }
            if (!string.IsNullOrEmpty(gljym.SelectedValue) && gljym.SelectedValue != "不限")
            {
                SeachTo += "&gptime=" + LTP.Common.StringPlus.htmlstr(gljym.Text);
            }



            Response.Redirect(SeachTo);
        }
       
       
    }
}