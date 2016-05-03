using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace JDJS.Web
{
    public partial class Quite : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (!LTP.Common.UserInfo.IsLogin())
                {
                    Session["FromPage"] = HttpContext.Current.Request.Url.PathAndQuery;
                    Response.Redirect("Login.aspx");
                }
                else
                {
                    Session["FromPage"] = null;
                    BindQuite();
                }
            }
        }
        private void BindQuite()
        {
            string sqlstr = " id in (";
            if (Session["Quiet"] != null)
            {
                List<string> idlist = (List<string>)Session["Quiet"];
                if (idlist.Count < 1)
                {
                    Response.Redirect(Session["FromPage"].ToString());
                }
                for (int i = 0; i < idlist.Count; i++)
                {
                    sqlstr += "'" + idlist[i] + "'";
                    if (i < idlist.Count-1)
                    {
                        sqlstr += ",";
                    }
                }
            }
            else
            {
                Response.Redirect(Session["FromPage"].ToString());
            }
            sqlstr += ") ";
            JDJS.BLL.real_material_data bll = new BLL.real_material_data();
            repQuite.DataSource = bll.GetList(sqlstr);
            repQuite.DataBind();
        }

        public string GetNoImg(string Imgstr)
        {
            if (!string.IsNullOrEmpty(Imgstr))
            {
                return Imgstr;
            }
            else
            {
                return "style/images/nophoto.gif";
            }
        }
        public string GetCpName(string id)
        {
            JDJS.BLL.material_company bll = new BLL.material_company();
            JDJS.Model.material_company model = bll.GetModel(id);
            if (model != null)
            {
                return model.company;
            }
            else
            {
                return "";
            }
        }

        protected void btnReturn_Click(object sender, EventArgs e)
        {
            Response.Redirect("SeachReal.aspx");
        }
    }
}