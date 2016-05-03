using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace JDJS.Web
{
    public partial class Trend : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                BindInfo();
            }
        }

        private void BindInfo()
        {
            JDJS.BLL.Material_Trend bll = new BLL.Material_Trend();
            Pager.PageSize = 24;
            Pager.RecordCount = bll.GetCount("");//.Tables[0].Rows.Count;
            RepInfo.DataSource = bll.GetList(Pager.PageSize, Pager.PageIndex, "", "update", 1);
            RepInfo.DataBind();
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