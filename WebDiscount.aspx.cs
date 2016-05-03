using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

namespace JDJS.Web
{
    public partial class WebDiscount : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

            string id = "";

            if (!string.IsNullOrEmpty(Request.QueryString["id"]))
            {
                id = LTP.Common.StringPlus.htmlstr(Request.QueryString["id"].ToString());
            }
            if (!IsPostBack)
            {

                if (!string.IsNullOrEmpty(Request.QueryString["uid"]))
                {
                    Session["HZDWID"] = LTP.Common.StringPlus.htmlstr(Request.QueryString["uid"].ToString());
                }
                else
                {
                    Session["HZDWID"] = 10000;
                }
                Label7.Visible = false; Label8.Visible = false;
                GetTheDiscountDetail(id);
            }
        }
        public string GetTheDiscountDetail(string id)
        {

            /*DataSet ds = new DataSet();
            DataTable tbl = new DataTable("protable");

            tbl.Columns.Add("id", typeof(int));
            tbl.Columns.Add("Dis_d_id", typeof(int));
            tbl.Columns.Add("det_title", typeof(string));
            tbl.Columns.Add("det_rek", typeof(string));
            tbl.Columns.Add("Dis_monry", typeof(decimal));

            tbl.Columns.Add("prostime", typeof(DateTime));
            tbl.Columns.Add("proftime", typeof(DateTime));
            
            ds.Tables.Add(tbl);*/
            
            
            string strwhere = " 1=1 ";
            JDJS.BLL.Discount_Detail_Table bll = new JDJS.BLL.Discount_Detail_Table();
           
            strwhere = strwhere +" and Disid="+id;
            //Pager.PageSize = 20;
            //Pager.RecordCount = bll.GetCount(strwhere);
            //Discnt.DataSource = bll.GetList(Pager.PageSize, Pager.PageIndex, "Dis_d_id", strwhere);
            Discnt.DataSource = bll.GetList(strwhere);
            Discnt.DataBind();


            //JDJS.Model.dsrecord model = bll1.GetList(strwhere);


            return "";
        }

        protected void SQButton_Click(object sender, EventArgs e)
        {
            int j = 0; float amount=0;
            for (int i = 0; i < this.Discnt.Items.Count; i++)
            {
                System.Web.UI.WebControls.CheckBox checkbox2 = (System.Web.UI.WebControls.CheckBox)Discnt.Items[i].FindControl("CheckBox2");
                if (checkbox2.Checked == true)
                {
                    j = j + 1;
                    System.Web.UI.WebControls.Label labelID = (System.Web.UI.WebControls.Label)this.Discnt.Items[i].FindControl("Labmoney");
                    amount = amount + Convert.ToSingle(labelID.Text);
                    //System.Web.UI.WebControls.Label labelID = (System.Web.UI.WebControls.Label)this.Discnt.Items[i].FindControl("Label1");
                    //Response.Write(labelID.Text);
                }
            }
            if (j > 0)
            {
                AddSQrec(j, amount);
            }
            else 
            {
                LTP.Common.MessageBox.Show(this.Page, "请至少选中一项优惠项目！");
            }
        }
        protected void AddSQrec(int Detailcnt,float amount)
        {

            int LSid;
            //JDJS.BLL.Trade_invite bll = new JDJS.BLL.Trade_invite();
            //JDJS.Model.Trade_invite model = new JDJS.Model.Trade_invite();
            
            JDJS.BLL.SQ_Base_info bll = new JDJS.BLL.SQ_Base_info();
            JDJS.Model.SQ_Base_info model = new JDJS.Model.SQ_Base_info();

            JDJS.BLL.SQ_Detail_info Dbll = new JDJS.BLL.SQ_Detail_info();
            JDJS.Model.SQ_Detail_info Dmodel = new JDJS.Model.SQ_Detail_info();

            model.SQcompany = LTP.Common.StringPlus.htmlstr(SQcmp.Text);
            model.SQlinkman = LTP.Common.StringPlus.htmlstr(SQman.Text);
            model.SQaddress = LTP.Common.StringPlus.htmlstr(SQaddr.Text);
            model.SQphone = LTP.Common.StringPlus.htmlstr(SQpho.Text);
            model.SQamount = amount;
            if (!string.IsNullOrEmpty(Request.QueryString["uid"]))
            {
                model.uid = LTP.Common.StringPlus.htmlstr(Request.QueryString["uid"].ToString());
            }
            else
            {
                if (!string.IsNullOrEmpty(Session["HZDWID"].ToString()))
                {
                    model.uid = Session["HZDWID"].ToString();
                }
                else
                {
                    model.uid = "10000";
                }
            }
            if (!string.IsNullOrEmpty(Request.QueryString["id"]))
            {
                model.Disid = Convert.ToInt32(LTP.Common.StringPlus.htmlstr(Request.QueryString["id"].ToString()));
            }
            model.cflag = 0;
            model.SQtime = DateTime.Now;
            LSid = bll.Add(model);
            
            for (int i = 0; i < this.Discnt.Items.Count; i++)
            {
                System.Web.UI.WebControls.CheckBox checkbox2 = (System.Web.UI.WebControls.CheckBox)Discnt.Items[i].FindControl("CheckBox2");
                if (checkbox2.Checked == true)
                {
                    System.Web.UI.WebControls.Label labelID = (System.Web.UI.WebControls.Label)this.Discnt.Items[i].FindControl("Label1");
                    System.Web.UI.WebControls.Label labelMON = (System.Web.UI.WebControls.Label)this.Discnt.Items[i].FindControl("Labmoney"); 
                     Dbll = new JDJS.BLL.SQ_Detail_info();
                     Dmodel = new JDJS.Model.SQ_Detail_info();
                     Dmodel.LSid = LSid;
                     Dmodel.Disid = model.Disid;
                     Dmodel.Dis_d_id = Convert.ToInt32(labelID.Text.ToString());
                     Dmodel.Dismoney = Convert.ToSingle(labelMON.Text.ToString());
                     Dbll.Add(Dmodel);
                    //Response.Write(labelID.Text);
                }
            }

            Label7.Visible = true; Label8.Text = LSid.ToString(); Label8.Visible = true;
            LTP.Common.MessageBox.Show(this.Page, "请牢记您的优惠验证码："+LSid.ToString()+"  缴费时需核对此码！");
        }

        public Boolean Getstyle(string check,int type)
        {
            if (check == "1")
            {
                if (type == 0)
                {
                    return true;
                }
                else
                {
                    return false;
                }
            }
            else
            {
                if (type == 0)
                {
                    return false;
                }
                else
                {
                    return true;
                }
                
                
            }
            
            
        }
    }
}