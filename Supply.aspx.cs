using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace JDJS.Web
{
    public partial class Supply : System.Web.UI.Page
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
            JDJS.BLL.Mat_Trade_Info bll = new JDJS.BLL.Mat_Trade_Info();
            RepInfo1.DataSource = bll.GetList(12, "infotype=0 and showflag=1", "ptime desc");
            RepInfo1.DataBind();
        }
        private void BindInfo2()
        {
            JDJS.BLL.Mat_Trade_Info bll = new JDJS.BLL.Mat_Trade_Info();
            RepInfo2.DataSource = bll.GetList(12, "infotype=1 and showflag=1", "ptime desc");
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
