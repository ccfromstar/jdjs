using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace JDJS.Web
{
    public partial class WXtradeDetail : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
              string Id = "";

              if (!string.IsNullOrEmpty(Request.QueryString["Id"]))
              {

                  Id = Request.QueryString["Id"];

                  BindInfo(Convert.ToInt32(Id));
              }
              
        }
             private void BindInfo(int Id)
        {
            
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
    }
}