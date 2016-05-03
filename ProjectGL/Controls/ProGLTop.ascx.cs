using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace JDJS.Web.ProjectGL.Controls
{
    public partial class ProGLTop : System.Web.UI.UserControl
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            /*classA.Visible = false;
            classC.Visible = false;
            classD.Visible = false;
            classH.Visible = false;*/
            if (Session["AdminInfo"] != null)
            {
                lbUser.Text = ((JDJS.Model.Admin)Session["AdminInfo"]).uid;
                //LoginLevel(((JDJS.Model.Admin)Session["AdminInfo"]).classtp);
              
            }
            else
            {
                Response.Redirect("../Login.aspx");
            }
        }
      
       

     /*   private void LoginLevel(string THClass)
        {
            if (THClass != null)
            {

                switch (THClass)
                {
                    case "a":
                        classA.Visible = true;
                        //SeachNew();
                        break;
                    case "c":
                        classC.Visible = true;
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
              
            }
            else
            {
                Response.Redirect("../Login.aspx");
              
            }

        }*/

        protected void lbLoginOut_Click(object sender, EventArgs e)
        {
            Session["AdminInfo"] = null;
            Response.Redirect("../Login.aspx");
        }
  
    }
}