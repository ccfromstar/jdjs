using System;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.HtmlControls;
using System.Data;
using System.Data.OleDb;
using System.Collections;
using PageAdmin;
public class chinabank_pay:Page
 {
   public string TrueName,Company,Sex,Email,Province,City,Address,Postcode,Tel,Fax,QQ,Msn;
   OleDbConnection conn;
   string Constr;
   void Page_Load(Object sender,EventArgs e)
    {
    //公共部分==============================================
     Member_Valicate MCheck=new Member_Valicate();
     MCheck.Member_Check("cn");
     Conn Myconn=new Conn();
     Constr=Myconn.Constr();//获取连接字符串
    //公共部分==============================================
     Data_Bind();
    }


 void Data_Bind()
 {
   string UserName=Request.Cookies["Member"].Values["UserName"].ToString();
   string sql="select * from member where username='"+UserName+"'";
   conn=new OleDbConnection(Constr);
   conn.Open();
   OleDbCommand Comm=new OleDbCommand(sql,conn);
   OleDbDataReader dr=Comm.ExecuteReader();
   if(dr.Read())
    {

      TrueName=dr["truename"].ToString();
      Company=dr["company"].ToString();
      Sex=dr["sex"].ToString();
      Email=dr["email"].ToString();
      Province=dr["province"].ToString();
      City=dr["city"].ToString();
      Address=dr["address"].ToString();
      Postcode=dr["postcode"].ToString();
      Tel=dr["tel"].ToString();
      Fax=dr["fax"].ToString();
      QQ=dr["qq"].ToString();
      Msn=dr["msn"].ToString();

    }   
   conn.Close();
  
 }




 }
