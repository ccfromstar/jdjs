using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace JDJS.Web.Controls
{
    public partial class indexpromat : System.Web.UI.UserControl
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                BindInfo();
            }
        }
        private void BindInfo()
        {
            //string strwhere = "1=1";
            JDJS.BLL.pro_mat_view bll = new JDJS.BLL.pro_mat_view();
            Repmat.DataSource = bll.GetList(50, "disflag=0", " ptime desc, NEWID()");
            Repmat.DataBind();
        }
        public string Getrecstate(string ID)
        {

            int Id = int.Parse(ID);
            string stcode = "";

            JDJS.BLL.pro_mat_view bll = new JDJS.BLL.pro_mat_view();
            JDJS.Model.pro_mat_view model = bll.GetModel(Id);

            switch (model.recstate)
            {
                case -1:
                    stcode = "未启动";
                    break;
                case 0:
                    stcode = "采购中";
                    break;
                case 1:
                    stcode = "已完成";
                    break;
                default: break;
            }
                

            return stcode;
          

        }
    }
}