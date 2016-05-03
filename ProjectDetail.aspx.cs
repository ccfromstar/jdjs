using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace JDJS.Web
{
    public partial class ProjectDetail : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

            string Part = "";
            string Id = "";
            if (!string.IsNullOrEmpty(Request.QueryString["Part"]) && !string.IsNullOrEmpty(Request.QueryString["Id"]))
            {
                Part = Request.QueryString["Part"];
                Id = Request.QueryString["Id"];
                if (!LTP.Common.UserInfo.IsLogin())
                {
                    Session["FromPage"] = HttpContext.Current.Request.Url.PathAndQuery;
                    Response.Redirect("Login.aspx");
                }
                else
                {
                    Session["FromPage"] = null;
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
                        ImgBg.ImageUrl = "style/images/Project-md1.gif";
                        BindInfo1(InfoId);
                        break;
                    case "2":
                        ImgBg.ImageUrl = "style/images/Project-md2.gif";
                        BindInfo2(InfoId);
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
            Plinvite.Visible = true;
            JDJS.BLL.Trade_invite bll = new JDJS.BLL.Trade_invite();
            JDJS.Model.Trade_invite model = bll.GetModel(Id);
            lbTitle.Text = model.项目名称;
            lbTime.Text = DateTime.Parse(model.发布日期.ToString()).ToShortDateString();
            lbType.Text = model.类型;
            lbNb.Text = model.报建编号;
            lbCp.Text = model.招标单位;
            lbZbdw.Text = model.招标代理单位;
            lbGc.Text = model.项目名称;
            lbAdd.Text = model.建设地点;
            lbGm.Text = model.投资规模;
            lbArea.Text = model.建筑面积;
            lbLxr.Text = model.联系人;
            lbPhone.Text = model.电话;
            LbMobil.Text = model.手机;
            lbDate.Text = model.报名日期;
            lbBmadd.Text = model.报名地点;
            lbTj.Text = model.报名条件;
            lbRemark.Text = model.备注;
            lbXmType.Text = model.项目类别;
            lbGcType.Text = model.工程类别;
            lbBdNum.Text = model.标段号;
            lbOther.Text = model.其他;
        }
        private void BindInfo2(int Id)
        {
            Plresult.Visible = true;
            JDJS.BLL.Trade_result bll = new JDJS.BLL.Trade_result();
            JDJS.BLL.Trade_invite bllTi = new JDJS.BLL.Trade_invite();
            JDJS.Model.Trade_result model = bll.GetModel(Id);
            JDJS.Model.Trade_invite modelTi = new JDJS.Model.Trade_invite(); ;
            lbTitle.Text = model.项目名称;
            lbTime.Text = DateTime.Parse(model.发布日期.ToString()).ToShortDateString();
            lbZbType.Text = model.类型;
            lbZbCp.Text = model.招标单位;
            lbZbPrice.Text = model.中标价;
            lbZbTitle.Text = model.项目名称;
            lbZbAdd.Text = model.建设地点;
            lbZbzbCp.Text = model.中标单位;
            lbZbArea.Text = model.建筑面积;
            lbZbTime.Text = DateTime.Parse(model.中标日期.ToString()).ToShortDateString();
            lbZbGTime.Text = model.工期;
            lbZbDl.Text = model.招标代理单位;
            lbFzr.Text = model.项目负责人姓名;
            lbOther1.Text = model.其他;
            lbZbNb.Text = model.中标通知书编号;
            string Code = model.中标通知书编号;
            Code = Code.Substring(0, Code.Length - 3);

            modelTi = bllTi.GetModel(Code);
            if (modelTi != null && !string.IsNullOrEmpty(modelTi.报建编号))
            {
                lbZbNb.PostBackUrl = "ProjectDetail.aspx?Part=1&Id=" + modelTi.序号;
            }
            lbZbBag.Text = model.发包方式;
            lbZbRemark.Text = model.备注;
            //modelTi = bllTi.GetModel(model.中标通知书编号);
            //if (modelTi != null)
            //{
            //    lbZbNb.PostBackUrl = "ProjectDetail.aspx?Part=1&Id=" + modelTi.序号;
            //}
        }

    }
}
