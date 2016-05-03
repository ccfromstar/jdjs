using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace JDJS.Web
{
    public partial class CornerDetail : System.Web.UI.Page
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
                        ImgBg.ImageUrl = "style/images/Corner-md1.gif";
                        BindInfo1(InfoId);
                        break;
                    case "2":
                        ImgBg.ImageUrl = "style/images/Corner-md2.gif";
                        BindInfo1(InfoId);
                        break;
                    case "3":
                        ImgBg.ImageUrl = "style/images/Corner-md3.gif";
                        BindInfo1(InfoId);
                        break;
                    case "4":
                        ImgBg.ImageUrl = "style/images/Corner-md4.gif";
                        BindInfo1(InfoId);
                        break;
                    case "5":
                        ImgBg.ImageUrl = "style/images/Corner-md5.gif";
                        BindInfo1(InfoId);
                        break;
                    case "6":
                        ImgBg.ImageUrl = "style/images/Corner-md6.gif";
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
            JDJS.BLL.gczj bll = new JDJS.BLL.gczj();
            JDJS.Model.gczj model = bll.GetModel(Id);
            lbTitle.Text = model.title;
            lbBody.Text = Server.HtmlDecode(model.content);
            if (!string.IsNullOrEmpty(model.url))
            {
                Response.Redirect(model.url);
            }
        }
    }
}
