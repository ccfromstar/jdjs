using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace JDJS.Web
{
    public partial class PolicyDetail : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                string Part = "";
                string Id = "";
                if (!string.IsNullOrEmpty(Request.QueryString["Part"]) && !string.IsNullOrEmpty(Request.QueryString["Id"]))
                {
                    Part = Request.QueryString["Part"];
                    Id = Request.QueryString["Id"];
                    BindInfo(Part, Id);
                }

            }
        }
        private void BindInfo(string Part, string Id)
        {
            try
            {
                int InfoId = int.Parse(Id);
                switch (Part)
                {
                    case "1":
                        ImgBg.ImageUrl = "style/images/Policy-md1.gif";
                        BindInfo1(InfoId);
                        break;
                    case "2":
                        ImgBg.ImageUrl = "style/images/Policy-md2.gif";
                        BindInfo1(InfoId);
                        break;
                    default:
                        break;
                }
            }
            catch
            {
            }

        }
        private void BindInfo1(int Id)
        {
            JDJS.BLL.zcfg bll = new JDJS.BLL.zcfg();
            JDJS.Model.zcfg model = bll.GetModel(Id);
            //lbTitle.Text = model.title;
            lbBody.Text = Server.HtmlDecode(model.content);
        }
    }
}
