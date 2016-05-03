using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace JDJS.Web
{
    public partial class NewsDetail : System.Web.UI.Page
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
                    BindInfo(Part,Id);
                }

            }
        }
        private void BindInfo(string Part,string Id)
        {
            try
            {
                int InfoId = int.Parse(Id);
                switch (Part)
                {
                    case "1":
                        ImgBg.ImageUrl = "style/images/new-md1.gif";
                        BindInfo1(InfoId);
                        break;
                    case "2":
                        ImgBg.ImageUrl = "style/images/new-md2.gif";
                        BindInfo1(InfoId);
                        break;
                    case "3":
                        ImgBg.ImageUrl = "style/images/new-md3.gif";
                        BindInfo1(InfoId);
                        break;
                    case "4":
                        ImgBg.ImageUrl = "style/images/new-md4.gif";
                        BindInfo1(InfoId);
                        break;
                    case "5":
                        ImgBg.ImageUrl = "style/images/new-md5.gif";
                        BindInfo3(InfoId);
                        break;
                    default:
                        break;
                }
            }
            catch
            {
            }
           
        }
        private void BindInfo1(int Id )
        {
           
            JDJS.BLL.HYDT bll=new JDJS.BLL.HYDT();
            JDJS.Model.HYDT model = bll.GetModel(Id);
            //lbTitle.Text = model.title;
            lbBody.Text = Server.HtmlDecode(model.content);
        }
        private void BindInfo2(int Id)
        {
            JDJS.BLL.new_material bll = new JDJS.BLL.new_material();
            JDJS.Model.new_material model = bll.GetModel(Id);
            if (model.type == "pic")
            {
                PanTl.Visible = false;
                PanImg.Visible = true;
                Img.ImageUrl = model.jpgurl.Replace("../","");
            }
            else
            {
                //lbTitle.Text = model.title;
                lbBody.Text = Server.HtmlDecode(model.content);
            }
        }
        private void BindInfo3(int Id)
        {
            JDJS.BLL.xtgg bll = new JDJS.BLL.xtgg();
            JDJS.Model.xtgg model = bll.GetModel(Id);
            //lbTitle.Text = model.title;
            lbBody.Text = Server.HtmlDecode(model.content);
            
        }
       
    }
}
