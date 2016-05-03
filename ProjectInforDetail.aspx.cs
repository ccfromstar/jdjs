using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using PageControl;


namespace JDJS.Web
{
    public partial class ProjectInforDetail : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            string Part = "";
            string Id = "";
            //backlink.NavigateUrl = HttpContext.Current.Request.Url.PathAndQuery;
            if (!string.IsNullOrEmpty(Request.QueryString["Part"]) && !string.IsNullOrEmpty(Request.QueryString["Id"]))
            {
                Part = Request.QueryString["Part"];
                Id = Request.QueryString["Id"];
                JDJS.BLL.project_inforbase bll = new JDJS.BLL.project_inforbase();
                if (!LTP.Common.UserInfo.IsLogin())
                {
                   
                    Session["FromPage"] = HttpContext.Current.Request.Url.PathAndQuery;
                    //Response.Redirect("Login.aspx");
                    ImgBg.ImageUrl = "style/images/Project-md3.gif";
                    //if (bll.Getiffree(5, Id.ToString()))
                    //{
                    //    BindInfo(Part, Id);
                    //}
                    //else
                    //{
                        BindInfo2(int.Parse(Id));//未登录
                    //}
                   

                }
                else
                {
                    Session["FromPage"] = null;
                    BindInfo(Part, Id);//登录后
                }
            }
            btnSeach.Attributes.Add("onclick", "this.form.target='project_company_seach.aspx'");

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
                        
                        break;
                    case "2":
                        ImgBg.ImageUrl = "style/images/Project-md2.gif";
                        
                        break;

                    case "3":
                        ImgBg.ImageUrl = "style/images/Project-md3.gif";
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

            int killpt = 1;
            
            Plinvite.Visible = true;
            JDJS.BLL.project_inforbase bll = new JDJS.BLL.project_inforbase();
            JDJS.Model.project_inforbase model = bll.GetModel(Id);

            JDJS.BLL.cust_base_info cbll = new JDJS.BLL.cust_base_info();
            JDJS.Model.cust_base_info cmodel = ((JDJS.Model.cust_base_info)Session["User"]);

            JDJS.BLL.member_point pbll = new JDJS.BLL.member_point();
            JDJS.Model.member_point modeljf = pbll.GetModel(cmodel.newcode);

            Page.Title = "工程信息-" + model.proname+"-上海建定建设工程信息网";
            lbTitle.Text = model.proname;
            if (!string.IsNullOrEmpty(model.inforptime.ToString()))
            {
                lbTime.Text = DateTime.Parse(model.inforptime.ToString()).ToShortDateString();
            }
            else
            {
                lbTime.Text = "";
            }
            lbType.Text = model.prosort;
            lbstate.Text = model.prostate;
            lbplace.Text = model.proplace;

            if (!string.IsNullOrEmpty(model.prostime.ToString()))
            {
                lbstime.Text = DateTime.Parse(model.prostime.ToString()).ToShortDateString();
            }
            else
            {
                lbstime.Text = "";
            }
            if (!string.IsNullOrEmpty(model.proftime.ToString()))
            {
                lbftime.Text = DateTime.Parse(model.proftime.ToString()).ToShortDateString();
            }
            else
            {
                lbftime.Text = "";
            }
            lbmoney.Text = model.promoney;

            lbRemark.Text = model.prorek;


            string NewStr;
            int   Index   =   lbplace.Text.LastIndexOf("-");
            if (Index>-1) 
            {
                 NewStr = lbplace.Text.Substring(0, Index);
            }
            else
            {
                 NewStr = lbplace.Text;
            }
            
            JDJS.BLL.project_inforbase bll2 = new JDJS.BLL.project_inforbase();
            //if ((bll2.Getiffree(5, Id.ToString())) || ((cmodel.custtype != "4类") && (modeljf.JDB>killpt))) 
            //if (bll2.Getiffree(5, Id.ToString()))
         if (cmodel.custtype != "4类") 
        {

            if ((modeljf.JDB >= killpt)||(model.custreadrec.IndexOf(cmodel.newcode) > -1))
            {
                lbaddress.Text = model.proaddress;
                lbowner.Text = model.proowner;
                lbdesigner.Text = model.prodesigner;
                lbbuilder.Text = model.probuilder;

                if (!string.IsNullOrEmpty(lbowner.Text) || checkLinkmanCnt(Id.ToString(), "0") > 0)
                {
                    ownertext.Visible = true;
                }
                else
                {
                    ownertext.Visible = false;
                }
                if (!string.IsNullOrEmpty(lbdesigner.Text) || checkLinkmanCnt(Id.ToString(), "1") > 0)
                {
                    designertext.Visible = true;
                }
                else
                {
                    designertext.Visible = false;
                }
                if (!string.IsNullOrEmpty(lbbuilder.Text) || checkLinkmanCnt(Id.ToString(), "2") > 0)
                {
                    buildertext.Visible = true;
                }
                else
                {
                    buildertext.Visible = false;
                }
                if (model.custreadrec.IndexOf(cmodel.newcode) < 0)
                {
                    model.custreadrec = model.custreadrec + ":" + cmodel.newcode;
                    bll.Update(model);
                    modeljf.JDB = modeljf.JDB - killpt;
                    modeljf.point = modeljf.point + (killpt * 5);
                    modeljf.current_point = modeljf.current_point + (killpt * 5);
                    pbll.Update(modeljf);
                }
                Bindproowner(Id.ToString());
                Bindprodesigner(Id.ToString());
                Bindprobuilder(Id.ToString());
            }
            else
            {
                lbaddress.Text = lbOther3.Text;
                lbaddress.Font.Bold = lbOther3.Font.Bold;
                lbaddress.Font.Size = lbOther3.Font.Size;
                lbaddress.ForeColor = lbOther3.ForeColor;


                lbowner.Text = model.proowner;
                lbdesigner.Text = model.prodesigner;
                lbbuilder.Text = model.probuilder;
                if (!string.IsNullOrEmpty(lbowner.Text) || checkLinkmanCnt(Id.ToString(), "0") > 0)
                {
                    ownertext.Visible = true;
                    lbowner.Text = lbOther3.Text;
                    lbowner.Font.Bold = lbOther3.Font.Bold;
                    lbowner.Font.Size = lbOther3.Font.Size;
                    lbowner.ForeColor = lbOther3.ForeColor;
                }
                else
                {
                    ownertext.Visible = false;
                }
                if (!string.IsNullOrEmpty(lbdesigner.Text) || checkLinkmanCnt(Id.ToString(), "1") > 0)
                {
                    designertext.Visible = true;
                    lbdesigner.Text = lbOther3.Text;
                    lbdesigner.Font.Bold = lbOther3.Font.Bold;
                    lbdesigner.Font.Size = lbOther3.Font.Size;
                    lbdesigner.ForeColor = lbOther3.ForeColor;
                }
                else
                {
                    designertext.Visible = false;
                }
                if (!string.IsNullOrEmpty(lbbuilder.Text) || checkLinkmanCnt(Id.ToString(), "2") > 0)
                {
                    buildertext.Visible = true;
                    lbbuilder.Text = lbOther3.Text;
                    lbbuilder.Font.Bold = lbOther3.Font.Bold;
                    lbbuilder.Font.Size = lbOther3.Font.Size;
                    lbbuilder.ForeColor = lbOther3.ForeColor;
                }
                else
                {
                    buildertext.Visible = false;
                }
            
            }
        
        }
        else
        {
            if (Session["seachpower"].ToString().IndexOf(NewStr.Trim()) > -1)

            {
                lbaddress.Text = model.proaddress;
                lbowner.Text = model.proowner;
                lbdesigner.Text = model.prodesigner;
                lbbuilder.Text = model.probuilder;
                if (!string.IsNullOrEmpty(lbowner.Text) || checkLinkmanCnt(Id.ToString(), "0") > 0)
                {
                    ownertext.Visible = true;
                }
                else
                {
                    ownertext.Visible = false;
                }
                if (!string.IsNullOrEmpty(lbdesigner.Text) || checkLinkmanCnt(Id.ToString(), "1") > 0)
                {
                    designertext.Visible = true;
                }
                else
                {
                    designertext.Visible = false;
                }
                if (!string.IsNullOrEmpty(lbbuilder.Text) || checkLinkmanCnt(Id.ToString(), "2") > 0)
                {
                    buildertext.Visible = true;
                }
                else
                {
                    buildertext.Visible = false;
                }
                Bindproowner(Id.ToString());
                Bindprodesigner(Id.ToString());
                Bindprobuilder(Id.ToString());
            }
            else
            {
                lbaddress.Text = lbOther2.Text;
                lbaddress.Font.Bold = lbOther2.Font.Bold;
                lbaddress.Font.Size = lbOther2.Font.Size;
                lbaddress.ForeColor = lbOther2.ForeColor;


                lbowner.Text = model.proowner;
                lbdesigner.Text = model.prodesigner;
                lbbuilder.Text = model.probuilder;
                if (!string.IsNullOrEmpty(lbowner.Text) || checkLinkmanCnt(Id.ToString(), "0") > 0)
                {
                    ownertext.Visible = true;
                    lbowner.Text = lbOther2.Text;
                    lbowner.Font.Bold = lbOther2.Font.Bold;
                    lbowner.Font.Size = lbOther2.Font.Size;
                    lbowner.ForeColor = lbOther2.ForeColor;
                }
                else
                {
                    ownertext.Visible = false;
                }
                if (!string.IsNullOrEmpty(lbdesigner.Text) || checkLinkmanCnt(Id.ToString(), "1") > 0)
                {
                    designertext.Visible = true;
                    lbdesigner.Text = lbOther2.Text;
                    lbdesigner.Font.Bold = lbOther2.Font.Bold;
                    lbdesigner.Font.Size = lbOther2.Font.Size;
                    lbdesigner.ForeColor = lbOther2.ForeColor;
                }
                else
                {
                    designertext.Visible = false;
                }
                if (!string.IsNullOrEmpty(lbbuilder.Text) || checkLinkmanCnt(Id.ToString(), "2") > 0)
                {
                    buildertext.Visible = true;
                    lbbuilder.Text = lbOther2.Text;
                    lbbuilder.Font.Bold = lbOther2.Font.Bold;
                    lbbuilder.Font.Size = lbOther2.Font.Size;
                    lbbuilder.ForeColor = lbOther2.ForeColor;
                }
                else
                {
                    buildertext.Visible = false;
                }

            }
        }
           
           
          
        }

        private void BindInfo2(int Id)
        {
            Plinvite.Visible = true;
            JDJS.BLL.project_inforbase bll = new JDJS.BLL.project_inforbase();
            
            JDJS.Model.project_inforbase model = bll.GetModel(Id);
            Page.Title = "工程信息-" + model.proname + "-上海建定建设工程信息网";
            lbTitle.Text = model.proname;
            if (!string.IsNullOrEmpty(model.inforptime.ToString()))
            {
                lbTime.Text = DateTime.Parse(model.inforptime.ToString()).ToShortDateString();
            }
            else 
            {
                lbTime.Text = "";
            }

            lbType.Text = model.prosort;
            lbstate.Text = model.prostate;
            lbplace.Text = model.proplace;
            //lbaddress.Text = model.proaddress;
          
            lbaddress.Text = lbOther1.Text;
            lbaddress.Font.Bold = lbOther1.Font.Bold;
            lbaddress.Font.Size = lbOther1.Font.Size;
            lbaddress.ForeColor = lbOther1.ForeColor;
            if (!string.IsNullOrEmpty(model.prostime.ToString()))
            {
                lbstime.Text = DateTime.Parse(model.prostime.ToString()).ToShortDateString();
            }
            else
            {
                lbstime.Text = "";
            }
            if (!string.IsNullOrEmpty(model.proftime.ToString()))
            {
                lbftime.Text = DateTime.Parse(model.proftime.ToString()).ToShortDateString();
            }
            else
            {
                lbftime.Text = "";
            }
            lbmoney.Text = model.promoney;

            lbRemark.Text = model.prorek;
            lbowner.Text = model.proowner;
            lbdesigner.Text = model.prodesigner;
            lbbuilder.Text = model.probuilder;
            if (!string.IsNullOrEmpty(lbowner.Text) || checkLinkmanCnt(Id.ToString(), "0") > 0)
            {
                ownertext.Visible = true;
                lbowner.Text = lbOther1.Text;
                lbowner.Font.Bold = lbOther1.Font.Bold;
                lbowner.Font.Size = lbOther1.Font.Size;
                lbowner.ForeColor = lbOther1.ForeColor;
            }
            else
            {
                ownertext.Visible = false;
            }
            if (!string.IsNullOrEmpty(lbdesigner.Text) || checkLinkmanCnt(Id.ToString(), "1") > 0)
            {
                designertext.Visible = true;
                lbdesigner.Text = lbOther1.Text;
                lbdesigner.Font.Bold = lbOther1.Font.Bold;
                lbdesigner.Font.Size = lbOther1.Font.Size;
                lbdesigner.ForeColor = lbOther1.ForeColor;
            }
            else
            {
                designertext.Visible = false;
            }
            if (!string.IsNullOrEmpty(lbbuilder.Text) || checkLinkmanCnt(Id.ToString(), "2") > 0)
            {
                buildertext.Visible = true;
                lbbuilder.Text = lbOther1.Text;
                lbbuilder.Font.Bold = lbOther1.Font.Bold;
                lbbuilder.Font.Size = lbOther1.Font.Size;
                lbbuilder.ForeColor = lbOther1.ForeColor;
            }
            else
            {
                buildertext.Visible = false;
            }
            //lbOther.Text = model.其他;
        }

        protected void btnSeach_Click(object sender, EventArgs e)
        {
            string SeachTo = "project_company_seach.aspx";
            Response.Redirect(SeachTo);
        }

        private int checkLinkmanCnt(string Id,string JStype)
        { 
            string strwhere;
            //strwhere = " id in (select pepid from pro_linkman_list where proid =" + proid + ")";
            //JDJS.BLL.TClinkman bll = new JDJS.BLL.TClinkman();
            JDJS.BLL.Pro_linkman_View bll = new JDJS.BLL.Pro_linkman_View();
            strwhere = "  proid =" + Id + " and compid="+JStype;
            return bll.GetCount(strwhere);
        }

        private void Bindproowner(string Id)
        {
            string strwhere;
            //strwhere = " id in (select pepid from pro_linkman_list where proid =" + proid + ")";
            //JDJS.BLL.TClinkman bll = new JDJS.BLL.TClinkman();
            JDJS.BLL.Pro_linkman_View bll = new JDJS.BLL.Pro_linkman_View();
            strwhere = "  proid =" + Id + " and compid=0";
          if (bll.GetCount(strwhere)>0)
            {
                Repproowner.Visible=true;
                lbowner.Visible = false;
                Repproowner.DataSource = bll.GetList(strwhere);
                Repproowner.DataBind();
            }
        }
        private void Bindprodesigner(string Id)
        {
            string strwhere;
            //strwhere = " id in (select pepid from pro_linkman_list where proid =" + proid + ")";
            //JDJS.BLL.TClinkman bll = new JDJS.BLL.TClinkman();
            JDJS.BLL.Pro_linkman_View bll = new JDJS.BLL.Pro_linkman_View();
            strwhere = "  proid =" + Id + " and compid=1";
            if (bll.GetCount(strwhere) > 0)
            {
                Repprodesigner.Visible = true;
                lbdesigner.Visible = false;
                Repprodesigner.DataSource = bll.GetList(strwhere);
                Repprodesigner.DataBind();
            }
        }
        private void Bindprobuilder(string Id)
        {
            string strwhere;
            //strwhere = " id in (select pepid from pro_linkman_list where proid =" + proid + ")";
            //JDJS.BLL.TClinkman bll = new JDJS.BLL.TClinkman();
            JDJS.BLL.Pro_linkman_View bll = new JDJS.BLL.Pro_linkman_View();
            strwhere = "  proid =" + Id + " and compid=2";

            if (bll.GetCount(strwhere) > 0)
            {
                Repprobuilder.Visible = true;
                lbbuilder.Visible = false;
                Repprobuilder.DataSource = bll.GetList(strwhere);
                Repprobuilder.DataBind();
            }
        }
    }
}