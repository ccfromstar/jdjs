using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace JDJS.Web.zhongcai
{
    public partial class mat_infor : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                    int id;
                    if (!string.IsNullOrEmpty(Request.QueryString["id"]))
                    {
                        id = Convert.ToInt32(LTP.Common.StringPlus.htmlstr(Request.QueryString["id"].ToString()));
                        BindInfo(id);
                    }

                    
            }
        }
        private void BindInfo(int id)
        {

            JDJS.BLL.material_data bll = new JDJS.BLL.material_data();
            JDJS.Model.material_data model = bll.GetModel(id);

            
            Zname.Text = model.zname;
            Zlprice.Text = model.lprice.ToString() + " 元  " + model.zunit;
                Zptime.Text=NewStr(model.ptime.ToString());
                Zplace.Text=model.place;
                Zaut.Text=model.amount;
                Zmat.Text=model.material;
                Zsta.Text=model.standard;
                Zrek.Text = model.rek;
        }
        public string NewStr(string dt)
        {
            try
            {
                //DateTime newdt = DateTime.Parse(dt);
                string riqi = Convert.ToDateTime(dt).ToShortDateString();
                return riqi;
            }
            catch
            {
                return "";
            }
        }
        public string Getpic()
        {
            string pic; int id;
            if (!string.IsNullOrEmpty(Request.QueryString["id"]))
            {
                id = Convert.ToInt32(LTP.Common.StringPlus.htmlstr(Request.QueryString["id"].ToString()));
                JDJS.BLL.material_data bll = new JDJS.BLL.material_data();
                JDJS.Model.material_data model = bll.GetModel(id);

                if (!string.IsNullOrEmpty(model.pic))
                {
                    pic = model.pic;
                }
                else
                {
                    pic = "../../uploads/nullpic.jpg";
                }

            }
            else
            {
                pic = "../../uploads/nullpic.jpg";
            }
            return pic;
        }
        public string Getfdpic()
        {
            string pic; int id;
            if (!string.IsNullOrEmpty(Request.QueryString["id"]))
            {
                id = Convert.ToInt32(LTP.Common.StringPlus.htmlstr(Request.QueryString["id"].ToString()));
                JDJS.BLL.material_data bll = new JDJS.BLL.material_data();
                JDJS.Model.material_data model = bll.GetModel(id);

                if (!string.IsNullOrEmpty(model.fdpic))
                {
                    pic = model.fdpic;
                }
                else
                {
                    pic = "../../uploads/nullpic.jpg";
                }

            }
            else
            {
                pic = "../../uploads/nullpic.jpg";
            }
            return pic;
        }
    }
}