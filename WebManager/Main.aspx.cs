using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace JDJS.Web.WebManager
{
    public partial class Main : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            classA.Visible = false;
            classD.Visible = false;
            classH.Visible = false;
            if (Session["AdminInfo"] != null)
            {
                lbUser.Text = ((JDJS.Model.Admin)Session["AdminInfo"]).uid;
                LoginLevel(((JDJS.Model.Admin)Session["AdminInfo"]).classtp);
            }
            else
            {
                Response.Redirect("Login.aspx");
            }
        }

        private void LoginLevel(string THClass)
        {
            if (THClass != null)
            {

                switch (THClass)
                {
                    case "a":
                        classA.Visible = true;
                        //SeachNew();
                        break;
                    case "d":
                        classD.Visible = true;
                        //SeachPro();
                        break;
                    case "h":
                        classH.Visible = true;
                        
                        //SeachMark();
                        break;
                    
                    default:
                        break;
                }
                /*loginroad1.Style.Add("display", "none");
                logined.Style.Add("display", "");
                JDJS.Model.cust_base_info modelmb = ((JDJS.Model.cust_base_info)Session["User"]);
                JDJS.BLL.member_point bll = new JDJS.BLL.member_point();
                JDJS.Model.member_point modeljf = bll.GetModel(modelmb.newcode);
                Labeid.Text = modelmb.newcode;
                Labepoint.Text = modeljf.point.ToString();
                LabeJDB.Text = modeljf.JDB.ToString();*/
            }
            else
            {
                Response.Redirect("Login.aspx");
                //loginroad1.Style.Add("display", "");
                //logined.Style.Add("display", "none");
            }

        }

        protected void lbLoginOut_Click(object sender, EventArgs e)
        {
            Session["AdminInfo"] = null;
            Response.Redirect("Login.aspx");
        }
    }
}
