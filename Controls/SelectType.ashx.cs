using System;
using System.Web;
using System.Data;
using System.Text;


namespace JDJS.Web.Controls
{
    /// <summary>
    /// SelectType 的摘要说明
    /// </summary>
    public class SelectType : IHttpHandler
    {

        public void ProcessRequest(HttpContext context)
        {
            try
            {
                string spcode = context.Request["spcode"];
                string itname, itcode; int rcnt = 0;
                JDJS.BLL.mat_item bll = new JDJS.BLL.mat_item();
                DataSet itcinfo = bll.GetList(" specialCode='" + spcode + "' order by id");
                //if (itcinfo.Tables[0].Rows.Count > 0)
                //{
                    DataRow row;
                    // row = month.Tables[0].Rows[0];
                    // minmonth = Convert.ToInt32(row["minmonth"]);
                    // maxmonth = Convert.ToInt32(row["maxmonth"]);

                    rcnt = itcinfo.Tables[0].Rows.Count;
                    // itemDL.Items.Clear();
                    StringBuilder sb2 = new StringBuilder();

                    sb2.Append("<option selected=\"selected\" value=\"不限\">不限</option>");
                    for (int i = 0; i < rcnt; i++)
                    {
                        row = itcinfo.Tables[0].Rows[i];
                        itname = Convert.ToString(row["name"]);
                        itcode = Convert.ToString(row["itemcode"]);
                        sb2.Append("	<option value=\"" + itcode.ToString() + "\">" + itname.ToString() + "</option>");
                    }
                    context.Response.Write(sb2);

                //}
                //else
                //{

                 //   context.Response.Write("<option selected=\"selected\" value=\"不限\">不限</option>");
                //}
                
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