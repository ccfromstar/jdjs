using System;
using System.Configuration;
using System.Collections;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;
using System.Data;
using System.Data.OleDb;
using PageAdmin;

public partial class Receive : System.Web.UI.Page
{
    protected string v_oid;		// 订单号
    protected string v_pstatus;	// 支付状态码
    //20（支付成功，对使用实时银行卡进行扣款的订单）；
    //30（支付失败，对使用实时银行卡进行扣款的订单）；

    protected string v_pstring;	//支付状态描述
    protected string v_pmode;	//支付银行
    protected string v_md5info;	//MD5校验码
    protected string v_amount;	//支付金额
    protected string v_moneytype;	//币种		
    protected string remark1;	// 备注1
    protected string remark2;	// 备注1

    protected string v_md5str;

    protected string status_msg;
    OleDbConnection conn;
    protected void Page_Load(object sender, EventArgs e)
    {

       Member_Valicate MCheck=new Member_Valicate();
       MCheck.Member_Check("cn");

        // MD5密钥要跟订单提交页相同，如Send.asp里的 key = "test" ,修改""号内 test 为您的密钥
        string key = Get_ChinaBank_Key();	// 如果您还没有设置MD5密钥请登陆我们为您提供商户后台，地址：https://merchant3.chinabank.com.cn/
        // 登陆后在上面的导航栏里可能找到“资料管理”，在资料管理的二级导航栏里有“MD5密钥设置”
        // 建议您设置一个16位以上的密钥或更高，密钥最多64位，但设置16位已经足够了

        v_oid = Request["v_oid"];
        v_pstatus = Request["v_pstatus"];
        v_pstring = Request["v_pstring"];
        v_pmode = Request["v_pmode"];
        v_md5str = Request["v_md5str"];
        v_amount = Request["v_amount"];
        v_moneytype = Request["v_moneytype"];
        remark1 = Request["remark1"];
        remark2 = Request["remark2"];

        string str = v_oid + v_pstatus + v_amount + v_moneytype + key;

        str = System.Web.Security.FormsAuthentication.HashPasswordForStoringInConfigFile(str, "md5").ToUpper();    

        if (str == v_md5str)
        {

            if (v_pstatus.Equals("20"))
            {

                //支付成功
                //在这里商户可以写上自己的业务逻辑
               status_msg="支付成功,金额已经转入您的会员名下";
               double Fnc_Amount=double.Parse(v_amount);
               PageAdmin.Conn Myconn=new PageAdmin.Conn();
               string constr=Myconn.Constr();
               conn=new OleDbConnection(constr);
               conn.Open();
               if(!Fnc_rk(v_oid))
                {
                  Update_member_fnc(Fnc_Amount);
                  Update_fnc_list(Fnc_Amount,"网银在线",v_oid,"订单号:"+v_oid);
                  string M_body="支付方式：网银在线<br>订单号："+v_oid+"<br>支付金额："+v_amount;
                  SendMail(M_body);
                }
               else
                {
                  Response.Write("<script>alert('此次支付已经成功转入到您的用户名下!')</script>");
                }
              conn.Close();
            }
        }
        else
        {
            Response.Write("校验失败,数据可疑!");
            Response.End();
        }
    }


 public string  Get_ChinaBank_Key()
     {
       PageAdmin.Conn Myconn=new PageAdmin.Conn();
       string constr=Myconn.Constr();
       string sql="select * from onlinepay where onlinepay_type='chinabank'";
       OleDbConnection conn=new OleDbConnection(constr);
       conn.Open();
       string Val;
       OleDbCommand comm=new OleDbCommand(sql,conn);
       OleDbDataReader dr=comm.ExecuteReader();
       if(dr.Read())  
        { 
           Val=dr["onlinepay_key"].ToString();;
        }
      else
        {
          Val="";
          Response.Write("error");
          Response.End();
        }

       return Val;
     }


public bool Fnc_rk(string OrderId)  //判断是否入款。
  {

   string sql="select * from fnc_list where orderid='"+OrderId+"'" ;
   OleDbCommand comm=new OleDbCommand(sql,conn);
   OleDbDataReader dr=comm.ExecuteReader();
   if(dr.Read())  
     { 
       return true;
     }
   else
     {
       return false;
     }

  }


public void Update_member_fnc(double Fnc_Amount)
 {
   if(Request.Cookies["Member"]!=null)
     {
       string UserName=Request.Cookies["Member"].Values["UserName"].ToString();
       string sql="update member set fnc_rk=fnc_rk+"+Fnc_Amount+",fnc_ky=fnc_ky+"+Fnc_Amount+"  where username='"+UserName+"'";
       OleDbCommand Comm=new OleDbCommand(sql,conn);
       Comm.ExecuteNonQuery();
    }
 }

public void Update_fnc_list(double Fnc_Amount,string Rk_way,string OrderId,string Beizhu)
 {
   if(Request.Cookies["Member"]!=null)
     {
       string UserName=Request.Cookies["Member"].Values["UserName"].ToString();
       string sql="insert into fnc_list(username,fnc_type,fnc_amount,fnc_detail,orderid,beizhu) values('"+UserName+"','rk',"+Fnc_Amount+",'"+Rk_way+"','"+OrderId+"','"+Beizhu+"')";
       OleDbCommand Comm=new OleDbCommand(sql,conn);
       Comm.ExecuteNonQuery();
    }
 }

private void  SendMail(string Mail_Body) //发邮件部分
 {
  string P_Language="cn";
  string FajianName,MailTo,Mail_subject;
  string sql="select top 1 fajianname,em_order from webset where planguage='"+P_Language+"'";
  OleDbCommand comm=new OleDbCommand(sql,conn);
  OleDbDataReader dr=comm.ExecuteReader();
  if(dr.Read())
   {
    FajianName=dr["fajianname"].ToString();
    MailTo=dr["em_order"].ToString();
    Mail_subject="来自"+FajianName+"的在线支付通知";
    if(MailTo!="")
     {
      SendMail Mail=new SendMail(P_Language);   
      bool sendresult=Mail.Send(MailTo,"","",Mail_subject,Mail_Body);//发邮件
     }
   } 
}


}
