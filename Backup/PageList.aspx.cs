using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace JDJS.Web
{
    public partial class PageList : System.Web.UI.Page
    {

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                string rqType = "";
                string Part = "";
                string Id = "";
                if (!string.IsNullOrEmpty(Request.QueryString["Type"]))
                {
                    rqType = Request.QueryString["Type"];
                }
                if (!string.IsNullOrEmpty(Request.QueryString["Part"]))
                {
                    Part = Request.QueryString["Part"];
                }
                if (!string.IsNullOrEmpty(Request.QueryString["Id"]))
                {
                    Id = Request.QueryString["Id"];
                }
                BindInfo(rqType, Part, Id);


            }
        }
        private void BindInfo(string rqType, string Part, string Id)
        {
            if (!string.IsNullOrEmpty(rqType) && !string.IsNullOrEmpty(Part))
            {
                switch (rqType)
                {
                    case "News":
                        if (!string.IsNullOrEmpty(Id))
                        {
                            Response.Redirect("NewsDetail.aspx?Part=" + Part + "&Id=" + Id);
                        }
                        else
                        {
                            Response.Redirect("NewsList.aspx?Part=" + Part);
                        }
                        break;
                    case "Project":
                        if (!string.IsNullOrEmpty(Id))
                        {
                            Response.Redirect("ProjectDetail.aspx?Part=" + Part + "&Id=" + Id);
                        }
                        else
                        {
                            Response.Redirect("ProjectList.aspx?Part=" + Part);
                        }
                        break;
                    case "Market":
                        if (!string.IsNullOrEmpty(Id))
                        {
                            Response.Redirect("MarketDetail.aspx?Part=" + Part + "&Id=" + Id);
                        }
                        else
                        {
                            Response.Redirect("MarketList.aspx?Part=" + Part);
                        }
                        break;
                    case "Supply":
                        if (!string.IsNullOrEmpty(Id))
                        {
                            Response.Redirect("SupplyDetail.aspx?Part=" + Part + "&Id=" + Id);
                        }
                        else
                        {
                            Response.Redirect("SupplyList.aspx?Part=" + Part);
                        }
                        break;
                    case "Corner":
                        if (!string.IsNullOrEmpty(Id))
                        {
                            Response.Redirect("CornerDetail.aspx?Part=" + Part + "&Id=" + Id);
                        }
                        else
                        {
                            Response.Redirect("CornerList.aspx?Part=" + Part);
                        }
                        break;
                    case "Policy":
                        if (!string.IsNullOrEmpty(Id))
                        {
                            Response.Redirect("PolicyDetail.aspx?Part=" + Part + "&Id=" + Id);
                        }
                        else
                        {
                            Response.Redirect("PolicyList.aspx?Part=" + Part);
                        }
                        break;
                    default:
                        break;
                }
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
