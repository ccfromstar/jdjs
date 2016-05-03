using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace JDJS.Web
{
    public partial class Policy : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                BindInfo1();
                BindInfo2();
            }
        }
        private void BindInfo1()
        {
            JDJS.BLL.zcfg bll = new JDJS.BLL.zcfg();
            RepInfo1.DataSource = bll.GetList(12, "sort in('法律','行政部门','部门规章','地方性法规和规章','各类文件')", "ptime desc");
            RepInfo1.DataBind();
        }
        private void BindInfo2()
        {
            JDJS.BLL.zcfg bll = new JDJS.BLL.zcfg();
            RepInfo2.DataSource = bll.GetList(12, "sort in ('最新公告','通知提示','诚信手册','安全生产许可证')", "ptime desc");
            RepInfo2.DataBind();
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
