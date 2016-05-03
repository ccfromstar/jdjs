using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.IO;
using System.Data;
namespace JDJS.Web
{
    public partial class DownloadDetail : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {



            if (!IsPostBack)
            {
                if (!LTP.Common.UserInfo.IsLogin())
                {
                    Session["FromPage"] = HttpContext.Current.Request.Url.PathAndQuery;
                    Response.Redirect("Login.aspx");
                }
                else
                {
                    Session["FromPage"] = null;
                    string type = Request.QueryString["type"].ToString();

                    switch (type)
                    {
                        case "1":
                            BindDown1();
                            break;
                        case "2":
                            BindDown2();
                            break;
                        case "3":
                            BindYear();
                            BindDown3();
                            break;
                        case "4":
                            BindDown4();
                            break;
                        default:
                            BindDown2();
                            break;
                    }
                }
            }
        }
        private void BindDown1()
        {
            Panel1.Visible = true;
            BindProject();
        }
        private void BindDown2()
        {
            Panel2.Visible = true;
            //JDJS.BLL.XXDQ_Update_files bll = new JDJS.BLL.XXDQ_Update_files();
            //JDJS.Model.XXDQ_Update_files model = new JDJS.Model.XXDQ_Update_files();
            //model=bll.GetModel("type='最新月包' order by ptime desc");
            //lbbb.Text = model.name;
            
        }
        private void BindDown3()
        {
            BindYear();
            BindYear2();
            BindYear3();
            BindYear4();
            Panel3.Visible = true;
        }
        private void BindDown4()
        {
            Panel4.Visible = true;
            JDJS.BLL.Data_DownLoad bll = new JDJS.BLL.Data_DownLoad();
            RepDW4.DataSource = bll.GetAllList();
            RepDW4.DataBind();
        }
        private void BindYear()
        {
            int minyear = DateTime.Now.Year;
            int maxyear = DateTime.Now.Year;
            JDJS.BLL.ebook bll = new JDJS.BLL.ebook();
            JDJS.Model.ebook model = new JDJS.Model.ebook();
            DataSet minds = bll.GetList(1, " min(year(ptime)) as minyear", "type='月包'", "");
            if (minds.Tables[0].Rows.Count > 0)
            {
                minyear = Convert.ToInt32(minds.Tables[0].Rows[0]["minyear"]);
            }
            DataSet maxds = bll.GetList(1, " max(year(ptime)) as maxyear", "type='月包'", "");
            if (maxds.Tables[0].Rows.Count > 0)
            {
                maxyear = Convert.ToInt32(maxds.Tables[0].Rows[0]["maxyear"]);
            }
            ddlyear1.Items.Clear();
            for (int i = maxyear; i >= minyear; i--)
            {
                ddlyear1.Items.Add(i.ToString());
            }
            BindMonth();
            //for (int j = 12; j >= 1; j--)
            //{
            //    ddlmonth1.Items.Add(j.ToString());
            //}
        }
        private void BindMonth()
        {
            string year = ddlyear1.SelectedValue;
            ddlmonth1.Items.Clear();
            JDJS.BLL.ebook bll = new JDJS.BLL.ebook();
            DataSet ds = bll.GetList("year(ptime)='" + year + "' order by ptime desc");
            for (int i = 0; i < ds.Tables[0].Rows.Count; i++)
            {
                //row = ds.Tables[0].Rows[i];
                //newyear = row["bookname"].ToString();
                //int str = newyear.IndexOf("月", 0);
                //if (str == 6)
                //{
                //    newyear = newyear.Substring(5, 1);
                //}
                //else
                //{
                //    newyear = newyear.Substring(5, 2);
                //}
                ddlmonth1.Items.Add(DateTime.Parse(ds.Tables[0].Rows[i]["ptime"].ToString()).Month.ToString());
            }
        }
        private void BindYear2()
        {
            JDJS.BLL.ebook bll = new JDJS.BLL.ebook();
            DataSet ds = bll.GetList("type ='年包' order by ptime desc");
            //if (ds.Tables[0].Rows.Count > 0)
            //{
                ddlyear2.Items.Clear();
                for (int i = 0; i < ds.Tables[0].Rows.Count; i++)
                {
                    ddlyear2.Items.Add(ds.Tables[0].Rows[i]["bookname"].ToString());
                }
            //}
        }
        private void BindYear3()
        {
            JDJS.BLL.huibian_ebook_info bll = new JDJS.BLL.huibian_ebook_info();
            DataSet ds = bll.GetList("type=0");
            if (ds.Tables[0].Rows.Count > 0)
            {
                ddlyear3.Items.Clear();
                for (int i = ds.Tables[0].Rows.Count - 1; i >= 0; i--)
                {
                    ddlyear3.Items.Add(ds.Tables[0].Rows[i]["bookname"].ToString());
                }
            }
        }
        private void BindYear4()
        {

            JDJS.BLL.huibian_ebook_info bll = new JDJS.BLL.huibian_ebook_info();
            DataSet ds = bll.GetList("type=1");
            if (ds.Tables[0].Rows.Count > 0)
            {
                ddlyear4.Items.Clear();
                for (int i = ds.Tables[0].Rows.Count - 1; i >= 0; i--)
                {
                    ddlyear4.Items.Add(ds.Tables[0].Rows[i]["bookname"].ToString());
                }
            }
        }
        private void BindProject()
        {
            JDJS.BLL.About_Doc bll = new JDJS.BLL.About_Doc();
            ListLaw.DataSource = bll.GetList("type='项 目'and item='办事指南'");
            ListLaw.DataBind();
            ListOther.DataSource = bll.GetList("type='项 目'and item='相关下载'");
            ListOther.DataBind();
        }
        private void BindBuild()
        {
            JDJS.BLL.About_Doc bll = new JDJS.BLL.About_Doc();
            ListLaw.DataSource = bll.GetList("type='建 材'and item='办事指南'");
            ListLaw.DataBind();
            ListOther.DataSource = bll.GetList("type='建 材'and item='相关下载'");
            ListOther.DataBind();
        }
        private void BindEnterprise()
        {
            JDJS.BLL.About_Doc bll = new JDJS.BLL.About_Doc();
            ListLaw.DataSource = bll.GetList("type='企 业'and item='办事指南'");
            ListLaw.DataBind();
            ListOther.DataSource = bll.GetList("type='企 业'and item='相关下载'");
            ListOther.DataBind();
        }
        private void BindStaff()
        {
            JDJS.BLL.About_Doc bll = new JDJS.BLL.About_Doc();
            ListLaw.DataSource = bll.GetList("type='人 员'and item='办事指南'");
            ListLaw.DataBind();
            ListOther.DataSource = bll.GetList("type='人 员'and item='相关下载'");
            ListOther.DataBind();
        }
        private void DownLoad(string url)
        {
            url = url.Replace("../", "");
            try
            {
                string destionfile;//=Server.MapPath(url);
                destionfile = HttpContext.Current.Server.MapPath(url);
                FileInfo fi = new FileInfo(destionfile);
                Response.Clear();//Response.Clear();
                Response.ClearHeaders();//Response.ClearHeaders();
                Response.Buffer = false;//Response.Buffer = false;

                //Response.AppendHeader("Content-Disposition","attachment;filename=" +HttpUtility.UrlEncode(Path.GetFileName(destFileName),System.Text.Encoding.Default));
                Response.AppendHeader("Content-Disposition", "attachment;filename=" + HttpUtility.UrlEncode(Path.GetFileName(destionfile), System.Text.Encoding.UTF8));
                Response.AppendHeader("Content-Length", fi.Length.ToString());
                Response.ContentType = "application/octet-stream";
                Response.WriteFile(destionfile);
                Response.End();
            }
            catch (System.Exception e)
            {
                string error = e.Message;
                Response.Redirect(url, false);
                //Response.Write("<script language=javascript>window.close()</script>");
            }
        }

        protected void lbDownLoad_Click(object sender, EventArgs e)
        {
            JDJS.BLL.XXDQ_Update_files bll = new JDJS.BLL.XXDQ_Update_files();
            JDJS.Model.XXDQ_Update_files model = new JDJS.Model.XXDQ_Update_files();
            model = bll.GetModel("type='最新月包' order by ptime desc");
            string url = model.url;
            DownLoad(url);
        }

        protected void btnDownload1_Click(object sender, EventArgs e)
        {
            JDJS.BLL.ebook bll = new JDJS.BLL.ebook();
            JDJS.Model.ebook model = new JDJS.Model.ebook();
            model = bll.GetModel("type='月包' and year(ptime)='" + ddlyear1.SelectedValue + "' and month(ptime) ='" + ddlmonth1.SelectedValue + "'");
            if (model!=null)
            {
                model.downloadcnt += 1;
                bll.Update(model);   
                DownLoad(model.address);     
            }
        }

        protected void btnDownload2_Click(object sender, EventArgs e)
        {
            JDJS.BLL.ebook bll = new JDJS.BLL.ebook();
            JDJS.Model.ebook model = new JDJS.Model.ebook();
            model = bll.GetModel("type='年包' and bookname like '" + ddlyear2.SelectedValue + "%'");
            if (model != null)
            {
                model.downloadcnt += 1;
                bll.Update(model);
                DownLoad(model.address);
            }
        }

        protected void btnDownload3_Click(object sender, EventArgs e)
        {
            JDJS.BLL.huibian_ebook_info bll = new JDJS.BLL.huibian_ebook_info();
            JDJS.Model.huibian_ebook_info model = new JDJS.Model.huibian_ebook_info();
            model = bll.GetModel("bookname like '"+ddlyear3.SelectedValue+"%'"+" and type=0");
            if (model != null)
            {
                DownLoad(model.address);
            }
        }

        protected void btnDownload4_Click(object sender, EventArgs e)
        {
            JDJS.BLL.huibian_ebook_info bll = new JDJS.BLL.huibian_ebook_info();
            JDJS.Model.huibian_ebook_info model = new JDJS.Model.huibian_ebook_info();
            model = bll.GetModel("bookname like '" + ddlyear4.SelectedValue + "%'" + " and type=1");
            if (model != null)
            {
                DownLoad(model.address);
            }
        }

        protected void btnDownload5_Click(object sender, EventArgs e)
        {
            DownLoad("files/ebook/fix.reg");
        }

        protected void lbProject_Click(object sender, EventArgs e)
        {
            BindProject();
        }

        protected void lbBuild_Click(object sender, EventArgs e)
        {
            BindBuild();
        }

        protected void lbEnterprise_Click(object sender, EventArgs e)
        {
            BindEnterprise();
        }

        protected void lbStaff_Click(object sender, EventArgs e)
        {
            BindStaff();
        }

        protected void ddlyear1_SelectedIndexChanged(object sender, EventArgs e)
        {
            BindMonth();
        }


    }
}
