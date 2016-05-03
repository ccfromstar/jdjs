using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

namespace JDJS.Web.Controls
{
    public partial class indexmat : System.Web.UI.UserControl
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
            JDJS.BLL.mat_special bll = new JDJS.BLL.mat_special();
            matspecial.DataSource = bll.GetAllList();
            matspecial.DataBind();
            //matitem.DataSource = bll.GetAllList();
            //matitem.DataBind();
        }
        

        protected void matspecial_ItemDataBound(object sender, RepeaterItemEventArgs e)
        {
            if (e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem)
            {

                JDJS.BLL.mat_item itbll = new JDJS.BLL.mat_item();
                
                Repeater rpColumnNews = (Repeater)e.Item.FindControl("matitem");
                
                //找到分类Repeater关联的数据项 

               
                DataRowView rowv = (DataRowView)e.Item.DataItem;
                //提取分类ID 
                string specialCode = Convert.ToString(rowv["specialCode"]);
                //里面的Repeater


                rpColumnNews.DataSource = itbll.GetList("specialCode='" + specialCode + "'");
                rpColumnNews.DataBind();

               
            }
        }

    }
}