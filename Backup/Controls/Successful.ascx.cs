﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace JDJS.Web.Controls
{
    public partial class Successful : System.Web.UI.UserControl
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
            JDJS.BLL.Trade_result bll = new JDJS.BLL.Trade_result();
            RepSuccessful.DataSource = bll.GetList(5, "1=1", "发布日期 desc");
            RepSuccessful.DataBind();
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