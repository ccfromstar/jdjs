using System;
using System.Web;
using System.Data;
using System.Text;


namespace JDJS.Web.Controls
{
    /// <summary>
    /// SelectArea 的摘要说明
    /// </summary>
    public class SelectArea : IHttpHandler
    {

        public void ProcessRequest(HttpContext context)
        {
            try
            {
                string spcode = context.Request["spcode"];
                string itname, itcode; int rcnt = 0;
                JDJS.BLL.project_inforbase bll = new JDJS.BLL.project_inforbase();
                DataSet itcinfo = bll.GetList(" proplace,proquyu", " proplace='" + spcode + "' group by proplace,proquyu");
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
                        itname = Convert.ToString(row["proquyu"]);
                        itcode = Convert.ToString(row["proquyu"]);
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