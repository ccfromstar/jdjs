﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace JDJS.Web
{
    public partial class News : System.Web.UI.Page
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
            JDJS.BLL.HYDT bll = new JDJS.BLL.HYDT();
            RepInfo1.DataSource = bll.GetList(5, "type='建筑行业'", "ptime desc");
            RepInfo1.DataBind();
        }
        private void BindInfo2()
        {
            JDJS.BLL.HYDT bll = new JDJS.BLL.HYDT();
            RepInfo2.DataSource = bll.GetList(5, "type='建筑节能材料'", "ptime desc");
            RepInfo2.DataBind();
            //JDJS.BLL.new_material bll = new JDJS.BLL.new_material();
            //RepInfo2.DataSource = bll.GetList(5, "1=1", "ptime desc");
            //RepInfo2.DataBind();
           
        }
        private void BindInfo3()
        {
            JDJS.BLL.HYDT bll = new JDJS.BLL.HYDT();
            RepInfo3.DataSource = bll.GetList(5, "type='协会信息'", "ptime desc");
            RepInfo3.DataBind();
        }
        private void BindInfo4()
        {
            JDJS.BLL.HYDT bll = new JDJS.BLL.HYDT();
            RepInfo4.DataSource = bll.GetList(5, "type='招聘信息'", "ptime desc");
            RepInfo4.DataBind();
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
