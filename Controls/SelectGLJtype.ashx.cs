using System;
using System.Web;
using System.Data;
using System.Text;

namespace JDJS.Web.Controls
{
    /// <summary>
    /// SelectGLJtype 的摘要说明
    /// </summary>
    public class SelectGLJtype : IHttpHandler
    {

        public void ProcessRequest(HttpContext context)
        {
            try
            {
                string spcode = context.Request["spcode"];
                string itname, itcode; int rcnt = 0;
                JDJS.BLL.glj bll = new JDJS.BLL.glj();
                DataSet itcinfo = bll.GetList(" bsort,ssort", " bsort='" + spcode + "' group by bsort,ssort");
                StringBuilder sb2 = new StringBuilder();
                if (itcinfo.Tables[0].Rows.Count > 0)
                {
                    DataRow row;

                    rcnt = itcinfo.Tables[0].Rows.Count;
                    // itemDL.Items.Clear();                   

                    sb2.Append("<option selected=\"selected\" value=\"不限\">不限</option>");
                    for (int i = 0; i < rcnt; i++)
                    {
                        row = itcinfo.Tables[0].Rows[i];
                        itname = Convert.ToString(row["ssort"]);
                        itcode = Convert.ToString(row["ssort"]);
                        sb2.Append("	<option value=\"" + itcode.ToString() + "\">" + itname.ToString() + "</option>");
                    }
                }
                else
                {
                    sb2.Append("<option selected=\"selected\" value=\"不限\">不限</option>");
                
                }
                   
                
                context.Response.Write(sb2);

              

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