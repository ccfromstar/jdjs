using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
namespace JDJS.Web
{
    public partial class Corner : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                BindInfo1();
                BindInfo2();
                BindInfo3();
                BindInfo4();
                BindInfo5();
                BindInfo6();
            }
        }
        private void BindInfo1()
        {
            JDJS.BLL.gczj bll = new JDJS.BLL.gczj();
            RepInfo1.DataSource = bll.GetList(5, "sort='主材快讯'", "ptime desc");
            RepInfo1.DataBind();
        }
        private void BindInfo2()
        {
            JDJS.BLL.gczj bll = new JDJS.BLL.gczj();
            RepInfo2.DataSource = bll.GetList(5, "sort='定额管理'" , "ptime desc");
            RepInfo2.DataBind();
        }
        private void BindInfo3()
        {
            JDJS.BLL.gczj bll = new JDJS.BLL.gczj();
            RepInfo3.DataSource = bll.GetList(5, "sort='标准管理'", "ptime desc");
            RepInfo3.DataBind();
        }
        private void BindInfo4()
        {

        }
        private void BindInfo5()
        {

        }
        private void BindInfo6()
        {

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
