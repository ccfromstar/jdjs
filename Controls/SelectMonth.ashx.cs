using System;
using System.Web;
using System.Data;
using System.Text;

namespace JDJS.Web.Controls
{
    /// <summary>
    /// SelectMonth 的摘要说明
    /// </summary>
    public class SelectMonth : IHttpHandler
    {

        public void ProcessRequest(HttpContext context)
        {
            try
            {
                string maxyear = context.Request["Year"];
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
                StringBuilder sb = new StringBuilder();
                sb.Append("<option selected=\"selected\" value=\"不限\">不限</option>");
                for (int i = minmonth; i <= maxmonth; i++)
                {
                    sb.Append("	<option value=\"" + i.ToString() + "\">" + i.ToString() + "</option>");
                }
                context.Response.Write(sb);
            }
            catch
            {
                context.Response.Write("<option selected=\"selected\" value=\"不限\">不限</option>");
            }
        }

        public bool IsReusable
        {
            get
            {
                return false;
            }
        }
    }
}