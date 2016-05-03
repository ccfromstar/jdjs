using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Text.RegularExpressions;
using System.Reflection;

namespace JDJS.Web.ProjectGL
{
    public partial class LinkmanPross : System.Web.UI.Page
    {

        public class aa { public static int addpepcnt=0,addcmpcnt=0,uppepcnt=0; } 
        protected void Page_Load(object sender, EventArgs e)
        {
           
           ProssInfo();
           LTP.Common.MessageBox.Show(this.Page, "处理完成！"+" 新增人员:"+aa.addpepcnt.ToString()+"  新增公司:"+aa.addcmpcnt.ToString()+"  更新人员:"+aa.uppepcnt.ToString());
        }
        private void ProssInfo()
        {
            /*int id;
            int 公司ID;
            int pepid;
            int proid;
            int compid;
            int disflag;
            string 工程名称;
            string 所属公司;
            string 姓名;
            string 称呼;
            string 职务;
            string 电话;
            string 传真;
            string job;
            string email;
            string 网址;
            string 地址;
            string rek;
            string newtip;*/
            int newcmpid, newlinkid;
           JDJS.BLL.projectTemp bll = new JDJS.BLL.projectTemp();
           JDJS.Model.projectTemp model = new JDJS.Model.projectTemp();
           JDJS.BLL.TCcompany blltcmp = new JDJS.BLL.TCcompany();
           JDJS.Model.TCcompany modtcmp = new JDJS.Model.TCcompany();
           JDJS.BLL.TClinkman blltclink = new JDJS.BLL.TClinkman();
           JDJS.Model.TClinkman modtlink = new JDJS.Model.TClinkman();

           Regex duzi = new Regex("独资");
           Regex hezi = new Regex("合资");
           Regex kh1 = new Regex("\\(");
           Regex kh2 = new Regex("\\)");

           //JDJS.Model.projectTemp model1 = bll.GetModel(int.Parse(Id)); 
            int startstr, endstr;
            int i=0;
            int procnt = bll.GetCount();
            DataSet ds1 = bll.GetList("", "id");
            DataSet ds2 = new DataSet();
            DataSet ds3 = new DataSet(); 
            for (i = 0; i < procnt; i++)
            {
               
               if (ds1.Tables[0].Rows[i]["id"].ToString() != "")
              {
                  model.id = int.Parse(ds1.Tables[0].Rows[i]["id"].ToString());
              }
              model.proid = int.Parse(ds1.Tables[0].Rows[i]["proid"].ToString());
              model.compid = int.Parse(ds1.Tables[0].Rows[i]["compid"].ToString());
              model.disflag = int.Parse(ds1.Tables[0].Rows[i]["disflag"].ToString());
              if (ds1.Tables[0].Rows[i]["pepid"].ToString() != "")
              {
                  model.pepid = int.Parse(ds1.Tables[0].Rows[i]["pepid"].ToString());
              }
              else
              {
                  model.pepid = 0;
              }

              model.job = ds1.Tables[0].Rows[i]["job"].ToString();
              model.rek = ds1.Tables[0].Rows[i]["rek"].ToString();
              if (ds1.Tables[0].Rows[i]["公司ID"].ToString() != "")
              {
                  model.公司ID = int.Parse(ds1.Tables[0].Rows[i]["公司ID"].ToString());
              }
              else
              {
                  model.公司ID = 0;
              }
              model.工程名称 = ds1.Tables[0].Rows[i]["工程名称"].ToString();
              model.所属公司 = ds1.Tables[0].Rows[i]["所属公司"].ToString();
              model.姓名 = ds1.Tables[0].Rows[i]["姓名"].ToString();
              model.称呼 = ds1.Tables[0].Rows[i]["称呼"].ToString();
              model.职务 = ds1.Tables[0].Rows[i]["职务"].ToString();
              model.电话 = ds1.Tables[0].Rows[i]["电话"].ToString();
              model.传真 = ds1.Tables[0].Rows[i]["传真"].ToString();
              model.email = ds1.Tables[0].Rows[i]["email"].ToString();
              model.网址 = ds1.Tables[0].Rows[i]["网址"].ToString();
              model.地址 = ds1.Tables[0].Rows[i]["地址"].ToString();
              model.newtip = ds1.Tables[0].Rows[i]["newtip"].ToString();
              if (blltcmp.GetCount(" company='" + model.所属公司 + "'") == 0)
              {
                  modtcmp.company = model.所属公司;
                  modtcmp.caddress = model.地址;
                  modtcmp.cphone = model.电话;
                  modtcmp.cfax = model.传真;
                  modtcmp.cemail = model.email;
                  modtcmp.cweb = model.网址;
                  modtcmp.newcode = ";";
                  modtcmp.cplace = model.地址.Substring(0, 2);
                  modtcmp.ctype = "本土";
                  if (duzi.IsMatch(model.所属公司))
                  {
                      modtcmp.ctype = "外资";
                  }
                  if (hezi.IsMatch(model.所属公司))
                  {
                      modtcmp.ctype = "合资";
                  }
                  try
                  {
                    startstr = kh1.Matches(model.地址)[kh1.Matches(model.地址).Count-1].Index + 1;
                    endstr = kh2.Match(model.地址, startstr).Index;
                    modtcmp.cpost= model.地址.Substring(startstr, endstr - startstr);
                  }
                  catch
                  {
                      modtcmp.cpost="";
                  }
                  newcmpid = blltcmp.Add(modtcmp);
                 

                  modtlink.linkman = model.姓名;
                  modtlink.chenghu = model.称呼;
                  modtlink.job = model.职务;
                  modtlink.companyname = model.所属公司;
                  modtlink.address = model.地址;
                  modtlink.phone = model.电话;
                  modtlink.fax = model.传真;
                  modtlink.email = model.email;
                  modtlink.cid = newcmpid;
                  modtlink.code = ";";
                  modtlink.place = model.地址.Substring(0, 2);
;                 newlinkid = blltclink.Add(modtlink);
                 

                  model.公司ID = newcmpid;
                  model.pepid = newlinkid;
                  model.newtip = "公司新增，人员新增";
                  bll.Update(model);
                  aa.addpepcnt++; aa.addcmpcnt++;
              }
              else
              {
                  if (blltclink.GetCount(" companyname='" + model.所属公司 + "' and linkman='" + model.姓名 + "'") == 0)
                  {
                      ds2 = blltcmp.GetList(1, " company='" + model.所属公司 +"'","pcid");
                      
                      modtlink.linkman = model.姓名;
                      modtlink.chenghu = model.称呼;
                      modtlink.job = model.职务;
                      modtlink.companyname = model.所属公司;
                      modtlink.address = model.地址;
                      modtlink.phone = model.电话;
                      modtlink.fax = model.传真;
                      modtlink.email = model.email;
                      modtlink.cid = int.Parse(ds2.Tables[0].Rows[0]["pcid"].ToString());
                      modtlink.code = ";";
                      modtlink.place = model.地址.Substring(0, 2);
                      newlinkid = blltclink.Add(modtlink);


                      model.公司ID = int.Parse(ds2.Tables[0].Rows[0]["pcid"].ToString());
                      model.pepid = newlinkid;
                      model.newtip = "人员新增";
                      bll.Update(model);
                      aa.addpepcnt++;
                  }
                  else
                  {
                      ds3 = blltclink.GetList(1, " companyname='" + model.所属公司 + "' and linkman='" + model.姓名 + "'", "id");
                      model.公司ID = int.Parse(ds3.Tables[0].Rows[0]["cid"].ToString());
                      model.pepid = int.Parse(ds3.Tables[0].Rows[0]["id"].ToString());
                      model.newtip = "已有人员";
                      bll.Update(model);

                      modtlink.linkman = model.姓名;
                      modtlink.chenghu = model.称呼;
                      modtlink.job = model.职务;
                      modtlink.companyname = model.所属公司;
                      modtlink.address = model.地址;
                      modtlink.phone = model.电话;
                      modtlink.fax = model.传真;
                      modtlink.email = model.email;
                      modtlink.cid = model.公司ID;
                      modtlink.code = ds3.Tables[0].Rows[0]["code"].ToString();
                      modtlink.place = model.地址.Substring(0, 2);
                      modtlink.id = model.pepid;
                      blltclink.UpdateREC(modtlink);
                      aa.uppepcnt++;
                  }
              }
            }
        }
    }
}